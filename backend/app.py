from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Allow React frontend to talk to this API

# In-memory storage (simple list)
tasks = [
    {"id": 1, "title": "Learn Docker", "completed": False},
    {"id": 2, "title": "Deploy to AWS", "completed": False}
]

@app.route('/')
def home():
    return jsonify({"message": "CloudDeployPro API is running!"})

@app.route('/tasks', methods=['GET'])
def get_tasks():
    return jsonify(tasks)

@app.route('/tasks', methods=['POST'])
def add_task():
    new_task = request.json
    new_task['id'] = len(tasks) + 1
    tasks.append(new_task)
    return jsonify(new_task), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)