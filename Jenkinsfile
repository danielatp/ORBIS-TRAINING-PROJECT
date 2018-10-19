pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'make project-workspace'
                sh 'make jenkins-install'
            }
        }
        stage('Test') {
            steps {
                sh 'make jenkins-start'
                sh 'make curl'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make jenkins-release'
                sh 'make deploy.ghpages'
            }
        }
    }
    post {
        always {
            sh 'docker rm -f node_jenkins_start'
            sh 'docker rm -f espacio_de_trabajo'
            sh 'docker network rm orbis_training_net'
            echo 'One way or another, I have finished'
            // deleteDir() /* clean up our workspace */
            cleanWs()
        }
        success { echo 'I succeeeded!' }
        unstable { echo 'I am unstable :/' }
        failure { echo 'I failed :(' }
        changed { echo 'Things were different before...' }
    }
}