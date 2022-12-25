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
                    terraform validate
                '''
            }
        }
    }
    post {
        success {
            tar file: 'artifacts.tar.gz'
            archiveArtifacts artifacts: 'artifacts.tar.gz'
        }
    }
}