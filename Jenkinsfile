pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-ci-cd"
    }

    stages {
        stage("Checkout") {
            steps{
                git 'https://github.com/Lapamore/ci-cd-test.git'
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${env.BUILD_ID}")
                }      
            }
        }

        stage("Run Tests") {
            steps {
                sh 'pytest app/test_main.py'
            }
        }

        stage("Deploy") {
            steps {
                script {
                    sh "docker run -d -p 5000:5000 ${IMAGE_NAME}:${env.BUILD_ID}"
                }
            }
        }
    }

    post {
        always {
            sh 'docker system prune -f'
        }
    }

}