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
                echo "Build successed!"
            }   
        }

        stage("Test") {
            steps {
                echo "Test successed!"
            }          
        }

        stage("Deploy") {
            steps {
                echo "Deploy successed!"
            }
        }
    } 
}
