pipeline {
    agent {
        docker {
            image 'cytopia/ansible'
        }
    }
    environment {
        ANSIBLE_KEY = credentials('20.218.111.156')
        ANSIBLE_HOST_KEY_CHECKING = 'False'
            }
    stages {
        stage('build') {
            steps {
                sh 'apk update'
                sh 'apk add --update --no-cache openssh sshpass'
                sh 'ansible --version'
                sh "ansible-playbook --version"
                sh "ansible-playbook -vvv -i hostfile ansible-playbook.yml -e ansible_ssh_pass=$ANSIBLE_KEY_PSW"
            }   
        }    
    }
}
