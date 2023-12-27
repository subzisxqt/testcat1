pipeline {
  agent any
  stages {
    stage('stage1') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: "1",
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          sh 'terraform init'
        }
      }
    }

    stage('stage2') {
      steps {
        sh 'terraform apply'
      }
    }

    stage('confirm') {
      steps {
        input 'Confirm haha'
      }
    }

    stage('destroy1') {
      steps {
        sh 'terraform destroy'
      }
    }

  }
}
