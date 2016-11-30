node {
    currentStatus = "Success"
    try {
        stage("Checkout Basladi") {
            // Repo'dan kodu al
            checkout scm
            echo "Checkout Bitti"
        }
        stage("Test Step") {
            sh "java -Dsbt.log.noformat=true -jar /jenkins/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt_1.0.0-M4/bin/sbt-launch.jar test"
            echo "Test Finished"
        }
        stage("Compile Step"){
            sh "java -Dsbt.log.noformat=true -jar /jenkins/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt_1.0.0-M4/bin/sbt-launch.jar assembly"
            echo "Compile Finished."
        }


	stage ("Build") {
	    /* Build the Docker image with a Dockerfile, tagging it with the build number */
	    def app = docker.build "artirix/our-app:${env.BUILD_NUMBER}"
	}
    stage ("Test") {
	    /* We can run tests inside our new image */
	    app.inside {
	        sh '/app/run_tests.sh'
	    }
	}
    stage ('Publish') {
	    /* Push the image to Docker Hub, using credentials we have setup separately on the worker node */
	    app.push 'latest'
    }

    } catch ( err ) {
        currentStatus = "FAILED"
        echo currentStatus
    }
}
