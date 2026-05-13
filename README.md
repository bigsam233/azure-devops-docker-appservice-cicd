# eShopOnWeb – Azure DevOps CI/CD Pipeline with Docker, ACR & Azure App Service

# Project Overview

This project demonstrates a complete end-to-end CI/CD pipeline implementation using Azure DevOps, Docker, Azure Container Registry (ACR), Azure App Service, Bicep Infrastructure as Code (IaC), and Managed Identities.

The primary objective of this project was to containerize the Microsoft eShopOnWeb application, automate Docker image builds, push images to Azure Container Registry, and deploy the application to Azure App Service using Azure DevOps pipelines.

This project demonstrates practical DevOps engineering concepts including:

- Continuous Integration (CI)
- Continuous Deployment (CD)
- Docker containerization
- Infrastructure as Code (IaC)
- Azure App Service deployments
- Azure Container Registry integration
- IAM role assignments
- Managed Identity authentication
- YAML pipeline automation
- Pipeline troubleshooting and debugging

---

# Project Architecture

![Architecture Diagram](architecture/architecture-diagram.png)

## Architecture Flow

1. Source code is stored in GitHub.
2. Azure DevOps CI pipeline builds the Docker image.
3. Docker image is pushed to Azure Container Registry (ACR).
4. Azure DevOps CD pipeline deploys Azure infrastructure using Bicep.
5. Azure App Service pulls the Docker image from ACR.
6. The containerized eShopOnWeb application is deployed and accessible through Azure App Service.

---

# Technologies Used

- Azure DevOps
- Docker
- Azure Container Registry (ACR)
- Azure App Service (Linux)
- Azure Managed Identity
- Azure IAM / Role Assignments
- Bicep
- YAML Pipelines
- GitHub
- .NET

---

# Resources Used

The following Azure resources were provisioned and configured during the implementation:

| Resource | Purpose |
|---|---|
| Azure Container Registry | Stores Docker container images |
| Azure App Service Plan | Hosting plan for the web application |
| Azure App Service | Hosts the Docker container |
| Managed Identity | Secure authentication to ACR |
| IAM Role Assignment | Grants AcrPull permissions |
| Azure DevOps Pipelines | CI/CD automation |
| Bicep Templates | Infrastructure provisioning |

---

# CI/CD Workflows

## Continuous Integration (CI)

The CI pipeline automates the Docker image build and registry push process.

### CI Workflow

1. Deploy Azure Container Registry using Bicep.
2. Authenticate to Azure Container Registry.
3. Build Docker image using a Microsoft-hosted Ubuntu agent.
4. Tag Docker images using:
   - Build ID
   - latest
5. Push Docker image to Azure Container Registry.

### CI Pipeline File

```bash
pipelines/eshoponweb-ci-docker.yml
```

---

## Continuous Deployment (CD)

The CD pipeline automates infrastructure provisioning and application deployment.

### CD Workflow

1. Deploy Azure App Service Plan using Bicep.
2. Deploy Azure App Service (Linux Container).
3. Configure Managed Identity.
4. Assign AcrPull role to App Service.
5. Configure App Service container settings.
6. Deploy Docker container from ACR.

### CD Pipeline File

```bash
pipelines/eshoponweb-cd-webapp-docker.yml
```

---

# Implementation Steps

## Step 1 — Clone the eShopOnWeb Application

Cloned the Microsoft eShopOnWeb application repository:

```bash
https://github.com/MicrosoftLearning/eShopOnWeb
```

---

## Step 2 — Configure Azure Service Connections

Created:

- Azure Resource Manager service connection
- Azure Container Registry service connection

Configured required IAM permissions and role assignments.

---

## Step 3 — Configure Docker Support

Updated the Dockerfile and build context for the .NET application.

Resolved:

- Docker build path issues
- dotnet restore errors
- Docker build context problems

---

## Step 4 — Build the CI Pipeline

Created and configured the CI pipeline:

```bash
pipelines/eshoponweb-ci-docker.yml
```

The CI pipeline:

- Builds Docker images
- Pushes images to Azure Container Registry
- Automates container image versioning

---

## Step 5 — Build the CD Pipeline

Created and configured the CD pipeline:

```bash
pipelines/eshoponweb-cd-webapp-docker.yml
```

The CD pipeline:

- Deploys Azure infrastructure using Bicep
- Configures App Service
- Assigns IAM permissions
- Deploys the Docker container

---

## Step 6 — Configure IAM & Managed Identity

Configured:

- Managed Identity for Azure App Service
- AcrPull role assignment

This enabled secure image pulls from Azure Container Registry without storing credentials.

---

## Step 7 — Validate Deployment

Successfully validated:

- Docker image pushed to ACR
- Azure App Service deployment
- Running containerized eShopOnWeb application
- End-to-end CI/CD automation

---

# Screenshots

## CI Pipeline Setup

![CI Pipeline Setup](screenshots/ci-pipeline-setup.png)

---

## CI Pipeline Successfully Completed

![CI Pipeline](screenshots/ci-pipeline-success.png)

---

## CD Pipeline Setup

![CD Pipeline Setup](screenshots/cd-pipeline-setup.png)

---

## CD Pipeline Successfully Completed

![CD Pipeline](screenshots/cd-pipeline-success.png)

---

## Docker Registry Service Connection

![Docker Registry Service Connection](screenshots/docker-registry-service-connection.png)

---

## Azure Container Registry Repository

![ACR Repository](screenshots/acr-repository.png)

---

## Azure App Service Overview

![App Service](screenshots/app-service-overview.png)

---

## Azure Resources Created

![Azure Resources](screenshots/azure-resources-overview.png)

---

## IAM Role Assignment

![IAM Role Assignment](screenshots/iam-role-assignment.png)

---

## Running eShopOnWeb Application

![Running Application](screenshots/running-eshoponweb-app.png)

---

# Project Structure

```bash
eshoponweb-azure-devops-cicd/
│
├── pipelines/
│   ├── eshoponweb-ci-docker.yml
│   └── eshoponweb-cd-webapp-docker.yml
│
├── infra/
│   ├── acr.bicep
│   ├── webapp-docker.bicep
│   └── webapp-to-acr-roleassignment.bicep
│
├── architecture/
│   └── architecture-diagram.png
│
├── screenshots/
│   ├── ci-pipeline-setup.png
│   ├── ci-pipeline-success.png
│   ├── cd-pipeline-setup.png
│   ├── cd-pipeline-success.png
│   ├── docker-registry-service-connection.png
│   ├── acr-repository.png
│   ├── app-service-overview.png
│   ├── azure-resources-overview.png
│   ├── iam-role-assignment.png
│   └── running-eshoponweb-app.png
│
├── docs/
│   ├── troubleshooting.md
│   ├── lessons-learned.md
│   └── deployment-steps.md
│
├── src/
│
└── README.md
```

---

# Source Application

Microsoft eShopOnWeb:

https://github.com/MicrosoftLearning/eShopOnWeb

---

# Author

Samuel Tettey-Fio

DevOps | Cloud Engineering | AWS & Azure

---

# Final Result

Successfully implemented a production-style Azure DevOps CI/CD pipeline that:

- Builds Docker images
- Pushes images to Azure Container Registry
- Deploys containers to Azure App Service
- Uses Managed Identity for secure authentication
- Automates infrastructure deployment using Bicep
- Demonstrates real-world DevOps engineering practices

