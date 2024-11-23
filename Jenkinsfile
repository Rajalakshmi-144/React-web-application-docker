
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
                echo 'Building the Docker image...'
                sh './build.sh'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                sh './deploy.sh'
            }
        }

        stage('Push to Prod (on Merge to Master)') {
            when {
                branch 'master'  // Only run this stage on the 'master' branch
            }
            steps {
                script {
                    echo 'Tagging and pushing Docker image to prod...'
                    sh 'docker tag Rajalakshmi-144/react-image:dev Rajalakshmi-144/react-image-prod:prod'
                    sh 'docker push Rajalakshmi-144/react-image-prod:prod'
                }
            }
        }
    }

    post {
        always {
            echo 'This will always run after the pipeline completes.'
        }
        success {
            echo 'This will run only if the pipeline is successful.'
        }
        failure {
            echo 'This will run only if the pipeline fails.'
        }
    }
}


         
