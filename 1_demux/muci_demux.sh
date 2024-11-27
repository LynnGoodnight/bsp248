#!/bin/bash

## run this with: sbatch muci_demux
## check queue with squeue
##
## this script de-multiplexing project bsp248 runs 1+2 BCL files into fastq files

## Resource Request
#SBATCH --job-name=muci_demux
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/logs_demux-%x-%j.txt
## 6 hours
#SBATCH --time=1-6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=256G

## Job Steps
srun echo "Starting: in sbatch we asked for 10 threads and 256G mem "
srun echo `date`
cd /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/
mkdir -p lily/stages/demux/

cd lily/stages/demux/
export PATH=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/local/bin/:$PATH

# /mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/NEXTSEQ/240711_VH01203_33_2222W7FNX/ --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/sample_index_run1.csv --id=run_1_demux
#
# /mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/NEXTSEQ/240802_VH01203_36_2223K37NX/ --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/sample_index_run2.csv --id=run_2_demux

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger mkfastq --run=/mnt/lustre/RDS-archive/Sequencing/BSP285/241112_VH01203_48_2223K3WNX --sample-sheet=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/sample_index_run3.csv --id=run_3_demux

srun echo `date`
srun sleep 10
srun echo "The End"
