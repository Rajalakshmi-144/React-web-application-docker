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
                sh 'chmod +x deploy.sh'
            }
        }
        stage('Build Docker Image') {
            steps {
                 sh './build.sh'
                
            }
        }
            stage('Push to Prod (on Merge to Main)') {
            when {
                branch 'main'
            }
            steps {
              
                    echo 'Tagging and pushing Docker image to prod...'
                    sh 'docker tag rajalakshmi-1404/react-image:dev rajalakshmi-144/react-image-prod:prod'
                    sh 'docker push rajalakshmi-1404/react-image-prod:prod'
                                  
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh './deploy.sh'
            }
        }
        stage('Check Docker Containers') {
            steps {
                script {
                    sh 'docker ps'
                }
            }
        }
    }

    post {
        success {
            echo 'pipeline executed successfully!'
        }
        failure {
            echo 'pipeline failed!'
        }
    }
}
