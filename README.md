# Automated Web Application Deployment with CI/CD

## Project Overview

This project demonstrates a complete **DevOps CI/CD workflow** for automating the build, testing, containerization, infrastructure provisioning, and deployment of a web application.

The application is developed using **Node.js and Express.js**, containerized using **Docker**, infrastructure is managed using **Terraform**, and the complete CI/CD process is automated using **GitHub Actions**.

The application is deployed as a Docker container on a **Google Cloud Platform (GCP) Compute Engine VM**.

---

## Technologies Used

* HTML
* CSS
* JavaScript
* Node.js
* Express.js
* Git
* GitHub
* GitHub Actions
* Docker
* Docker Compose
* Docker Hub
* Terraform
* Google Cloud Platform (GCP)
* Google Compute Engine
* Workload Identity Federation
* PowerShell

---

## Project Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    │ git push
    ▼
GitHub Actions
    │
    ├── Install Dependencies
    ├── Run Tests
    ├── Build Docker Image
    ├── Login to Docker Hub
    └── Push Docker Image
            │
            ▼
       Docker Hub
            │
            ▼
      Google Cloud VM
            │
            ├── Pull Docker Image
            ├── Stop Old Container
            ├── Remove Old Container
            └── Start New Container
                    │
                    ▼
             Running Web App
                    │
                    ▼
              Health Check
```

---

## Project Structure

```text
DevOps-Internship-Project/
│
├── app/
│   ├── public/
│   ├── views/
│   ├── package.json
│   └── server.js
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfstate
│   └── .terraform.lock.hcl
│
├── docs/
├── screenshots/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
├── README.md
└── .gitignore
```

---

# Phase 1 – Foundation Setup, Containerization & Infrastructure

### Objectives

* Develop a web application using Node.js and Express.js.
* Containerize the application using Docker.
* Test the application locally using Docker.
* Create cloud infrastructure using Terraform.
* Deploy the application to a Google Cloud Compute Engine VM.

### Completed

* Web application developed using Node.js and Express.js.
* Dockerfile created for containerization.
* Docker Compose configured for local deployment.
* Terraform configuration created for Google Cloud infrastructure.
* Google Cloud Compute Engine VM provisioned.
* Docker installed and configured on the cloud VM.
* Application successfully deployed inside a Docker container.

---

# Phase 2 – CI/CD Pipeline Automation

### Objectives

Automate the complete application deployment process using GitHub Actions.

### CI/CD Workflow

Every push to the `master` branch automatically triggers the GitHub Actions pipeline.

The pipeline performs the following steps:

1. Checkout source code.
2. Set up Node.js.
3. Install application dependencies.
4. Run application tests.
5. Build the Docker image.
6. Authenticate with Docker Hub.
7. Push the Docker image to Docker Hub.
8. Authenticate with Google Cloud using Workload Identity Federation.
9. Verify the Google Cloud VM.
10. Pull the latest Docker image on the GCP VM.
11. Stop the existing application container.
12. Remove the old container.
13. Start the new Docker container.
14. Verify the running container.
15. Perform an application health check.

---

## Docker Image

The Docker image is automatically versioned using the Git commit SHA and also tagged as `latest`.

Example:

```text
uma2608/devops-webapp:latest
uma2608/devops-webapp:<commit-sha>
```

The image is stored in Docker Hub and pulled by the Google Cloud VM during deployment.

---

## Infrastructure as Code

Terraform is used to manage the cloud infrastructure.

Terraform configuration was successfully validated and tested using:

```bash
terraform validate
terraform plan
```

The final Terraform plan confirms:

```text
No changes. Your infrastructure matches the configuration.
```

This ensures that the infrastructure is managed consistently through Infrastructure as Code.

---

## CI/CD Security

Google Cloud authentication from GitHub Actions is implemented using **Workload Identity Federation** instead of storing a Google Cloud service account key inside the repository.

Docker Hub credentials are stored securely using **GitHub Actions Secrets**.

---

## Application Health Check

The application provides a health-check endpoint:

```text
/health
```

Example response:

```json
{
  "status": "OK",
  "message": "Application is running successfully!"
}
```

The CI/CD pipeline automatically verifies this endpoint after deployment.

---

## Deployment

The application is deployed to a Google Cloud Compute Engine VM and runs inside a Docker container.

The application is exposed on:

```text
Port: 3000
```

The Docker container uses:

```text
0.0.0.0:3000 → 3000
```

The deployment uses:

```text
--restart unless-stopped
```

so the application container automatically restarts when required.

---

## Final CI/CD Result

The complete pipeline has been successfully tested.

### Successful Pipeline Stages

* ✅ Source code checkout
* ✅ Node.js setup
* ✅ Dependency installation
* ✅ Application testing
* ✅ Docker image build
* ✅ Docker Hub authentication
* ✅ Docker image push
* ✅ Google Cloud authentication
* ✅ Google Cloud VM verification
* ✅ Automated deployment
* ✅ Docker container verification
* ✅ Application health check
* ✅ Successful CI/CD pipeline execution

---

## Live Application

The application is successfully running on a Google Cloud Compute Engine VM inside a Docker container.

The application includes:

* Home page
* About page
* Contact page
* Application health-check endpoint
* Responsive web interface
* Automated deployment status

---

## DevOps Workflow

```text
Code Change
     ↓
Git Push
     ↓
GitHub
     ↓
GitHub Actions
     ↓
Install Dependencies
     ↓
Run Tests
     ↓
Build Docker Image
     ↓
Push to Docker Hub
     ↓
Authenticate with GCP
     ↓
Deploy to GCP VM
     ↓
Run Docker Container
     ↓
Health Check
     ↓
Application LIVE
```

---

## Project Status

**Project Status: COMPLETED ✅**

Both project phases have been completed successfully:

* **Phase 1:** Application containerization and cloud infrastructure provisioning
* **Phase 2:** CI/CD automation and production deployment

The project demonstrates an end-to-end automated DevOps deployment workflow using **GitHub, GitHub Actions, Docker, Docker Hub, Terraform, and Google Cloud Platform**.

---

## Author

**Uma Mahesh**
