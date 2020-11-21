pipeline {
    environment {
        registry = "ins1234/jenkins-docker-test"
        DOCKER_PWD = "pass12345" //credentials('docker-login-pwd')
    }
    agent {
        docker {
            image 'gnschenker/jenkins-node-sample'
            args '-p 3000:3000'
            args '-w /app'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage("Build"){
            steps {
                sh 'npm install'
            }
        }
        stage("Test"){
            steps {
                sh 'npm test'
            }
        }
        stage("Build & Push Docker image") {
            steps {
                //sh 'docker image build -t $registry:$BUILD_NUMBER .'
                //sh 'docker login -u gnschenker -p $DOCKER_PWD'
                //sh 'docker image push $registry:$BUILD_NUMBER'
                //sh 'docker image rm $registry:$BUILD_NUMBER'
            }
        }
        stage('Deploy and smoke test') {
            steps{
                sh echo 'Deploy and smoke test' //'./jenkins/scripts/deploy.sh'
            }
        }
        stage('Cleanup') {
            steps{
                sh echo 'Cleanup' //'./jenkins/scripts/cleanup.sh'
            }
        }
    }
}