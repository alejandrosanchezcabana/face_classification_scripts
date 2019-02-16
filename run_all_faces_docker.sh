#!/bin/bash

#
# This script will execute for all the files in the given directory the face classification algorithm
# This version is intended to be used agains the docker images usign the REST API.
#

# Verify that the path has been supplied correctly
path=$1
if [[ -z $path ]]
then
  echo 'Path needs to be supplied'
  exit 0
fi

# Create the output directory if it doesn't exists
echo "Creating: /Users/alexsanchez/src/tfg/results/$path if it doesn't exists"
mkdir -p /Users/alexsanchez/src/tfg/results/$path

# For each file in the directory, exectue the request for process it and save it in the results directory
let "i=0"
for filename in /Users/alexsanchez/src/tfg/test_samples/$path/*; do

  echo "Processing: $filename"
  curl -v -F image=@$filename http://localhost:8084/classifyImage > /Users/alexsanchez/src/tfg/results/$path/output_$i.png
  let "i++"
done