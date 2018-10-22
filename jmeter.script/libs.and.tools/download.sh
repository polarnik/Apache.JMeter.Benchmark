#!/bin/bash

# Command-Line Graph Plotting Tool
# https://jmeter-plugins.org/files/packages/jpgc-cmd-2.1.zip

wget https://jmeter-plugins.org/files/packages/jpgc-cmd-2.1.zip
unzip jpgc-cmd-2.1.zip

# 3 Basic Graphs
#    Average Response Time
#    Active Threads
#    Successful/Failed Transactions
# https://jmeter-plugins.org/files/packages/jpgc-graphs-basic-2.0.zip

wget https://jmeter-plugins.org/files/packages/jpgc-graphs-basic-2.0.zip
unzip jpgc-graphs-basic-2.0.zip

cp -r ./bin/ "$JMETER_HOME""/bin"
cp -r ./lib/ "$JMETER_HOME""/lib"
