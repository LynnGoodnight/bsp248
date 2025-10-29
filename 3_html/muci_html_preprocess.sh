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
#SBATCH --time=10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=128G

## Job Steps
echo "Starting: in sbatch we asked for 10 thread and 128G mem"
echo `date`

module load tools
export bsp_num="bsp_248"
export sampSet="all"
export work_dir="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/"

export reference_genome_version="113"
export ENTREZ_symbol_flag="no"
export run1_n="9"
export run2_n="9"
export run3_n="6"
export run4_n="0"
export seperate_run_value="9.5"
export n_niters="100000"
export limit="100"
export UMI_counts_threshold="50000"
export genes_detected_threshold="500"
export sum_counts_up="10000"
export sum_counts_min="1000"

echo "sampSet" $sampSet

echo "here: " `pwd`
echo "running date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/code/bsp248
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_preprocess_${sampSet}.html"

# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('processing_all_lily_uniform.Rmd',  output_file=\"${cF}\")"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/R-4.5.0/bin/R -e "rmarkdown::render('processing_all_lily_uniform.Rmd',  output_file=\"${cF}\")"

echo `date`
sleep 10
echo "The End"
