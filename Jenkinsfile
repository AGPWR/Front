pipeline {
    agent any

    tools {
        nodejs "node22.1.0"
        dockerTool 'latest'
    }

    stages {
        stage('Install Dependencies') {
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

        stage('Docker check') {
            steps {
                sh 'docker build -t app .'
                sh 'ls -la'
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
