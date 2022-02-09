echo enter new folder name
read folder
if [ -d “./$folder” ]
then 
  echo "that folder already exists, moving files to folder" 
  mv CE* ./$folder/
  mv sinks_evol* ./$folder/
  mv slurm* ./$folder/
else
  echo "making new folder, moving files to folder"
  mkdir "$folder"
  mv CE* ./$folder/
  mv sinks_evol* ./$folder/
  mv slurm* ./$folder/
fi



