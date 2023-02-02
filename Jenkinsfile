pipeline {
    agent any
    environment{
        ACR_CRED = credentials('acr_creds')
    }
    stages {
        stage('ACR Login') {
            steps{
                sh 'docker login devops2022.azurecr.io -u $ACR_CRED_USR -p $ACR_CRED_PSW'
               // sh "docker tag felixstr4 devops2022.azurecr.io/devops2022.azurecr.io/nginx"
                //sh "docker push devops2022.azurecr.io/nginx:felixstr4"
            }
        }
         stage('deploy') {
            agent {
                docker {
                    image 'alpine/k8s:1.23.16'
                }
            }
            environment{
                 KUB_CONF = credentials('k8s_config')
            }
            steps {
                sh 'echo $KUB_CONF'
                 sh 'kubectl apply -f nginx-namespace.yaml'
                //sh "kubectl --kubeconfig=$KUBECONFIG create namespace felixstrauss"
                sh "kubectl  apply -f nginx-deployment.yaml -n felixstrspace"
                sh "kubectl  apply -f nginx-service.yaml -n felixstrspace"
                sh 'kubectl get pod -n felixstrspace'
                sh 'kubectl get all -n felixstrspace'
                
            }
     
        }
    }
}
        
