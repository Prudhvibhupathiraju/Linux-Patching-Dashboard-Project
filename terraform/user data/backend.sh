
#!/bin/bash
#
# Linux Patching Dashboard
# Backend EC2 Bootstrap
# OS: Amazon Linux 2023
# Application: Python Flask + Gunicorn
# Database: Amazon RDS MySQL
#

set -Eeuo pipefail

LOG_FILE="/var/log/backend-bootstrap.log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "========================================="
echo "Starting Backend EC2 Bootstrap"
echo "Date: $(date)"
echo "========================================="

# --------------------------------------------------
# 1. Install system packages
# --------------------------------------------------

echo "[1/10] Installing system packages"

dnf update -y

dnf install -y \
    python3 \
    python3-pip \
    python3-devel \
    git \
    curl \
    gcc \
    gcc-c++ \
    make \
    mariadb105

# --------------------------------------------------
# 2. Create application user
# --------------------------------------------------

echo "[2/10] Creating backend service user"

if ! id backend &>/dev/null; then
    useradd --system \
        --home-dir /opt/linux-patching-backend \
        --shell /sbin/nologin \
        backend
fi

# --------------------------------------------------
# 3. Create application directories
# --------------------------------------------------

echo "[3/10] Creating application directories"

APP_DIR="/opt/linux-patching-backend"

mkdir -p "$APP_DIR"
mkdir -p "$APP_DIR/logs"

chown -R backend:backend "$APP_DIR"
chmod 750 "$APP_DIR"

# --------------------------------------------------
# 4. Create Python virtual environment
# --------------------------------------------------

echo "[4/10] Creating Python virtual environment"

python3 -m venv "$APP_DIR/venv"

"$APP_DIR/venv/bin/pip" install --upgrade pip setuptools wheel

# --------------------------------------------------
# 5. Install Python dependencies
# --------------------------------------------------

echo "[5/10] Installing Python dependencies"

cat > "$APP_DIR/requirements.txt" <<'EOF'
Flask==3.1.3
gunicorn
PyMySQL
python-dotenv
EOF

"$APP_DIR/venv/bin/pip" install \
    -r "$APP_DIR/requirements.txt"

# --------------------------------------------------
# 6. Create initial Flask application
# --------------------------------------------------

echo "[6/10] Configuring Flask application"

if [ ! -f "$APP_DIR/app.py" ]; then

cat > "$APP_DIR/app.py" <<'PYTHON'
from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/api/health", methods=["GET"])
def health():
    return jsonify({
        "status": "healthy",
        "application": "Linux Patching Dashboard Backend"
    }), 200

@app.route("/", methods=["GET"])
def index():
    return jsonify({
        "message": "Linux Patching Dashboard Backend API"
    }), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
PYTHON

fi

# --------------------------------------------------
# 7. Configure environment variables
# --------------------------------------------------

echo "[7/10] Configuring application environment"

if [ ! -f /etc/linux-patching-backend.env ]; then

cat > /etc/linux-patching-backend.env <<'EOF'
FLASK_ENV=production
DB_HOST=REPLACE_WITH_RDS_ENDPOINT
DB_PORT=3306
DB_NAME=REPLACE_WITH_DATABASE_NAME
DB_USER=admin
DB_PASSWORD=
EOF

fi

chmod 600 /etc/linux-patching-backend.env

# --------------------------------------------------
# 8. Configure systemd service
# --------------------------------------------------

echo "[8/10] Creating systemd service"

cat > /etc/systemd/system/linux-patching-backend.service <<EOF
[Unit]
Description=Linux Patching Dashboard Flask Backend
After=network-online.target
Wants=network-online.target

[Service]
User=backend
Group=backend
WorkingDirectory=$APP_DIR

EnvironmentFile=-/etc/linux-patching-backend.env

ExecStart=$APP_DIR/venv/bin/gunicorn \
    --workers 2 \
    --bind 0.0.0.0:5000 \
    --access-logfile - \
    --error-logfile - \
    app:app

Restart=always
RestartSec=5

NoNewPrivileges=true
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF

chown -R backend:backend "$APP_DIR"

# --------------------------------------------------
# 9. Enable and start backend service
# --------------------------------------------------

echo "[9/10] Starting backend service"

systemctl daemon-reload

systemctl enable linux-patching-backend

systemctl restart linux-patching-backend

# --------------------------------------------------
# 10. Validate backend service
# --------------------------------------------------

echo "[10/10] Validating backend"

sleep 5

if systemctl is-active --quiet linux-patching-backend; then
    echo "Backend service is running successfully"
else
    echo "ERROR: Backend service failed to start"
    systemctl status linux-patching-backend --no-pager || true
    exit 1
fi

echo "========================================="
echo "Backend Bootstrap Completed"
echo "Application Directory: $APP_DIR"
echo "Service: linux-patching-backend"
echo "Port: 5000"
echo "========================================="
