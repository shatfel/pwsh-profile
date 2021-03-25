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
  [string]$profilePath = ".",
  [switch]$force = $false,
  [switch]$install = $false,
  [switch]$verbose = $false
  )


## pwd
$_pwd = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
## profile original name
$psProfileName="$profilePath/profile.ps1"
## user`s profile
$userProfileName="%userprofile%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
$userProfilePath="%userprofile%\Documents\PowerShell"



### libs
. ${_pwd}/lib/common.ps1


###
### functions
###

### print status
function printParameters() {
  pP ("+--- Parameters")
  pP ("| User profile: ${userProfileName}")
  pP ("| PS Profile:   ${psProfileName}")
  pP ("| Force flag:   ${force}")
  pP ("| Install flag:   ${install}")
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
    cp -recurse  ${_pwd}/lib ${userProfilePath}/
    } 
  }

## set aliases
function setAliases() {
	
}


###
## main
###
if ( $verbose ) {
  printParameters
  }

## installing
if ( $install ) {
  setProfile
  }


## other style for begin/end line
Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine 
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine 


## set aliases
Set-Alias -Name ghlp -Value "Get-Help"
