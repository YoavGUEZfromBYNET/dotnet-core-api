pipeline {
  agent {
    node {
      label 'docker-vm'
    }

  }
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/lidorg-dev/dotnet-core-api.git', branch: 'master', changelog: true, poll: true)
      }
    }

  }
}