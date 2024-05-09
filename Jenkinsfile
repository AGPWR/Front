pipeline {
    agent any

    tools {
        nodejs "node22.1.0"
        dockerTool 'latest'
    }

    environments {
        DOCKER_HUB_CREDENTIALS = credentials('DOCKER_HUB_CREDENTIALS')
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

        stage('Docker check') {
            steps {
                sh 'docker build -t app .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        docker.image('my-node-app').push('latest')
                    }
                }
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
