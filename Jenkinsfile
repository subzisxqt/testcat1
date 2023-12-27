pipeline {
  agent any
  stages {
    stage('stage1') {
      steps {
        sh 'terraform init'
      }
    }

    stage('stage2') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: "1",
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          sh 'terraform plan'
        }
      }
    }

    stage('confirm1') {
      steps {
        input 'Confirm haha'
      }
    }

    stage('stage3') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: "1",
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('confirm2') {
      steps {
        input 'Confirm haha'
      }
    }

    stage('destroy1') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: "1",
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          sh 'terraform destroy'
        }
      }
    }

  }
}
