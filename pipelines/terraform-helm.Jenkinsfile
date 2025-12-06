pipeline {
    agent any

    environment {
        KUBECONFIG = "/root/.kube/config"
    }

    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }

        stage("Init Terraform") {
            steps {
                sh """
                cd terraform
                terraform init
                """
            }
        }

        stage("Plan Terraform + Helm") {
            steps {
                sh """
                cd terraform
                terraform plan
                """
            }
        }

        stage("Apply Terraform + Helm") {
            steps {
                sh """
                cd terraform
                terraform apply -auto-approve
                """
            }
        }
    }
}

