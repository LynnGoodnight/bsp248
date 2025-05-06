#!/bin/bash

## run this with: (example) sbatch html_differential.sh
## check queue with squeue
##
## this script runs the R markdown scripts for the analysis of bsp248

## Resource Request
#SBATCH --job-name=muci_differential
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/%x-%j-outs_differential.txt
## 10 hours
#SBATCH --time=1-10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=50G

## Job Steps
echo "Starting: in sbatch we asked for 3 thread and 128G mem"
echo `date`

module load tools


echo "here: " `pwd`
echo "differential edgeR date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/code/bsp248

export work_dir="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/"
export bsp_num="bsp_248"
export clustK="25"
export sampSet="subset_innate_immune_cells"
export sampDPI="both"
echo "sampSet" $sampSet
## sleep 10
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_differential_${sampSet}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('differential_lily_uniform.Rmd',  output_file=\"${cF}\")"

echo `date`
sleep 10
echo "The End"
