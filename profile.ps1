#!pwsh

###
##
## Copyright, 2020-2021
## shatfel
## (for public purpose)
##
###

## params
param(
  [switch]$force = $false
  )


## profile original name
$psProfileName="./profile.ps1"
## user`s profile path
$userProfileName="%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

### libs
. ./lib/common.ps1


###
### functions
###

### print status
function printParameters() {
  pP ("+--- Parameters")
  pP ("| User profile: ${userProfileName}")
  pP ("| PS Profile:   ${psProfileName}")
  pP ("| Force flag:   ${force}")
  pP ("+-----")  
  }

### set profile
function setProfile() {
  ## if profile exists or force flag set
  if ( (! (test-path ${PROFILE}) ) -or ($force -eq $true) ) {
    if ( $force ) {
      pI ("Force flag set => force rewrite ${userProfileName} !!")
      }

    ## copy profile
    cp ${psProfileName} ${PROFILE}
    } 
  }

## set aliases
function setAliases() {
	
}


###
## main
###
printParameters
setProfile


## other style for begin/end line
Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine 
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine 


## set aliases
Set-Alias -Name ghlp -Value "Get-Help"
