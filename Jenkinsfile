pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "mysql_app"
        TAG = "latest"
        DOCKER_REGISTRY = "tejaswini745"
    }

    stages {
        stage('Docker Build') {
            steps {
                sh """
                    docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${TAG} .
                """
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${TAG}
                    """
                }
            }
        }
    }
} 