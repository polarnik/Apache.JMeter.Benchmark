#!/bin/bash awk -f jmeter.2.influx.awk ./logs/jmeter.log.jtl

BEGIN {
	# %date [%thread] %level %logger - %message%n%xException
	pattern = "^20[0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9]*[[:space:]]+\\[[^\\]]+\\][[:space:]]+"
	startPattern = pattern level
	isReadException = "false"

	# print startPattern
}
function escapeField(stringValue) {
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", stringValue)
       	gsub(/,/, "\\,", stringValue)
        gsub(/=/, "\\=", stringValue)
        gsub(/[[:space:]]+/, "\\ ", stringValue)
	return stringValue
}

function parseHeader(firstLine) {
    # timeStamp,elapsed,label,responseCode,responseMessage,threadName,dataType,success,failureMessage,bytes,sentBytes,grpThreads,allThreads,URL,Latency,IdleTime,Connect,"link","link2","link3","link4","link5","link6"
    split(firstLine, headerArray, ",")

    header["timeStamp"]["type"] = "long"
    header["elapsed"]["type"] = "long"
    header["label"]["type"] = "String"
    header["responseCode"]["type"] = "String"
    header["responseMessage"]["type"] = "String"
    header["threadName"]["type"] = "String"
    header["dataType"]["type"] = "String"
    header["success"]["type"] = "boolean"
    header["failureMessage"]["type"] = "String"
		header["bytes"]["type"] = "int"
		header["sentBytes"]["type"] = "int"
		header["grpThreads"]["type"] = "int"
		header["allThreads"]["type"] = "int"
		header["URL"]["type"] = "String"
		header["Filename"]["type"] = "String" # if Save Response to File was used
		header["Latency"]["type"] = "int"
		header["IdleTime"]["type"] = "int"
		header["Connect"]["type"] = "int"
		header["Encoding"]["type"] = "String"
		header["SampleCount"]["type"] = "int"
		header["ErrorCount"]["type"] = "int"
		header["Hostname"]["type"] = "String"

		header["headersSize"]["type"] = "int"
		header["bodySize"]["type"] = "int"
		header["contentType"]["type"] = "String"
		header["endTime"]["type"] = "long"
		header["isMonitor"]["type"] = "boolean"
		header["threadName_label"]["type"] = "String"
		header["parent_threadName_label"]["type"] = "String"
		header["startTime"]["type"] = "long"
		header["stopTest"]["type"] = "boolean"
		header["stopTestNow"]["type"] = "boolean"
		header["stopThread"]["type"] = "boolean"
		header["startNextThreadLoop"]["type"] = "boolean"
		header["isTransactionSampleEvent"]["type"] = "boolean"
		header["transactionLevel"]["type"] = "int"
		header["responseDataAsString"]["type"] = "String"
		header["requestHeaders"]["type"] = "String"
		header["responseData"]["type"] = "String"
		header["responseHeaders"]["type"] = "String"
}
