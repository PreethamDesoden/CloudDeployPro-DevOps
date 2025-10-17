import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [tasks, setTasks] = useState([]);
  const [newTask, setNewTask] = useState('');
  const [loading, setLoading] = useState(true);

  // Fetch tasks from backend when app loads
  useEffect(() => {
    fetchTasks();
  }, []);

  const fetchTasks = async () => {
    try {
      const response = await fetch(`http://${window.location.hostname}:5000/tasks`);
      const data = await response.json();
      setTasks(data);
      setLoading(false);
    } catch (error) {
      console.error('Error fetching tasks:', error);
      setLoading(false);
    }
  };

  const addTask = async () => {
    if (newTask.trim() === '') return;

    try {
      const response = await fetch(`http://${window.location.hostname}:5000/tasks`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          title: newTask,
          completed: false
        }),
      });
      const data = await response.json();
      setTasks([...tasks, data]);
      setNewTask('');
    } catch (error) {
      console.error('Error adding task:', error);
    }
  };

  return (
    <div className="App">
      <div className="container">
        <h1>CloudDeployPro - Full CI/CD Pipeline ✅</h1>
        <p className="subtitle">Full-Stack App with DevOps Pipeline</p>

        <div className="add-task">
          <input
            type="text"
            placeholder="Enter a new task..."
            value={newTask}
            onChange={(e) => setNewTask(e.target.value)}
            onKeyPress={(e) => e.key === 'Enter' && addTask()}
          />
          <button onClick={addTask}>Add Task</button>
        </div>

        <div className="task-list">
          {loading ? (
            <p>Loading tasks...</p>
          ) : tasks.length === 0 ? (
            <p>No tasks yet. Add one above!</p>
          ) : (
            tasks.map((task) => (
              <div key={task.id} className="task-item">
                <span>{task.title}</span>
                <span className="task-status">
                  {task.completed ? '✅' : '⏳'}
                </span>
              </div>
            ))
          )}
        </div>
      </div>
    </div>
  );
}

export default App;