#!/bin/bash

## check queue with squeue
##
## this script runs the R markdown scripts for the analysis bsp248

## Resource Request
#SBATCH --job-name=enrichment_analysis
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/%x-%j-logs.txt
## 10 hours
#SBATCH --time=1-10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu=128G

## Job Steps
echo "Starting: in sbatch we asked for 3 thread and 128G mem"

module load tools


echo "here: " `pwd`
echo "date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/code/bsp248
export work_dir="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/"
export bsp_num="bsp_248"
export sampSet="all"

echo "sampSet" $sampSet
## sleep 10
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_enrichment_analysis_${sampSet}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('enrichment_analysis_uniform.Rmd',  output_file=\"${cF}\")"



echo `date`
sleep 10
echo "The End"
