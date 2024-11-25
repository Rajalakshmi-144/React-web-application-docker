pipeline {
    agent any
   
    environment {
        BRANCH_NAME = "${env.GIT_BRANCH}"
        COMMIT_MESSAGE = "${env.git log -1 --pretty=%B}"
    }
    
   stages {
        stage('Check Branch Name') {
            steps {
                script {
                    echo "Current branch: ${env.GIT_BRANCH}"
                    echo "commit message: ${env.git log -1 --pretty=%B}
                }
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
        
        stage('Push Docker Image') {
            steps {
                script {
                          
                    if (env.BRANCH_NAME == 'origin/dev') {
                        echo "Pushing image to dev repository..."
                        sh 'docker tag react-build-image:latest rajalakshmi1404/react-image:dev'
                        sh 'docker push rajalakshmi1404/react-image:dev'
                    } else if (env.BRANCH_NAME == 'origin/main') {
                        echo "Pushing image to prod repository..."
                        sh 'docker tag react-build-image:latest rajalakshmi1404/react-image-prod:prod'
                        sh 'docker push rajalakshmi1404/react-image-prod:prod'
                    } else {
                        echo "Not the dev or main branch, skipping push."
                    }
                }
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
        always {
            cleanWs()  
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

