pipeline {
    agent any

    tools {
        nodejs "node22.1.0"
        dockerTool 'latest'
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('genzoo-dockerhub')
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

        stage('Docker version') {
            steps {
                sh "docker -v"
                
            }
        }

        stage('Docker build') {
            steps {
                sh "docker build -t app ."
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
