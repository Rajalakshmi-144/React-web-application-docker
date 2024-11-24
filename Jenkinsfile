pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/Rajalakshmi-144/React-web-application-docker'
            }
        }
        stage('Change File Permissions') {
            steps {
                sh 'chmod +x build.sh'
            }
        }
        stage('Build Docker Image') {
            steps {
                    sh './build.sh'
                }
            }
        stage('Push to dev Docker Hub') {
            when {
                branch 'dev'
            }
            steps {
                    echo 'pushing the image to dockerhub dev repo'
                    sh "docker push Rajalakshmi-144/react-image:dev"
                    
                  }
        }
         stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh './deploy.sh'
            }
        }
   }
  post {
        success {
            echo 'Build and deployment to dev successful!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}


         
