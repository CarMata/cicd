pipeline {
    agent any

    environment {
        KUBECONFIG = "/var/jenkins_home/.kube/config"
    }

    stages {
        stage("Checkout") {
            steps {
                checkout scm
            }
        }

        stage("Deploy to Kubernetes") {
            steps {
                sh """
                echo "Applying Kubernetes manifests with kubectl..."
                kubectl apply --validate=false -f k8s-manifests/
                """
            }
        }

        stage("Verify") {
            steps {
                sh """
                echo "Listing pods..."
                kubectl get pods -o wide
                """
            }
        }
    }
}

