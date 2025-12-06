pipeline {
    agent any

    environment {
        KUBECONFIG = "/root/.kube/config"
    }

    stages {
        stage('Checkout Infra') {
            steps {
                git url: 'https://github.com/CarMata/cicd.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'cd terraform && terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'cd terraform && terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'cd terraform && terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'cd terraform && terraform apply -auto-approve'
            }
        }
    }
}
