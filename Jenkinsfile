pipeline {
    agent any

    stages {
        stage('Install') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Build') {
            steps {
                sh 'npm start &'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Deploy to Heroku') {
            steps {
                script {
                    withCredentials([[$class: 'StringBinding', credentialsId: 'HEROKU_API_KEY', variable: 'HEROKU_API_KEY']]) {
                        sh 'heroku login --no-interactive'
                        sh 'heroku create'
                        sh 'git push heroku main'
                        sh 'heroku ps:scale web=1'
                    }
                }
            }
        }
    }
}
