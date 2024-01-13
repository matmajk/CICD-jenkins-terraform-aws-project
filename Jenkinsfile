#!/usr/bin/env groovy

pipeline {
    agent any
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }
    stages {
        stage('Fetch code') {
            steps {
                git branch: 'test', url: 'https://github.com/matmajk/CICD-jenkins-terraform-aws-project'
            }
        }
        stage('Prepare Terraform Plan') {
            steps {
                withAWS(credentials: 'terraform-aws-credentials') {
                    dir('terraform') {
                        sh 'terraform init -input=false'
                        sh 'terraform validate'
                        sh 'terraform plan -input=false -var-file="terraform.tfvars" -out current_plan.tfplan'
                        sh 'terraform show -no-color current_plan.tfplan > tfplan.txt'
                    }
                }
            }
            post {
                always {
                    dir('terraform') {
                        archiveArtifacts artifacts: 'tfplan.txt'
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
