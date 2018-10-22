#!/bin/bash


export JMETER_HOME="/home/smirnov_va/Tools/apache-jmeter-5.0"
export JMETER_HOME="/home/x1337/Tools/apache-jmeter-5.0"

RUN_DATE=`date +'%Y_%m_%d_%H_%M_%S'`

#export JVM_ARGS=-Djavax.net.debug=all
export JVM_ARGS="-Dfile.encoding=UTF-8"
#export JVM_ARGS="$JVM_ARGS -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.rmi.port=9011 -Dcom.sun.management.jmxremote.local.only=true -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

export JVM_ARGS="$JVM_ARGS -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints"
export JVM_ARGS="$JVM_ARGS -XX:StartFlightRecording=delay=10s,duration=120s,name=Trace-Apache.JMeter,filename=logs/""$RUN_DATE""-trace-script.jfr,settings=jmc/Trace.jfc"

#JAVA_HOME="/usr/java/jdk1.8.0_181-amd64/"
#JRE_HOME="/usr/java/jdk1.8.0_181-amd64/"
JAVA_HOME="/usr/lib/jvm/java-8-oracle/"
JRE_HOME="/usr/lib/jvm/java-8-oracle/"
# Application Arguments	/usr/lib/jvm/java-8-oracle/bin//../lib/missioncontrol/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar -os linux -ws gtk -arch x86_64 -showsplash -launcher /usr/lib/jvm/java-8-oracle/bin/jmc -name Jmc --launcher.library /usr/lib/jvm/java-8-oracle/bin//../lib/missioncontrol/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.1.200.v20141007-2033/eclipse_1605.so -startup /usr/lib/jvm/java-8-oracle/bin//../lib/missioncontrol/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar --launcher.appendVmargs -exitdata 1fb0026 -vm /usr/lib/jvm/java-8-oracle/bin//../jre/bin/java -vmargs -XX:+UseG1GC -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:FlightRecorderOptions=defaultrecording=true -Djava.net.preferIPv4Stack=true -jar /usr/lib/jvm/java-8-oracle/bin//../lib/missioncontrol/plugins/org.eclipse.equinox.launcher_1.3.0.v20140415-2008.jar

export GC_ALGO="-XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:G1ReservePercent=20"
export HEAP="-Xms1g -Xmx2g -XX:MaxMetaspaceSize=256m -Xss10m"

# export VERBOSE_GC="-verbose:gc -Xloggc:gc_jmeter_%p.log -XX:+PrintGCDetails -XX:+PrintGCCause -XX:+PrintTenuringDistribution -XX:+PrintHeapAtGC -XX:+PrintGCApplicationConcurrentTime -XX:+PrintAdaptiveSizePolicy -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCDateStamps"

RUN_OPTS=""
#RUN_OPTS="$RUN_OPTS --nongui"
RUN_OPTS="$RUN_OPTS --jmeterlogfile logs/""$RUN_DATE""_jmeter.run.log"
RUN_OPTS="$RUN_OPTS --logfile logs/""$RUN_DATE""_log.jtl"
RUN_OPTS="$RUN_OPTS --addprop jmeter.script.properties"
RUN_OPTS="$RUN_OPTS --reportatendofloadtests"
RUN_OPTS="$RUN_OPTS --reportoutputfolder reports/$RUN_DATE/"
RUN_OPTS="$RUN_OPTS --testfile $@"

"$JMETER_HOME/bin/jmeter" $RUN_OPTS
