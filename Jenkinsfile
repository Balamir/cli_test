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

    } catch ( err ) {
        currentStatus = "BASARISIZ"
        echo currentStatus
    }
}
