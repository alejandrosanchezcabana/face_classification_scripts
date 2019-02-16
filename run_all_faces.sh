#!/bin/bash

#
# This script will execute for all the files in the given directory the face classification algorithm.
# This version is intended to run using the python script directly.
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

# Since the python script uses some relative paths to load the datasets and the models we need to be placed on the src directory.
cd /Users/alexsanchez/src/tfg/libraries/face_classification/src

# For each file in the directory, exectue the request for process it and save it in the results directory
let "i=0"
for filename in /Users/alexsanchez/src/tfg/test_samples/$path/*; do

  echo "Processing: $filename"
  python3 image_emotion_gender_demo.py $filename
  mv /Users/alexsanchez/src/tfg/libraries/face_classification/images/predicted_test_image.png /Users/alexsanchez/src/tfg/results/$path/output_$i.png
  let "i++"
done