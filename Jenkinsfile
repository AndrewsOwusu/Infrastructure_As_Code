pipeline {

    agent {
        node 'master'
    }   //Run everything on master node..

	options{
        timestamps()
        }

	parameters {
        string(defaultValue: 'git@github.com:AndrewsOwusu/Infrastructure_As_Code.git', description: 'build repo', name: 'BITBUCKET_URL')
        string(defaultValue: 'Develop', description: 'branch to build', name: 'BRANCHNAME')
        string(defaultValue: '1.0.0', description: 'current release', name: 'RELEASE_VERSION')
        //choice(choices: ['dev', 'prod'], description: 'release_type', name:'RELEASE')
         //choices are newline separated
	}

	stages {
	    stage ('set build properties') {
	        steps {
	            sh """
	              set +x
								ls -ltr
								git checkout ${BRANCHNAME} && git pull
								echo "currently on ${BRANCHNAME} branch"
								git branch -v
								### passing parameters to properties file ###
								echo "buildstamp=`date +%Y-%m-%d_%H-%M-%S`" > build.props
								echo "buildcommit=`git rev-parse HEAD | cut -c 1-7 | sed 's/[\t++]//g'`" >> build.props
								echo "buildbranch=${BRANCHNAME}" >> build.props
								echo "headrevision=`git rev-list HEAD | wc -l | sed 's/[\t++]//g'`" >> build.props
								echo "`git rev-parse HEAD | cut -c 1-7 | sed 's/[\t++]//g'`" > commit.txt
								cat build.props
								cat commit.txt
				   		"""
	        }
	    }

			stage ('initialize terraform') {
			 steps {
					sh """
						terraform init
			    """
				}
		}

        stage ('provision resources') {
	       steps {
			   		sh """
			   			terraform apply -auto-approve
			      """
	        }
	    }

			stage ('verify provisioned resources') {
			 steps {
					sh """
						terraform state list && terraform show
					"""
				}
		}

	post {
			always {
				echo 'cleanup workspace for next run'
				cleanWs() /* clean up our workspace */
			}
	}
 }
}
