# CloudDeployPro - DevOps Portfolio Project

![CI/CD](https://github.com/PreethamDesoden/CloudDeployPro-DevOps/actions/workflows/docker-build.yml/badge.svg)
A full-stack task manager application demonstrating modern DevOps practices including containerization, CI/CD pipelines, and cloud deployment.

## 🚀 Project Overview

**CloudDeployPro** is a professional portfolio project showcasing end-to-end DevOps skills from development to deployment. Built with React and Flask, containerized with Docker, and designed for AWS deployment with Infrastructure as Code.

### 🌐 **Live Deployment**

**This application has been successfully deployed to AWS and can be made available for live demonstration upon request.**

The deployment includes:
- ✅ AWS EC2 t2.micro instance (Free Tier eligible)
- ✅ Automated Docker container deployment
- ✅ Infrastructure provisioned via Terraform (Infrastructure as Code)
- ✅ Public accessibility with proper security group configuration

*Note: The AWS instance is currently stopped to conserve free-tier resources. It can be started within minutes for live demonstrations during interviews or portfolio reviews.*

**Deployment Architecture:**
- Frontend served on port 3000
- Backend API on port 5000
- Both applications running in Docker containers
- Fully automated deployment using Terraform

### Key Features
- ✅ Full-stack web application (React + Flask)
- ✅ RESTful API architecture
- ✅ Containerized with Docker
- ✅ Multi-container orchestration with Docker Compose
- 🔄 CI/CD pipeline (coming soon)
- ☁️ AWS deployment (coming soon)
- 📊 Monitoring & logging (coming soon)

## 🛠️ Tech Stack

### Frontend
- React.js
- Modern CSS with responsive design
- Fetch API for backend communication

### Backend
- Python Flask
- RESTful API
- CORS enabled for cross-origin requests

### DevOps
- Docker & Docker Compose
- GitHub for version control
- Docker Hub for image registry
- Terraform (planned)
- GitHub Actions (planned)
- AWS (EC2/ECS) (planned)

## 📁 Project Structure

```
CloudDeployPro-DevOps/
├── backend/
│   ├── app.py              # Flask API
│   ├── requirements.txt    # Python dependencies
│   ├── Dockerfile          # Backend container config
│   └── .dockerignore
├── frontend/
│   ├── src/
│   │   ├── App.js          # React main component
│   │   └── App.css         # Styling
│   ├── package.json        # Node dependencies
│   ├── Dockerfile          # Frontend container config
│   └── .dockerignore
├── docker-compose.yml      # Multi-container orchestration
├── .gitignore
└── README.md
```

## 🐳 Docker Images

Public Docker images available on Docker Hub:
- **Backend**: `preetham1210/clouddeploypro-backend:latest`
- **Frontend**: `preetham1210/clouddeploypro-frontend:latest`

## 🚀 Quick Start

### Prerequisites
- Docker Desktop installed
- Docker Compose installed

### Run Locally with Docker Compose

1. Clone the repository:
```bash
git clone https://github.com/PreethamDesoden/CloudDeployPro-DevOps.git
cd CloudDeployPro-DevOps
```

2. Start the application:
```bash
docker-compose up -d
```

3. Access the application:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000

4. Stop the application:
```bash
docker-compose down
```

### Run Using Docker Images (No Build Required)

```bash
# Pull images
docker pull preetham1210/clouddeploypro-backend:latest
docker pull preetham1210/clouddeploypro-frontend:latest

# Run backend
docker run -d -p 5000:5000 --name backend preetham1210/clouddeploypro-backend:latest

# Run frontend
docker run -d -p 3000:3000 --name frontend preetham1210/clouddeploypro-frontend:latest
```

## 📡 API Endpoints

### Base URL: `http://localhost:5000`

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Welcome message |
| GET | `/tasks` | Get all tasks |
| POST | `/tasks` | Create new task |

### Example Request
```bash
curl -X POST http://localhost:5000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "New Task", "completed": false}'
```

## 🎯 Learning Objectives

This project demonstrates proficiency in:

1. **Full-Stack Development**
   - Building RESTful APIs
   - Creating responsive frontends
   - Client-server communication

2. **Containerization**
   - Writing efficient Dockerfiles
   - Multi-stage builds
   - Container orchestration

3. **DevOps Practices**
   - Version control with Git
   - Container registries
   - Infrastructure as Code (planned)
   - CI/CD automation (planned)

4. **Cloud Deployment**
   - AWS services (planned)
   - Scalable architecture (planned)
   - Monitoring & observability (planned)

## 📋 Roadmap

- [x] Build full-stack application
- [x] Dockerize backend and frontend
- [x] Docker Compose setup
- [x] Push to Docker Hub
- [ ] Write Terraform scripts for AWS infrastructure
- [ ] Deploy to AWS (EC2/ECS)
- [ ] Implement CI/CD with GitHub Actions
- [ ] Add monitoring with CloudWatch/Grafana
- [ ] Set up automated testing
- [ ] Add SSL/HTTPS

## 👨‍💻 Author

**Preetham B**
- GitHub: [@PreethamDesoden](https://github.com/PreethamDesoden)
- LinkedIn: [Preetham-B](https://linkedin.com/in/preetham-b-)
- Email: preethamdesoden25983@gmail.com

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

Built as part of my journey to master Cloud and DevOps engineering, demonstrating practical skills for real-world deployment scenarios.

---

⭐ **Star this repo if you find it useful!**
