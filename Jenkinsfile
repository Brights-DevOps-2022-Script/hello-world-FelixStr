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
                sh 'echo building ...'
                sh "which ansible || true"
                sh "ansible --version"
                sh "ansible-playbook --version"
                sh "ansible-galaxy --version"
                sh "ansible-galaxy collection install -r requirements.yml"
                sh "ansible-playbook -i list.host --private-key=$ANSIBLE_KEY --ssh-common-args='-o StrictHostKeyChecking=no' ansible-playbook.yml"
            }
        }
    }
}
