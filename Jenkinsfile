@Library('my-shared-library') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
    }
    stages {
        when{ expression { param.action == 'create' } }
        stage('Git Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Samitsingh001/mrdevops_java_app.git'
            }
        }

        stage('Unit Test Maven') {

            when{ expression { param.action == 'create' } }
            
            steps {
                script {
                    mvnTest()
                }
            }
        }
        stage('Integration Test maven') {

            when{ expression { param.action == 'create' } }
            
            steps {
                script {
                    mvnIntegrationTest()
                }
            }
        }
    }
}
