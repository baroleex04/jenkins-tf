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
                    // Assuming your credential ID is 'aws-credentials'
                    withCredentials([
                        string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY'),
                        string(credentialsId: 'aws-secret-key-id', variable: 'AWS_SECRET_KEY')
                    ]) {
                        sh '''
                            terraform init
                            terraform validate
                            terraform plan -var access_key=${AWS_ACCESS_KEY} -var secret_key=${AWS_SECRET_KEY}
                            terraform apply -var access_key=${AWS_ACCESS_KEY} -var secret_key=${AWS_SECRET_KEY} --auto-approve
                        '''
                    }
                }
            }
        }
    }
}