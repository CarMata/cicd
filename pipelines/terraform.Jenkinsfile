pipeline {
    agent any

    environment {
        KUBECONFIG = "/root/.kube/config"
    }

    stages {

        stage('Checkout Infra Code') {
            steps {
                checkout scm
                sh "ls -la"
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            input {
                message "¿Aplicar cambios?"
            }
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh "kubectl get pods -o wide"
                sh "kubectl get svc -o wide"
            }
        }
    }
}
