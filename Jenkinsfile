@Library('my-shared-library') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javaapp')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerhubUser', description: "name of the Application", defaultValue: 'samitsinghhh')
        
    }
    stages {
        
        stage('Git Checkout') {
            when{ expression { params.action == 'create' } }
            steps {
                gitCheckout(
                    branch: 'main',
                    url: 'https://github.com/Samitsingh001/mrdevops_java_app.git'
          )  }
        }

        stage('Unit Test Maven') {

            when{ expression { params.action == 'create' } }
            
            steps {
                script {
                    mvnTest()
                }
            }
        }
        stage('Integration Test maven') {

            when{ expression { params.action == 'create' } }
            
            steps {
                script {
                    mvnIntegrationTest()
                }
            }
        }

        stage('Static code analysis: Sonarqube') {

            when{ expression { params.action == 'create' } }
            steps {
                script {
                    def SonarQubecredentialsId = 'sonarqube-api'    
                    statiCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }
        stage('Quality Gate Status Check: Sonarqube') {
            when{ expression { params.action == 'create' } }
            steps {
                script {
                    def SonarQubecredentialsId = 'sonarqube-api'    
                    QualityGateStatus(SonarQubecredentialsId)
                }
            }
        }
        stage('Maven Build: maven') {
            when{ expression { params.action == 'create' } }
            steps {
                script {
                   mvnBuild()
                }
            }
        }
        stage('Docker Image Build') {
            when{ expression { params.action == 'create' } }
            steps {
                script {
                   dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerhubUser}")
                }
            }
        }
    }
}
