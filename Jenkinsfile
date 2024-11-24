pipeline {
    agent any
 
    stages {
    stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Rajalakshmi-144/React-web-application-docker'
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
       stage('Push to prod Docker Hub') {
            when {
                branch 'main'
            }
            steps {
              
                    echo 'Tagging and pushing Docker image to prod...'
                    sh 'docker tag Rajalakshmi-144/react-image:dev Rajalakshmi-144/react-image-prod:prod'
                    sh 'docker push Rajalakshmi-144/react-image-prod:prod'
                    
                
            }
        }
    }
    post {
        success {
            echo 'Build and push to prod successful!'
        }
        failure {
            echo 'Build or push to prod failed!'
        }
    }
}
         
