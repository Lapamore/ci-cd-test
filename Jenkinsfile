pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/Lapamore/ci-cd-test.git'
            }
        }

        stage("Build") {
            steps {
                script {
                    def image = docker.build("my-devops-project")
                }  
            }   
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image("my-devops-project").inside {
                        sh 'python3 -m unittest test_app.py'
                    }
                }
            }
        }

        stage("Deploy") {
            steps {
                echo "Deploy successed!"
            }
        }
    } 
}
