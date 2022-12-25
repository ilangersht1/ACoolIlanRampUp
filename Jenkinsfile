pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest'
            args '-it --entrypoint=/bin/bash'
        }
    }
    stages {
        stage('ilan') {
            steps {
                sh '''
                    pwd
                    terraform validate
                '''
            }
        }
    }
}