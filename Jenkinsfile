pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make project-workspace'
                sh 'make install'
            }
        }
        stage('Test') {
            steps {
                sh 'make start'
                sh 'make curl'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make release'
                sh 'make deploy.ghpages'
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