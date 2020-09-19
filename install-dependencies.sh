#!/bin/bash

# Bash function to check whether a given npm package is installed.
# After running this, check the return value ($?). If $? is 0, the npm package
# is installed. If $? is nonzero, the package is not installed.
#
# npm is the package manager for Node.js. See https://www.npmjs.com for info.

installPackage() {
  echo Installing $1 package 
  echo " "
  npm install $1 $2 
}

isNpmPackageInstalled() {
  npm list --depth 1 -g $1 > /dev/null 2>&1
}

echo installing global dependencies 
echo " "
for package in @vue/cli  @aws-amplify/cli #global packages
do
  if isNpmPackageInstalled $package
  then
      echo $package is installed 
echo " "
  else
      echo $package is NOT installed 
echo " "
      installPackage -g $package
  fi
done

echo installing local dependencies 
echo " "
for package in aws-amplify @aws-amplify/ui-vue @aws-amplify/ui-components #local packages
do
  if isNpmPackageInstalled $package
  then
      echo $package is installed 
      echo " "
  else
      echo $package is NOT installed 
      echo " "
      installPackage --save $package
  fi
done

