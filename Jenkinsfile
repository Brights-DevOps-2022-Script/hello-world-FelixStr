pipeline {
    agent {
        docker {
            image 'devops2022.azurecr/alpine-simon'
            args '--entrypoint='
        }
    }
    environment {
        ACRCreds = credentials('acr_creds')
        KUBECONFIG = credentials('k8s_config')
    }
    stages {
        stage('Deploy Nginx') {
            steps {
                 sh 'kubectl apply -f nginx-namespace.yaml'
                //sh "kubectl --kubeconfig=$KUBECONFIG create namespace felixstrauss"
                sh "kubectl  apply -f nginx-deployment.yaml -n felixstrspace"
                sh "kubectl  apply -f nginx-service.yaml -n felixstrspace"
                sh 'kubectl get pod -n felixstrspace'
                sh 'kubectl get all -n felixstrspace'
            }
        }
         stage('Push to ACR') {
            steps {
                sh "docker login devops2022.azurecr.io -u jester -p ${ACRCreds}"
                sh 'npm install'
                sh 'npm run build'
                sh "docker tag felixstr4 devops2022.azurecr.io/devops2022.azurecr.io/nginx"
                sh "docker push devops2022.azurecr.io/nginx:felixstr4"
            }
        }
    }
}
