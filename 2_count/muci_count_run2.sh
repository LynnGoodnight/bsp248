#!/bin/bash

## run this with: sbatch muci_count_12
## check queue with squeue
##
## this script creates counts
## see: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/advanced/references

## Resource Request
#SBATCH --job-name=muci_count_12
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_247/lily/logs/logs-%x-%j.txt
## 6 hours
#SBATCH --time=1-6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=128G

## Job Steps
srun echo "Starting: in sbatch we asked for 8 threads and 128G meme"
srun echo `date`

mkdir -p /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_247/lily/stages/count
cd /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_247/lily/stages/count
export PATH=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/local/bin/:$PATH

reference_transcriptome=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_247/lily/stages/scriptome/Gallus_gallus.GRCg6a
fastqs_path=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_247/lily/stages/demux/run_2_demux/outs/fastq_path/2223KHGNX
# make sure /mnt/lustre/RDS-live/angelopoulos/local/bin/bcl2fastq is in your path

# run 2
# sample 12
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_12_count \
      --fastqs=$fastqs_path \
      --sample=6  \
      --transcriptome=$reference_transcriptome

# sample 11
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_11_count \
      --fastqs=$fastqs_path \
      --sample=5  \
      --transcriptome=$reference_transcriptome

# sample 10
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_10_count \
      --fastqs=$fastqs_path \
      --sample=4  \
      --transcriptome=$reference_transcriptome

# sample 09
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_09_count \
      --fastqs=$fastqs_path \
      --sample=3  \
      --transcriptome=$reference_transcriptome

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_08_count \
      --fastqs=$fastqs_path \
      --sample=2  \
      --transcriptome=$reference_transcriptome

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_07_count \
      --fastqs=$fastqs_path \
      --sample=1  \
      --transcriptome=$reference_transcriptome

srun echo `date`
srun sleep 10
srun echo "The End"
