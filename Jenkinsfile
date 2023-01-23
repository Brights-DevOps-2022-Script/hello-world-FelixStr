pipeline {
    agent {
        docker {
            image 'cytopia/ansible'
        }
    }
    environment {
        ANSIBLE_KEY = credentials('Ansible')
        ANSIBLE_HOST_KEY_CHECKING = 'False'
            }
    stages {
        stage('build') {
            steps {
                sh 'apk update'
                sh 'apk add --update --no-cache openssh sshpass'
                //sh "ansible-playbook -i hostfile install-docker.yml -e ansible_ssh_pass=$ANSIBLE_KEY_PSW"
                sh "ansible-playbook -i hostfile install-Jenkins.yml -e ansible_ssh_pass=$ANSIBLE_KEY_PSW"
            }   
        }    
    }
}
