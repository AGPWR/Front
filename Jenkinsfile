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

        stage('Build Docker Containers') {
            steps {
                sh 'docker-compose build'
            }
        }

        stage('Deploy Docker Containers') {
            steps {
                sh 'docker-compose up -d'
            }
        }
        
        stage('Deploy to Heroku') {
            steps {
                sh 'npm install -g heroku'
                sh 'git push heroku main'
            }
        }
    }
}
