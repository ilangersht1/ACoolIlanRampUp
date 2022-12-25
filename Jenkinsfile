pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:light'
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