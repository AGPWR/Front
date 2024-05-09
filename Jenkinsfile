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

        stage('Docker login') {
            steps {
                script {
                    def dockerAuth = sh(script: "echo -n ${DOCKER_USERNAME}:${DOCKER_PASSWORD} | base64", returnStdout: true).trim()
                    sh "DOCKER_AUTH=\${dockerAuth} docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
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
