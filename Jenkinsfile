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

        stage('Build App') {
            steps {
                sh 'npm start &'
            }
        }

        stage('Test App') {
            steps {
                sh 'npm test'
            }
        }

        stage('Building Docker Image') {
            steps {
                script {
                    sh(script: 'docker build -t front-image:latest .', label: 'Building image')
                }
            }
        }
        
        stage('Pushing Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD"
                    sh 'docker tag front-image:latest genzoo/front-image:latest'
                    sh 'docker push genzoo/front-image:latest'
                }
            }
        }
    }
}
