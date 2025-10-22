@Library('my-shared-library') _
pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Samitsingh001/mrdevops_java_app.git'
            }
        }

        stage('Unit Test Maven') {
            steps {
                script {
                    mvnTest()
                }
            }
        }
    }
}
