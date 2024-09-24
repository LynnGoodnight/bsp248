#!/bin/bash

## run this with: sbatch muci_html_preprocess.sh
## check queue with squeue
##
## this script runs the R markdown scripts for the analysis of Elma's project: bsp248, taking input from stages/count/
## and creating htmls in assigned location

## Resource Request
#SBATCH --job-name=html_preprocess
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/%x-%j-logs_preprocess.txt
## 10 hours
#SBATCH --time=1-10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=256G

## Job Steps
echo "Starting: in sbatch we asked for 10 thread and 256G mem"
echo `date`

module load tools



export sampSet="all"
export work_dir="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages"

echo "sampSet" $sampSet

echo "here: " `pwd`
echo "running date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/code/bsp248
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_preprocess_${sampSet}.html"

/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('processing_all_lily.Rmd',  output_file=\"${cF}\")"

echo `date`
sleep 10
echo "The End"
