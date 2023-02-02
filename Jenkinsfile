pipeline {
    agent {
        docker {
            image 'devops2022.azurecr.io/nginx:ingtest4'
             args '-v /var/run/docker.sock:/var/run/docker.sock -u 111:998' //-u 111:998 is jenkins user in cat /etc/passwd
        }
    }
    environment {
        ACRCreds = credentials('acr_creds')
        KUBECONFIG = credentials('k8s_config')
    }
    stages {
        stage('Deploy Nginx') {
            steps {
                sh 'id'
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
                
                sh 'docker login devops2022.azurecr.io -u ${ACRCreds_USR} -p ${ACRCreds_PSW}'
                sh "docker tag felixstr4 devops2022.azurecr.io/devops2022.azurecr.io/nginx"
                sh "docker push devops2022.azurecr.io/nginx:felixstr4"
            }
        }
    }
}
