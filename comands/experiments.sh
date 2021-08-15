#!/bin/bash

base_dir=problems/driverlog
domain_file=$base_dir/domain.pddl
problems_dir="$base_dir/problems"
output_dir=results/driverlog

declare -a searchs=(
  "BrFs"
  "BFS"
  "EHCSem"
  "EHCCom"
)

for problem_file in `ls $problems_dir`; do
  echo "=========================================================="
  echo -e "executing experiments with $domain_file and $problem_file, at `date`\n"
 
  for search in "${searchs[@]}"; do
    echo  "Executing $search"
    timeout 5m java -cp bin javaff.JavaFF \
      $domain_file $problems_dir/$problem_file \
      42 $output_dir/$problem_file-$search\
      "$search"
    
    echo -e "---------------------------------\n"
    
  done        
  echo -e "==========================================================\n\n"
done
