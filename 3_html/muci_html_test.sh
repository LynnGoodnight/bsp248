#!/bin/bash

## run this with: sbatch muci_html_test.sh
## check queue with squeue
##
## this script runs the R markdown scripts for the analysis of bsp248
## and creating htmls in bsp_248/lily/stages/

## Resource Request
#SBATCH --job-name=html_test
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/%x-%j-logs_test.txt
## 10 hours
#SBATCH --time=1-10:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=50G

## Job Steps
echo "Starting: in sbatch we asked for 10 thread and 50G mem"
echo `date`

module load tools

export work_dir="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/"
export bsp_num="bsp_248"
export sampSet="all"
export reference_genome_version="113"



echo "here: " `pwd`
echo "clust date: " `date`

cd /mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/code/bsp248

export sampSet="all"
echo "sampSet" $sampSet

# export clustK=15
# echo "clustK" $clustK
# ## sleep 10
# cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_test_${sampSet}_k${clustK}.html"
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('test_sub_cluster.Rmd',  output_file=\"${cF}\")"




# export clustK=15
# sleep 2
# cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_test_${sampSet}_k${clustK}.html"
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('test_sub_cluster.Rmd',  output_file=\"${cF}\")"  &
#
# export clustK=20
# sleep 2
# cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_test_${sampSet}_k${clustK}.html"
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('test_sub_cluster.Rmd',  output_file=\"${cF}\")"  &
#
# export clustK=30
# sleep 2
# cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_test_${sampSet}_k${clustK}.html"
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('test_sub_cluster.Rmd',  output_file=\"${cF}\")"  &
#
#
# export clustK=50
# sleep 2
# cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_test_${sampSet}_k${clustK}.html"
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('test_sub_cluster.Rmd',  output_file=\"${cF}\")"  &

export clustK=100
echo "clustK" $clustK
sleep 2
cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_test_${sampSet}_k${clustK}.html"
/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('test_sub_cluster.Rmd',  output_file=\"${cF}\")"  &

# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "
#   clustK <- as.numeric(Sys.getenv('clustK'))
#   output_file <- Sys.getenv('cF')
#   rmarkdown::render('test_sub_cluster.Rmd', output_file = output_file)
# "
#
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/Rscript -e "
#   clustK <- as.numeric(Sys.getenv('clustK'))
#   output_file <- Sys.getenv('cF')
#   rmarkdown::render('test_sub_cluster.Rmd', output_file = output_file)
# "
# export clustK=120
# sleep 2
# cF="/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/step_test_${sampSet}_k${clustK}.html"
# /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/bin/R -e "rmarkdown::render('test_sub_cluster.Rmd',  output_file=\"${cF}\")"  &

# Wait for all parallel jobs to complete
wait
echo "All R processes have completed"
echo `date`
sleep 10
echo "The End"
