pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:latest'
        }
    }
    stages {
        stage('ilan') {
            steps {
                sh '''
                    terraform validate
                '''
            }
        }
    }
}