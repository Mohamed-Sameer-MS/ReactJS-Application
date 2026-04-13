# DevOps Project Documentation

## 1. Project Overview
This project demonstrates a complete DevOps pipeline including application deployment, containerization, CI/CD automation, cloud hosting, monitoring, and alerting.

## 2. Application Deployment
- Cloned repository and deployed on AWS EC2 Ubuntu instance
- Application served via Nginx on port 80
- <img width="771" height="350" alt="gitclone" src="https://github.com/user-attachments/assets/de65e030-bde1-44ef-a2e5-fd217748a1f3" />
- <img width="1879" height="970" alt="image" src="https://github.com/user-attachments/assets/433905e7-6b9b-49af-9fe5-d349a1a30a06" />


## 3. Docker Implementation
- Created Dockerfile using nginx:alpine
- Copied build files into container
- Exposed port 80
- Used docker-compose for container orchestration


## 4. Bash Scripting
- build.sh: Builds Docker image
- deploy.sh: Deploys container using docker-compose


## 5. Version Control
- Used Git CLI for all operations
- Maintained dev branch
- Added .gitignore and .dockerignore
-<img width="1190" height="713" alt="image" src="https://github.com/user-attachments/assets/59123924-2230-4f6c-86cd-d8ab86d86294" />


## 6. Docker Hub Integration
- dev repository (public)
- prod repository (private)
- Images pushed based on branch
- <img width="1544" height="385" alt="image" src="https://github.com/user-attachments/assets/6cdf8cc8-c292-4040-9058-e88610a28d9b" />
- <img width="780" height="801" alt="image" src="https://github.com/user-attachments/assets/cf1ca352-71c9-42f3-a586-e0c0dc78e568" />
- <img width="720" height="800" alt="image" src="https://github.com/user-attachments/assets/c0f700b5-460d-490f-a212-022f3bd835ed" />



## 7. Jenkins CI/CD Pipeline
- Installed Jenkins on EC2
- Configured pipeline to:
  - Clone repo
  - Build Docker image
  - Push to Docker Hub
  - Deploy container
  pipeline {
    agent any

    environment {
        DOCKER_USER = "mohamedsameer04"
        IMAGE_NAME = "devops-app"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'dev', url: 'git@github.com:Mohamed-Sameer-MS/ReactJS-Application.git'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push to Dev Repo') {
            steps {
                sh '''
                docker tag $IMAGE_NAME $DOCKER_USER/dev:latest
                docker push $DOCKER_USER/dev:latest
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose down || true'
                sh 'docker-compose up -d'
            }
        }
    }
}

  - <img width="1291" height="690" alt="image" src="https://github.com/user-attachments/assets/055fe798-1c9f-44c2-aaab-912500fe746f" />
  - <img width="1466" height="441" alt="jenkins" src="https://github.com/user-attachments/assets/451ed23d-8e27-4bba-9094-55cf14ba1f0d" />
  - <img width="1044" height="865" alt="build" src="https://github.com/user-attachments/assets/c5289388-6d2a-4e31-acc0-94ec97dd9dbd" />
  

## 8. AWS Infrastructure
- EC2 t2.micro instance
- Security Groups:
  - Port 22: SSH (restricted)
  - Port 80: Application
  - Port 8080: Jenkins
  - <img width="1588" height="757" alt="image" src="https://github.com/user-attachments/assets/325ebf42-7fa0-4e0f-a7a4-d2d638d31c0d" />
  - <img width="1825" height="594" alt="image" src="https://github.com/user-attachments/assets/428ee27e-5d80-41d1-9d9c-ee571b978ee4" /> 
  - <img width="1566" height="484" alt="image" src="https://github.com/user-attachments/assets/be854d8f-ea9f-4ae3-9fef-14a258559433" />


## 9. Monitoring (Prometheus)
- Configured Prometheus to scrape application endpoint
- Defined alert rules for downtime detection
- <img width="593" height="464" alt="image" src="https://github.com/user-attachments/assets/acc2bc97-1038-4438-b169-47f684472263" />
- <img width="1909" height="594" alt="image" src="https://github.com/user-attachments/assets/7e9f4b9e-e94d-4d57-9469-02019eaf2211" />
- <img width="1903" height="836" alt="image" src="https://github.com/user-attachments/assets/248d89e1-9dd2-406b-8392-3d4327ebbc3d" />



## 10. Alerting (Alertmanager)
- Integrated with Prometheus
- Configured email notifications via SMTP
- <img width="762" height="333" alt="image" src="https://github.com/user-attachments/assets/c29fb33b-084e-45f5-9d0a-f01e46d071c1" />
- <img width="509" height="498" alt="image" src="https://github.com/user-attachments/assets/06af7327-f046-4a8e-a71d-0ac667b6c834" />
- <img width="1551" height="726" alt="image" src="https://github.com/user-attachments/assets/16367174-fa44-4008-b721-5860e467e528" />
- <img width="1252" height="716" alt="image" src="https://github.com/user-attachments/assets/0a38bc5b-f03f-4b2b-b45b-7777c3efa268" />

## 11. Conclusion
This project implements a full DevOps lifecycle including CI/CD, containerization, cloud deployment, monitoring, and alerting.
