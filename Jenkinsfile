pipeline {
    agent {
        docker {
            image 'cytopia/ansible'
        }
    }
    environment {
        ANSIBLE_KEY = credentials('ansible')
    }
    stages {
        stage('build') {
            steps {
                sh 'ansible --version'
                sh 'ansible-playbook -i hostfile --private-key=$ANSIBLE_KEY playbook.yml'
            }   
        }    
    }
}
