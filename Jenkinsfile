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

    } catch ( err ) {
        currentStatus = "FAILED"
        echo currentStatus
    }
}
