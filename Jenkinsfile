pipeline {
    agent any
   
    environment {
        BRANCH_NAME = "${env.GIT_BRANCH}"
        commitMessage = ''
    }
    
   stages {
        stage('Check Branch Name') {
            steps {
                script {
                    echo "Current branch: ${env.GIT_BRANCH}"
                  }
            }
        }
                    
                    
          stage('Get Commit Message') {
            steps {
                script {
                    // Get the latest commit message
                    commitMessage = sh(script: 'git log -1 --pretty=%B', returnStdout: true).trim()
                    echo "Latest Commit Message: ${commitMessage}"           
                                     

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
                          
                    if (BRANCH_NAME == 'origin/dev') {
                        echo "Pushing image to dev repository..."
                        sh 'docker tag react-build-image:latest rajalakshmi1404/react-image:dev'
                        sh 'docker push rajalakshmi1404/react-image:dev'
                    } else if (BRANCH_NAME == 'origin/main' && commitMessage == 'merge from dev' ) {
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
        
        stage('Check Docker Containers')
            {
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

