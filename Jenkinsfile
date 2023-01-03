pipeline {
    agent {
        docker {
            image 'cytopia/ansible'
        }
    }
    environment {
        ANSIBLE_KEY = credentials('20.218.111.156')
        ANSIBLE_CONFIG = "etc/ansible/ansible.cfg"
    }
    stages {
        stage('build') {
            steps {
                sh 'ansible --version'
                sh 'ANSIBLE_CONFIG=$ANSIBLE_CONFIG ansible-playbook -i hostfile --private-key=$ANSIBLE_KEY playbook.yml'
            }   
        }    
    }
}
