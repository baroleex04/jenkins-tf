pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY     = credentials('aws-access-key-id')
        AWS_SECRET_KEY = credentials('aws-secret-key-id')
    }

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    // Download the correct Terraform version
                    sh '''
                        sudo yum install -y yum-utils
                        sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
                        sudo yum -y install terraform
                    '''
                }
            }
        }
        stage('Terraform Plan and Apply') {
            steps {
                script {
                    // Your terraform plan and apply steps go here
                    sh '''
                        terraform init
                        terraform validate
                        terraform plan -input=false -var 'access_key=${AWS_ACCESS_KEY}' -var 'secret_key=${AWS_ACCESS_KEY}'
                    '''
                }
            }
        }
    }
}
