node {
    currentStatus = "BASARILI"
    try {
        stage ("Check docker") {
            sh 'docker ps -a'
            echo "check docker ok"
        }
        stage ("Checkout SCM") {
            // Repo'dan kodu al
            checkout scm
            echo "checkout scm ok"
        }
        stage ("sbt") {
        	stage ("test") {
	            sh "java -Dsbt.log.noformat=true -jar /var/lib/jenkins/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt/bin/sbt-launch.jar test"
	            echo "sbt-test ok"
	        }
        	stage ("assembly") {
	            sh "java -Dsbt.log.noformat=true -jar /var/lib/jenkins/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt/bin/sbt-launch.jar assembly"
	            echo "sbt-assembly ok."
	        }
        }
        stage ("Archive Artifact") {
            archiveArtifacts '**/*.jar, Dockerfile'
            echo "Archive Artifact ok."
        }
        stage ("Docker Image")  {
			// This step should not normally be used in your script. Consult the inline help for details.
			withDockerRegistry([credentialsId: '8e14d4bb-9d13-43da-9246-f69b64813696', url: 'https://index.docker.io/v1/']) {
				stage ("build") {
	                sh "cp /var/lib/jenkins/workspace/pipeline/target/scala-2.11/hello-scala-assembly-1.1.jar /var/lib/jenkins/workspace/pipeline/"

			        def app = docker.build('abdullahceylan/hello-scala:v1', '.', '-f /var/lib/jenkins/workspace/pipeline/Dockerfile')
		        }
		    
		        stage ("publish") {
		        	app.push()
		        }
			}
        }

    } catch ( err ) {
        currentStatus = "BASARISIZ"
        echo currentStatus
    }
}
