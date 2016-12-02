node {
    currentStatus = "BASARILI"
    try {
        stage ('Docker Kontrolu') {
            sh 'docker ps -a'
        }
        stage("Checkout Basladi") {
            // Repo'dan kodu al
            checkout scm
            echo "Checkout Bitti"
        }
        stage("sbt-test") {
            sh "java -Dsbt.log.noformat=true -jar /var/lib/jenkins/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt/bin/sbt-launch.jar test"
            echo "sbt-test bitti"
        }
        stage("sbt-assembly"){
            sh "java -Dsbt.log.noformat=true -jar /var/lib/jenkins/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt/bin/sbt-launch.jar assembly"
            echo "sbt-assembly bitti."
        }
stage("Archive Artifact"){
            archiveArtifacts '**/*.jar, Dockerfile'
            echo "Archive Artifact bitti."
        }
stage("Docker Image") {
			// This step should not normally be used in your script. Consult the inline help for details.
			withDockerRegistry([credentialsId: '8e14d4bb-9d13-43da-9246-f69b64813696', url: 'https://index.docker.io/v1/']) {
				stage "build"
		        def app = docker.build('abdullahceylan/hello-scala:v1', '.')
		    
		        stage "publish"
		        app.push()
			}
        }

    } catch ( err ) {
        currentStatus = "BASARISIZ"
        echo currentStatus
    }
}
