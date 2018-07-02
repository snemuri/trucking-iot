#!/bin/bash

scriptDir="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Setup the environment before building project components
$scriptDir/setup-environment.sh

# Create Kafka topics
#$scriptDir/kafka-create-topics.sh

# Import NiFi flow
$scriptDir/nifi-flow-import.sh

# Start the registry service
#$scriptDir/registry-start.sh

# Build and install the trucking-nifi-bundle project, generating a NiFi nar for use.
$scriptDir/builds/nifi-bundle.sh

