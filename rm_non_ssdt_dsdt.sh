#!/usr/bin/env bash
ls origin | grep -v ^SSDT | grep -v ^DSDT | xargs -I {} rm origin/{}
