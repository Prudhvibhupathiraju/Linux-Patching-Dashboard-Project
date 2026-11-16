
from flask import Flask, jsonify
from config.settings import Config

from routes.health import health_bp
from routes.patching import patching_bp


def create_app():
    app = Flask(__name__)

    app.config.from_object(Config)

    # Register API routes
    app.register_blueprint(health_bp, url_prefix="/api")
    app.register_blueprint(patching_bp, url_prefix="/api")

    @app.route("/")
    def index():
        return jsonify({
            "application": "Linux Patching Dashboard",
            "status": "running"
        })

    @app.errorhandler(404)
    def not_found(error):
        return jsonify({"error": "Endpoint not found"}), 404

    return app


app = create_app()


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
