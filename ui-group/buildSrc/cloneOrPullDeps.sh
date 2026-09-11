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


function doCd() {
  cd $1
  EXIT_CODE=$?
  if (( $EXIT_CODE == 0 )); then
    if [[ $VERBOSE == "true" ]]; then
      echo "Sucessfully moved(changed) into $1"
    fi
  else
    echo "Unable to move(change) into $1"
    exit 79
  fi
  
}

function doLocalClone () {
  echo "in doLocalClone in cloneOrPullLibs.sh"
  dir=$LOCAL_REPOSITORY_ROOT
  dir+=slink_group_deps.ts.adligo.org
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

if [[ -d "slink_group_deps.ts.adligo.org" ]]; then
  doCd slink_group_deps.ts.adligo.org
  git pull
  EXIT_CODE=$?
  if (( $EXIT_CODE == 0 )); then
    if [[ $VERBOSE == "true" ]]; then
      echo "git pull sucessful in dir"
      pwd
    fi
  else
    echo "Git pull failed on project"
    echo "slink_group_deps.ts.adligo.org"
    exit 38
  fi
else
  if [[ $SSL == "true" ]]; then
    git clone git@github.com:adligo/slink_group_deps.ts.adligo.org.git
  elif [[ $LOCAL_BUILD == "true" ]]; then
    doLocalClone
  else
    git clone https://github.com/adligo/slink_group_deps.ts.adligo.org.git
  fi
  EXIT_CODE=$?
  if (( $EXIT_CODE == 0 )); then
    if [[ $VERBOSE == "true" ]]; then
      echo "git clone sucessful in dir"
      pwd
    fi
  else
    echo "Git clone failed on project"
    echo "slink_group_deps.ts.adligo.org"
    exit 51
  fi
  doCd slink_group_deps.ts.adligo.org
fi

if [[ $VERBOSE == "true" ]]; then
  echo "Starting npm install in dir"
  pwd
fi
npm install
EXIT_CODE=$?
if (( $EXIT_CODE == 0 )); then
  if [[ $VERBOSE == "true" ]]; then
    echo "npm install sucessful in dir"
    pwd
  fi
else
  echo "npm install failed on project"
  echo "slink_group_deps.ts.adligo.org"
  exit 66
fi