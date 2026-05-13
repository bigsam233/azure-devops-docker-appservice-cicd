# Azure DevOps CI/CD Pipeline with Docker, ACR & Azure App Service

# Project Overview

This project demonstrates a complete end-to-end CI/CD pipeline implementation using Azure DevOps, Docker, Azure Container Registry (ACR), Azure App Service, Bicep Infrastructure as Code (IaC), and Managed Identities.

The primary objective of this project was to containerize the Microsoft eShopOnWeb application, automate Docker image builds, push images to Azure Container Registry, and deploy the application to Azure App Service using Azure DevOps pipelines.

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

# Project Architecture

<img width="1536" height="1024" alt="architecture diagram image" src="https://github.com/user-attachments/assets/819fc5d5-dd39-444f-9de7-48c12c6d9322" />


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

<img width="1565" height="898" alt="01-ci-pipeline-setup" src="https://github.com/user-attachments/assets/b331b4f5-bc26-45af-a66f-d24f195838af" />


---

## CI Pipeline Successfully Completed

<img width="1565" height="898" alt="02-ci successfully deployed" src="https://github.com/user-attachments/assets/0e25793d-1f0f-4c79-9230-6d5722c2bbaa" />


---

## CD Pipeline Setup

<img width="1565" height="914" alt="03-setting up CD with Azure Pipelines" src="https://github.com/user-attachments/assets/432ae8da-6c9a-41c6-a66a-e985688e4668" />


---

## CD Pipeline Successfully Completed

<img width="1565" height="914" alt="04-cd successfully deployed" src="https://github.com/user-attachments/assets/1b0280a9-c314-465f-9467-97135fef85f9" />


---

## Docker Registry Service Connection

<img width="1573" height="871" alt="05-docker-registry-service-connection" src="https://github.com/user-attachments/assets/28707091-c03a-461a-bd2b-1c27c759f87c" />


---

## Azure Container Registry Repository

<img width="1565" height="898" alt="06-acr-repository" src="https://github.com/user-attachments/assets/56025f98-d0a1-466a-a71e-e00bee314c37" />


---

## Azure App Service Overview

<img width="1570" height="926" alt="07-app-service-overview" src="https://github.com/user-attachments/assets/c2009a5d-8f2a-4a41-b4b2-4922adb453eb" />


---

## Azure Resources Created

<img width="1565" height="914" alt="08-azure-resources-overview" src="https://github.com/user-attachments/assets/6871c1ac-8c38-4fc0-bcb1-e7bf62b71e03" />


---

## IAM Role Assignment

<img width="1455" height="916" alt="09-iam-role-assignment" src="https://github.com/user-attachments/assets/5c841a41-8576-4aa3-8ec6-322505003ea5" />


---

## Running eShopOnWeb Application

<img width="1312" height="953" alt="10-running-eshoponweb-app" src="https://github.com/user-attachments/assets/0c359aae-8252-4325-8ba5-c9ce527a965b" />

---

# Source Application

Microsoft eShopOnWeb:

https://github.com/MicrosoftLearning/eShopOnWeb

---

## Author

Samuel Tettey-Fio

DevOps | Cloud Engineering | AWS & Azure

---

## 📬 Contact  
If you’re a recruiter or hiring manager looking for a Cloud/DevOps Engineer, feel free to connect via email at samuel.tfio@gmail.com

## 🔗 Links

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/samuel-tettey-fio/)


