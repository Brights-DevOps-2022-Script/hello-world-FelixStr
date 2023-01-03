pipeline {
    agent {
        docker {
            image 'cytopia/ansible'
        } 
    }
    stages {
        stage('build') {
            steps {
                sh 'ansible --version'
            }
        }
        stage(" execute Ansible") {
            steps {
                ANSIBLE_KEY = credentials('20.218.111.156')
                ansiblePlaybook credentialsId: '40fe1ee1-8a17-49c1-9663-e0978b2ce449', disableHostKeyChecking: true, installation: 'Ansible', playbook: 'playbook.yml' {
                }

            }    
        }    
    }
}
