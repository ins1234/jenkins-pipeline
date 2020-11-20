pipeline {
	environment {
		registry = "ins1234/alpine123"
		DOCKER_PWD = "pass1234"
	}
	agent {
		docker {
			image 'gnschenker/node-docker'
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
				sh 'docker login -u ins1234 -p pass1234'
				sh 'docker image build -t $registry:$BUILD_NUMBER .'
				sh 'docker image push $registry:$BUILD_NUMBER'
				sh "docker image rm $registry:$BUILD_NUMBER"
			}
		}
	}
}