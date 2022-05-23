pipeline {
  agent any
  
  environment {
    DOCKER_HUB_USERNAME = credentials('docker-hub-username')
    DOCKER_HUB_PASSWORD = credentials('docker-hub-password')
  }

  stages {
    stage('Building Artifact') {
      steps {
        sh 'docker build -t $DOCKER_HUB_USERNAME/goviolin:$BUILD_NUMBER .'
      }

      post {
        success {
          echo "Building Artifact completed successfully!"
        }
        failure {
          echo "Building Artifact failed!"
        }
      }
    }

    stage('Pushing Artifact') {
      steps {
        sh 'docker login --username $DOCKER_HUB_USERNAME --password $DOCKER_HUB_PASSWORD'
        sh 'docker push $DOCKER_HUB_USERNAME/goviolin:$BUILD_NUMBER'
        sh 'docker tag $DOCKER_HUB_USERNAME/goviolin:$BUILD_NUMBER $DOCKER_HUB_USERNAME/goviolin:latest'
        sh 'docker push $DOCKER_HUB_USERNAME/goviolin:latest'
      }

      post {
        success {
          echo "Pushing Artifact completed successfully!"
        }
        failure {
          echo "Pushing Artifact failed!"
        }
      }
    }

    stage('Deploying Artifact') {
      steps {
        sh 'kubectl apply -f K8s/deployment.yaml'
        sh 'kubectl apply -f K8s/service.yaml'
        sh 'kubectl rollout restart deployment goviolin'
      }

      post {
        success {
          echo "Deploying Artifact completed successfully!"
        }
        failure {
          echo "Deploying Artifact failed!"
        }
      }
    }
  }
}
