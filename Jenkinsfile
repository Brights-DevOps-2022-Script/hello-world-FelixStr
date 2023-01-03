pipeline {
    agent {
        docker {
            image 'cytopia/ansible'
        }
    }
    environment {
        ANSIBLE_KEY = credentials('20.218.111.156')
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
