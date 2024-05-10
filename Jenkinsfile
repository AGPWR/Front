pipeline {
    agent any

    tools {
        nodejs "node22.1.0"
        dockerTool 'docker-latest'
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

        stage('Building docker image') {
            steps {
                script {
                    sh(script: 'docker build -t front-image:latest .', label: 'Building image')
                }
            }
        }
        
        stage('Pushing image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                    sh 'docker tag front-image:latest genzoo/front-image:latest'
                    sh 'docker push genzoo/front-image:latest'
                }
            }
        }
    }
}
