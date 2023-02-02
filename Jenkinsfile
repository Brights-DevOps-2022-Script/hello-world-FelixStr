pipeline {
    agent any
    environment{
        ACR_CRED = credentials('acr_creds')
    }
    stages {
        stage('ACR Login') {
            steps{
                sh 'docker login devops2022.azurecr.io -u $ACR_CRED_USR -p $ACR_CRED_PSW'
                sh 'docker build -t devops2022.azurecr.io/felixstrauss:$GIT_COMMIT .'
                sh "docker push devops2022.azurecr.io/felixstrauss:$GIT_COMMIT"
                sh 'docker rmi devops2022.azurecr.io/felixstrauss:$GIT_COMMIT'
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
               // sh 'echo $KUB_CONF'
               // sh 'kubectl apply -f nginx-namespace.yaml'
                sh 'kubectl --kubeconfig=$KUB_CONF apply -f nginx-namespace.yaml'
                sh 'kubectl  --kubeconfig=$KUB_CONF apply -f nginx-deployment.yaml -n felixstrspace'
                sh 'kubectl --kubeconfig=$KUB_CONF set image -n felixstrspace deployment/nginx-deployment nginx=devops2022.azurecr.io/felixstrauss:${GIT_COMMIT}'
                sh 'kubectl  --kubeconfig=$KUB_CONF apply -f nginx-service.yaml -n felixstrspace'
                sh 'kubectl --kubeconfig=$KUB_CONF get pod -n felixstrspace'
                sh 'kubectl --kubeconfig=$KUB_CONF get all -n felixstrspace'
                sh 'curl http://20.238.169.98'
            }
     
        }
    }
}
        
