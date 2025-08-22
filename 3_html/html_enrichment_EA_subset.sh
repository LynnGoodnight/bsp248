#!/bin/bash

## check queue with squeue
##
## this script runs the R markdown scripts for the analysis of bsp248

## Resource Request
#SBATCH --job-name=muci_enrichment_subset
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/%x-%j-outs.txt
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=100G

## Job Steps
echo "Starting: in sbatch we asked for 5 thread and 100G mem"
echo `date`

module load tools


echo "here: " `pwd`
echo "enrichment analysis subset edgeR date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/code/bsp248

export work_dir="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/"
export bsp_num="bsp_248"
export sampDPI="both"

export sampSet="subset_innate_immune_cells"
echo "sampSet" $sampSet
## sleep 10
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_enrichment_${sampSet}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/R-4.5.0/bin/R -e "rmarkdown::render('enrichment_analysis_uniform.Rmd',  output_file=\"${cF}\")"

# export sampSet="subset_non_immune_cells"
# echo "sampSet" $sampSet
# ## sleep 10
# cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_enrichment_${sampSet}.html"
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/R-4.5.0/bin/R -e "rmarkdown::render('enrichment_analysis_uniform.Rmd',  output_file=\"${cF}\")"
#
export sampSet="subset_adaptive_immune_cells"
echo "sampSet" $sampSet
## sleep 10
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_enrichment_${sampSet}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/R-4.5.0/bin/R -e "rmarkdown::render('enrichment_analysis_uniform.Rmd',  output_file=\"${cF}\")"

/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('differential_lily_uniform.Rmd',  output_file=\"${cF}\")"

echo `date`
sleep 10
echo "The End"
