#!/bin/bash

## run this with: sbatch muci_html_cluster.sh
## check queue with squeue
##
## this script runs the R markdown scripts for the analysis of bsp248
## and creating htmls in bsp_248/lily/stages/

## Resource Request
#SBATCH --job-name=html_clustering
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/%x-%j-logs_clustering_subset.txt
## 10 hours
#SBATCH --time=1-10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=128G

## Job Steps
echo "Starting: in sbatch we asked for 10 thread and 128G mem"
echo `date`

module load tools

export work_dir="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/"
export bsp_num="bsp_248"
export sampSet="all"
export reference_genome_version="113"

export clustK=25
echo "clustK" $clustK


echo "here: " `pwd`
echo "clust date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/code/bsp248

export sampSet="all"
echo "sampSet" $sampSet
## sleep 10
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_clustering_subset_${sampSet}_k${clustK}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('cluster_subset_uniform.Rmd',  output_file=\"${cF}\")"


echo `date`
sleep 10
echo "The End"
