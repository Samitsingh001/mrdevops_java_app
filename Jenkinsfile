pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                    gitCheckout(
                        branch: "main"
                        url: "https://github.com/Samitsingh001/mrdevops_java_app.git"
                        )
                
            }
        }
    }
}
