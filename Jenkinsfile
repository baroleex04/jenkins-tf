pipeline {
    agent any
    
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
                        export $AWS_ACCESS_KEY
                        export $AWS_SECRET_KEY
                    '''
                }
            }
        }
    }
}
