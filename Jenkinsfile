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

        stage('Building docker image') {
            steps {
                script {
                    sh(script: 'docker build -t front-image:latest .', label: 'Building image')
                }
            }
        }
        stage('Pushing image') {
            steps {
                script {
                    sh(script: 'docker tag front-image:latest genzoo/front-image:latest', label: 'Tagging image')
                     withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USER --password-stdin'
                    }
                    sh(script: 'docker push genzoo/front-image:latest', label: "Pushing...")
                }
            }
        }
    }
}
