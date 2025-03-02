pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/Lapamore/ci-cd-test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Строим Docker-образ с тегом, основанным на BUILD_ID
                    dockerImage = docker.build("my-flask-app:${env.BUILD_ID}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Запускаем контейнер и выполняем тесты внутри него
                    dockerImage.inside("-p 5000:5000") {
                        sh 'pytest'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment stage (здесь можно добавить шаги деплоя)'
                // Добавьте необходимые команды для деплоя
            }
        }
    }

    post {
        always {
            // Очистка рабочего пространства после сборки
            cleanWs()
        }
    }
}
