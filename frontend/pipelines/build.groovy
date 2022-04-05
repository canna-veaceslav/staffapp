pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }
    environment {
        def serviceName = "frontend";
        def branchName = "main";
        def versionName = "";
        def dockerRegistry = "836434573289.dkr.ecr.eu-north-1.amazonaws.com"
        def imageName = "";
        def dockerImage = null;
        registryCredential = 'docker'
    }

    stages {
        stage('Init') {
            steps {
                script {
                    echo 'Init variables'

                    branchName = env.BRANCH_NAME
                    versionName = env.BRANCH_NAME
                    imageName = "${serviceName}:${versionName}"
                }

            }
        }
        stage('clone') {
            steps {
                script {
                    echo 'Clone repository'

                    checkout scm
                }
            }
        }
        stage('build') {
            steps {
                script {
                    echo 'Build docker image'
                    dir('frontend/') {
                        dockerImage = docker.build(imageName,  "-f pipelines/Dockerfile .")
                    }

                }
            }
        }
      stage('Deploy our image') {
        steps {
          script {
            docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
            }
          }
        }
      }
    }
}
