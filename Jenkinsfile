pipeline {
  agent {
    node {
      label 'docker-vm'
    }

  }
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/YoavGUEZfromBYNET/dotnet-core-api.git', branch: 'master', changelog: true, poll: true)
      }
    }

    stage('Build Image of Docker') {
      steps {
        sh 'docker build -t 104194/todoapi:${BUILD_ID} .'
      }
    }

    stage('Upload Docker Image to Repo') {
      parallel {
        stage('Upload Docker Image to Repo') {
          steps {
            withDockerRegistry(credentialsId: 'docker-hub-creds', url: 'https://index.docker.io/v1/') {
              sh "docker push 104194/todoapi:${BUILD_ID}"
            }

          }
        }

        stage('RUN and TEST the IMAGE') {
          steps {
            sh '''docker run -itd -p 80:80 --name todoapi 104194/todoapi:${BUILD_ID};
 sleep 3s; curl localhost:80; docker stop todoapi; docker rm todoapi'''
          }
        }

      }
    }

  }
}
