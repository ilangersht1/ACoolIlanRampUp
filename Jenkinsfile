pipeline {
    agent { docker { image 'ubuntu:latest' } }
    stages {
        stage('ilan') {
            steps {
                sh '''
                    pwd
                    apt install terraform
                '''
            }
        }
    }
}