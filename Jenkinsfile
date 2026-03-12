pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DEV_IMAGE = 'devipriya07/dev:latest'
        PROD_IMAGE = 'devipriya07/prod:latest'
    }
    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                sh 'docker tag devops-build $DEV_IMAGE'
                sh 'docker push $DEV_IMAGE'
            }
        }
        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                sh 'docker tag devops-build $PROD_IMAGE'
                sh 'docker push $PROD_IMAGE'
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
