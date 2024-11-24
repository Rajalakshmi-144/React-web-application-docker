pipeline {
    agent any
 
    stages {
     
        stage('Clean Workspace') {
            steps {
                cleanWs()  // Clean the workspace before the build
            }
        }
    stage('Checkout') {
            steps {
                 checkout scm
            }
        }
         stage('Set Permissions') {
            steps {
                sh 'chmod +x build.sh' 
            }
        }
        stage('Build') {
            steps {
                sh './build.sh'  // Execute the script
            }
        }      
         
        stage('Push to dev Docker Hub') {
            when {
                branch 'dev'
            }
            steps {
                    echo 'pushing the image to dockerhub dev repo'
                    sh "docker push rajalakshmi1404/react-image:dev"
                    
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
         
