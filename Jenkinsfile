pipeline {
    environment {
        registry = "ins1234/jenkins-docker-test"
        DOCKER_PWD = "pass12345" //credentials('docker-login-pwd')
		PATH = "/bin:/usr/bin:$PATH"
		HOME = "/home/ins1234"
    }
	agent any
	
    /*agent {
        docker {
            image 'gnschenker/jenkins-node-sample'
            args '-p 3000:3000'
            args '-w /app'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }*/
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage("Build"){
		     agent { docker 'node' } 
            steps {
                sh 'npm install'
            }
        }
        stage("Test"){
			agent { docker 'node' } 
            steps {
                sh 'npm test'
            }
        }
        stage("Build & Push Docker image") {
		    agent { docker 'alpine' }
            steps {
				sh "echo 'Build & Push Docker image'"
                //sh 'docker image build -t $registry:$BUILD_NUMBER .'
                //sh 'docker login -u gnschenker -p $DOCKER_PWD'
                //sh 'docker image push $registry:$BUILD_NUMBER'
                //sh 'docker image rm $registry:$BUILD_NUMBER'
            }
        }
        stage('Deploy and smoke test') {
		    agent { docker 'alpine' }
            steps{
                sh "echo 'Deploy and smoke test'" //'./jenkins/scripts/deploy.sh'
            }
        }
        stage('Cleanup') {
				 agent { docker 'docker' }
				steps {
					   sh 'docker run --privileged -d docker:dind'
					   echo 'Hello, Maven'
				}
		  }
    }
}