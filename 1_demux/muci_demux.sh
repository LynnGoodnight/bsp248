#!/bin/bash

## run this with: sbatch muci_demux
## check queue with squeue
##
## this script de-multiplexing project bsp247 runs 1+2 BCL files into fastq files

## Resource Request
#SBATCH --job-name=muci_demux
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_247/lily/logs/logs_demux-%x-%j.txt
## 6 hours
#SBATCH --time=1-6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=128G

## Job Steps
srun echo "Starting: in sbatch we asked for 8 threads and 128G mem "
srun echo `date`
cd /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_247/
mkdir -p lily/stages/demux/

cd lily/stages/demux/
export PATH=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/local/bin/:$PATH

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/NEXTSEQ/240716_VH01203_34_2222VWJNX --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_247/lily/sample_index_run1.csv --id=run_1_demux
#/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/path/to/run_directory --csv=/path/to/samplesheet.csv --sample=Sample_1

# /mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/NEXTSEQ/240730_VH01203_35_2223KHGNX --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_247/lily/sample_index_run2.csv --id=run_2_demux


srun echo `date`
srun sleep 10
srun echo "The End"
