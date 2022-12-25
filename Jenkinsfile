pipeline {
    agent {
        docker {
            image 'jenkins/jnlp-agent-terraform'
        }
    }
    stages {
        stage('ilan') {
            steps {
                sh '''
                    terraform init
                    terraform plan
                '''
            }
        }
    }
}