#!/bin/bash


export JMETER_HOME="/home/smirnov_va/Tools/apache-jmeter-5.0"

RUN_DATE=`date +'%Y_%m_%d_%H_%M_%S'`

#export JVM_ARGS=-Djavax.net.debug=all
export JVM_ARGS="-Dfile.encoding=UTF-8"
export JVM_ARGS="$JVM_ARGS -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.rmi.port=9011 -Dcom.sun.management.jmxremote.local.only=true -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"
export JVM_ARGS="$JVM_ARGS -XX:+UnlockCommercialFeatures -XX:+FlightRecorder -XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints"

export JVM_ARGS="$JVM_ARGS -XX:StartFlightRecording=delay=10s,duration=120s,name=Profile-Test,filename=Profile-Test2.jfr,settings=Profile-Test.jfc"

#JAVA_HOME=
#JRE_HOME=
export GC_ALGO="-XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:G1ReservePercent=20"
export HEAP="-Xms1g -Xmx16g -XX:MaxMetaspaceSize=256m -Xss10m"

export VERBOSE_GC="-verbose:gc -Xloggc:gc_jmeter_%p.log -XX:+PrintGCDetails -XX:+PrintGCCause -XX:+PrintTenuringDistribution -XX:+PrintHeapAtGC -XX:+PrintGCApplicationConcurrentTime -XX:+PrintAdaptiveSizePolicy -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCDateStamps"

RUN_OPTS=""
#RUN_OPTS="$RUN_OPTS --nongui"
RUN_OPTS="$RUN_OPTS --jmeterlogfile logs/""$RUN_DATE""_jmeter.run.log"
RUN_OPTS="$RUN_OPTS --logfile logs/""$RUN_DATE""_log.jtl"
RUN_OPTS="$RUN_OPTS --addprop jmeter.script.properties"
RUN_OPTS="$RUN_OPTS --reportatendofloadtests"
RUN_OPTS="$RUN_OPTS --reportoutputfolder reports/$RUN_DATE/"
RUN_OPTS="$RUN_OPTS --testfile $@"

"$JMETER_HOME/bin/jmeter" $RUN_OPTS