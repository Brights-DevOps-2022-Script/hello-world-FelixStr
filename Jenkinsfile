pipeline {
    agent any
    stages {
          stage('check') {
            steps {
                script {
                    if (sh(script: "git log -1 --pretty=%B | fgrep -ie '[skip ci]' -e '[ci skip]'", returnStatus: true) == 0) {
                    currentBuild.result = 'ABORTED'
                    error 'Aborting because commit message contains [skip ci]'
                    }}}}
        stage('ACR Login') {
            steps{
              withDockerRegistry(credentialsId: 'acr_creds', url: 'https://devops2022.azurecr.io/v2/') {
               // sh 'docker login devops2022.azurecr.io -u $ACR_CRED_USR -p $ACR_CRED_PSW'
                sh 'docker build -t devops2022.azurecr.io/felixstrauss:$GIT_COMMIT .'
                sh "docker push devops2022.azurecr.io/felixstrauss:$GIT_COMMIT"
                sh 'docker rmi devops2022.azurecr.io/felixstrauss:$GIT_COMMIT'
            }
        }
        }
        stage('TEST DOCKER IMAGE') {
            steps {
                 script {
                    def imageTag = "felixstrauss:$GIT_COMMIT"
                    def acrLoginServer = "devops2022.azurecr.io"
                    def imageExists = sh(script: "set +x curl -fL ${acrLoginServer}/v2/manifests/${imageTag}", returnStatus: true) == 0
                    if (!imageExists) {
                        error("The image ${imageTag} was not found in the registry ${acrLoginServer}")
                    }
                }
            }
        }
      stage('DEPLOY DEPLOYMENT FILE') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '2eb747c4-f19f-4601-ab83-359462e62482',  url: 'https://github.com/Brights-DevOps-2022-Script/argocd.git']]])
                withCredentials([usernamePassword(credentialsId: '2eb747c4-f19f-4601-ab83-359462e62482', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh("""
                      echo 'apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - nginx.yaml
images:
  - name: felixstrauss
    newName: devops2022.azurecr.io/felixstrauss:${GIT_COMMIT}' > felixstrauss-argocd/kustomization.yml
                    """)
                    sh("git pull https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Brights-DevOps-2022-Script/team-3-argoTest.git HEAD:main")
                    sh("git checkout main")
                    sh("git add felixstrauss-argocd/kustomization.yml")
                    sh("git commit -m 'kustom [skip ci]'")
                    sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Brights-DevOps-2022-Script/team-3-argoTest.git HEAD:main")
                }
            }
        }
        stage('DEPLOY DEPLOYMENT FILE2') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'MessageExclusion', excludedMessage: '.*\\[skip ci\\].*']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '2eb747c4-f19f-4601-ab83-359462e62482',  url: 'https://github.com/Brights-DevOps-2022-Script/hello-world-FelixStr.git']]])
                withCredentials([usernamePassword(credentialsId: '2eb747c4-f19f-4601-ab83-359462e62482', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh("""
                        echo 'apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - nginx.yaml
images:
  - name: FelixStr-NGINX
    newName: devops2022.azurecr.io/felixstrauss:${GIT_COMMIT}' > kustomization.yml
                    """)
                    sh("git add kustomization.yml")
                    sh("git commit -m 'kustomization [skip ci]'")
                    sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Brights-DevOps-2022-Script/team-3-argoTest.git HEAD:main")
            

        
        
        
        
        
        
        
        
        
        
        
        
        
        
     
        
        // stage('deploy') {
          //  agent {
            //    docker {
              //      image 'alpine/k8s:1.23.16'
}}
            }
           // environment{
              //   KUB_CONF = credentials('k8s_config')
            }
           // steps {
               // sh 'echo $KUB_CONF'
               // sh 'kubectl apply -f nginx-namespace.yaml'
            //    sh 'kubectl --kubeconfig=$KUB_CONF apply -f nginx-namespace.yaml'
              //  sh 'kubectl  --kubeconfig=$KUB_CONF apply -f nginx-deployment.yaml -n felixstrspace'
                //sh 'kubectl --kubeconfig=$KUB_CONF set image -n felixstrspace deployment/nginx-deployment nginx=devops2022.azurecr.io/felixstrauss:${GIT_COMMIT}'
              //  sh 'kubectl  --kubeconfig=$KUB_CONF apply -f nginx-service.yaml -n felixstrspace'
              //  sh 'kubectl --kubeconfig=$KUB_CONF get pod -n felixstrspace'
              //  sh 'kubectl --kubeconfig=$KUB_CONF get all -n felixstrspace'
            //    sh 'curl http://20.238.169.98'
            }
     
    
        
