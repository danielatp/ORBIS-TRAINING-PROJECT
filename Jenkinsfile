pipeline {
    agent any
    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }
    stages {
        stage('No-op') {
            steps {
                sh 'ls'
            }
        }
        stage('Deliver') {
            steps {
                input "Finished using the web site?"
            }
        }
    }

    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success { echo 'I succeeeded!' }
        unstable { echo 'I am unstable :/' }
        failure { echo 'I failed :(' }
        changed { echo 'Things were different before...' }
    }
}