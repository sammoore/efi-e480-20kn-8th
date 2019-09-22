#!/usr/bin/env bash

which iasl >/dev/null
if [ $? -ne 0 ]; then
	echo "Cannot find iasl. Did you forget to install it to your path?"
	exit 1
fi

iasl -dl origin/DSDT.aml origin/SSDT*.aml
mv origin/*.dsl src/
