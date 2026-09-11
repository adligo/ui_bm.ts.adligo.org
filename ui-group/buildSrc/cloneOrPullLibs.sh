#
# This script is expected to be executed by GitBash or Jenkins
#
# Note the #!/bin/bash directive has been removed as Jenkins on Windows will complain about it
#

VEBOSE=false
SSL=false
while (( "$#" )); do
  #echo "$1"
  case "$1" in
    -l | --local-build) LOCAL_BUILD=true; shift 1 ;;
    -r | --local-repository-root) LOCAL_REPOSITORY_ROOT="$2"; shift 2 ;;
    -s | --ssl) SSL=true; shift 1 ;;
    -v | --verbose) VERBOSE=true; shift 1 ;;
  esac
done

echo "in cloneOrPullLibs.sh with LOCAL_BUILD $LOCAL_BUILD"
echo "LOCAL_REPOSITORY_ROOT $LOCAL_REPOSITORY_ROOT"

function doCd() {
  cd $1
  EXIT_CODE=$?
  if (( $EXIT_CODE == 0 )); then
    if [[ $VERBOSE == "true" ]]; then
      echo "Sucessfully moved(changed) into $1"
    fi
  else
    echo "Unable to move(change) into $1"
    exit 28
  fi
  
}

function doLocalClone () {
  echo "in doLocalClone in cloneOrPullLibs.sh"
  dir=$LOCAL_REPOSITORY_ROOT
  dir+=ui_group.ts.adligo.org
  if [[ -d "$dir" ]]; then
    if [[ $VERBOSE == "true" ]]; then
      echo "git clone from $dir"
      pwd
    fi
    git clone $dir
  else
    echo "Unable to clone the following repository the path doesn't exist"
    echo $dir
    exit 39
  fi  
}

pwd
EXIT_CODE=$?
if (( $EXIT_CODE == 0 )); then
  if [[ $VERBOSE == "true" ]]; then
    echo "In dir ROOT_DIR;"
    $ROOT_DIR
  fi
else
  echo "Unable to identify the root path, ensure pwd is in your path!"
  exit 11
fi
ROOT_DIR=`pwd`


if [[ -d "ui_group.ts.adligo.org" ]]; then
  doCd ui_group.ts.adligo.org
  git pull
  EXIT_CODE=$?
  if (( $EXIT_CODE == 0 )); then
    if [[ $VERBOSE == "true" ]]; then
      echo "git pull sucessful in dir"
      pwd
    fi
  else
    echo "Git pull failed on project"
    echo "ui_group.ts.adligo.org"
    exit 38
  fi
else
  if [[ $SSL == "true" ]]; then
    if [[ $VERBOSE == "true" ]]; then
      echo "git clone from git@github.com:adligo/ui_group.ts.adligo.org.git"
      pwd
    fi
    git clone git@github.com:adligo/ui_group.ts.adligo.org.git
  elif [[ $LOCAL_BUILD == "true" ]]; then
    doLocalClone
  else
    if [[ $VERBOSE == "true" ]]; then
      echo "git clone from https://github.com/adligo/ui_group.ts.adligo.org.git"
      pwd
    fi
    git clone https://github.com/adligo/ui_group.ts.adligo.org.git
  fi
  EXIT_CODE=$?
  if (( $EXIT_CODE == 0 )); then
    if [[ $VERBOSE == "true" ]]; then
      echo "git clone sucessful in dir"
      pwd
    fi
  else
    echo "Git clone failed on project"
    echo "ui_group.ts.adligo.org"
    exit 51
  fi
  doCd ui_group.ts.adligo.org
fi

echo "in cloneOrPullLibs.sh with LOCAL_BUILD $LOCAL_BUILD"
echo "LOCAL_REPOSITORY_ROOT $LOCAL_REPOSITORY_ROOT"

if [[ $LOCAL_BUILD == "true" ]]; then
  npm run git-clone-or-pull-local -- --LOCAL_REPOSITORY_ROOT $LOCAL_REPOSITORY_ROOT
else
  npm run git-clone-or-pull
fi
EXIT_CODE=$?
if (( $EXIT_CODE == 0 )); then
  if [[ $VERBOSE == "true" ]]; then
    echo "All projects sucessfully cloned or pulled in!"
    pwd
  fi
else
  echo "There was an issue cloning or pulling the git projects in;"
  echo "ui_group.ts.adligo.org!"
  exit 71
fi
