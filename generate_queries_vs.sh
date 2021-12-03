
#!/bin/bash

while read f;
do

  echo $f;
  qsub -v num=$f generate_queries_vs.pbs

done < emerging_windows.txt

echo "Jobs Submitted"








