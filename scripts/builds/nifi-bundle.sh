#!/bin/bash
# Jump to the project directory for executing SBT commands
projDir="$(cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd)"
cd $projDir/nifi-bundle

# Variables
projVer=$(cat ../version.sbt | grep '".*"' -o | sed 's/"//g')
nifiLibDir=$(find / -type d -path "/usr/*/nifi/lib" -print -quit 2> /dev/null)

echo "Building the trucking-nifi-bundle project"
#sbt nifiBundle/compile
mvn clean package

echo "Installing the NiFi nar to NiFi."
cp -f $projDir/nifi-bundle/nifi-trucking-nar/target/nifi-trucking-nar-$projVer.nar $nifiLibDir

