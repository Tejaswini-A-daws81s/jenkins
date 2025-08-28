pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "mysql_app"
        TAG = "Latest"
        DOCKER_REGISTRY = "tejaswini745"
    }
    stages {
        stage ('DOCKER_BUILD'){
            steps {
                sh """
                    docker build -d ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${TAG} .
                """

            }
        }
        stage ('Docker_push'){
            steps {
                    withCredentials([usernamePassword(credentialsID: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh"""
                            echo $DOCKER_PASS | docker login -u DOCKER_USER --password-stdin
                            docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${TAG}
                        """


                    }
            }
        }
    }
