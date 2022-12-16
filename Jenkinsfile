pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo building ...'
                sh "echo gansefusse test ... "
                sh "which python || true"
                sh "which python3 || true"
            }
        }
        stage('test') {
            steps {
                sh 'echo testing ...'
            }
        }
        stage('deploy') {
            steps {
                sh 'echo deploying ...'
            }
        }
    }
}
