#!pwsh

###
##
## Copyright, 2021
## shatfel
## (for public purpose)
##
###



###
### functions
###

### print message
function pP([string]$msg) {
  write-output "${msg}"
  }

### print info
function pI([string]$msg) {
  pP "/i/ ${msg}"
  }


