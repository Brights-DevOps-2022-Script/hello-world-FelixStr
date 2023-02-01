pipeline {
    agent {
        docker {
            image 'gcr.io/cloud-builders/kubectl'
        }
    }
    environment {
        ACRCreds = credentials('acr_creds')
        KUBECONFIG = credentials('k8s_config')
    }
    stages {
        stage('Deploy Nginx') {
            steps {
                sh "kubectl --kubeconfig=$KUBECONFIG create namespace felixstr-heureka"
                sh "kubectl --kubeconfig=$KUBECONFIG apply -f nginx-deployment.yaml"
                sh "kubectl --kubeconfig=$KUBECONFIG apply -f nginx-service.yaml"
            }
        }
    }
}
