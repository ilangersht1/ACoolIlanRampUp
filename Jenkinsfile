pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:light'
            args '-it --entrypoint=/bin/bash'
            label 'support_ubuntu_docker'
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