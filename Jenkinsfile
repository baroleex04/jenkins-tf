pipeline {
  agent any

  tools {
        terraform 'terraform'  // This name should match the name you configured
    }

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-secret-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-access-key-id')
  }

  stages {
    stage('Init Provider') {
      steps {
        sh 'terraform --version'
        echo 'terraform init'
      }
    }
    stage('Plan Resources') {
      steps {
        echo 'terraform plan'
      }
    }
    stage('Apply Resources') {
      input {
        message "Do you want to proceed for production deployment?"
      }
      steps {
        echo 'terraform apply -auto-approve'
      }
    }
  }
}
