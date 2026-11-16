
from flask import Blueprint, jsonify

patching_bp = Blueprint("patching", __name__)


@patching_bp.route("/devices", methods=["GET"])
def get_devices():
    return jsonify({
        "message": "Device API is ready",
        "devices": []
    }), 200


@patching_bp.route("/patching-records", methods=["GET"])
def get_patching_records():
    return jsonify({
        "message": "Patching records API is ready",
        "records": []
    }), 200


@patching_bp.route("/dashboard/summary", methods=["GET"])
def dashboard_summary():
    return jsonify({
        "message": "Dashboard summary API is ready"
    }), 200
