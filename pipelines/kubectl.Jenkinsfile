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

        stage("Port Forward") {
            steps {
                sh """
                echo "Forwarding service port to localhost..."
                # Ejecutar en background para que no bloquee Jenkins
                nohup kubectl port-forward svc/demo-service 8082:80 > port-forward.log 2>&1 &
                echo "Port-forward started on localhost:8082 -> svc/demo-service:80"
                """
            }
        }
    }
}






