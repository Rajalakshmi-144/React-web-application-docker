pipeline {
    agent any
   
   
     stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
      stage('Get Branch Name') {
            steps {
                script {
                    // Get the branch name from Git
                    def branchName = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStdout: true).trim()
                    echo "Current branch: ${branchName}"

                    // Store it in the environment variable for further use
                    env.BRANCH_NAME = branchName
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
                          
                    if (env.BRANCH_NAME == 'dev') {
                        echo "Pushing image to dev repository..."
                        sh 'docker tag react-build-image:latest rajalakshmi1404/react-image:dev'
                        sh 'docker push rajalakshmi1404/react-image:dev'
                    } else if (env.BRANCH_NAME == 'main') {
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

