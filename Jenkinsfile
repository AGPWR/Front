pipeline {
    agent any

    tools {
        nodejs "node22.1.0"
    }

    stages {
        stage('Install') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Build') {
            steps {
                sh 'cd server'
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
                sh 'git push heroku main'
                }
            }
        }
    }
}
