#!/bin/bash

## run this with: sbatch muci_count_run1.sh
## check queue with squeue
##
## this script aligns sequencing reads in FASTQ files to a reference transcriptome and generates a number of  outputs
# and also creates gene count matrix
## create a custom reference package, see: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/advanced/references

## Resource Request
#SBATCH --job-name=muci_count
## %j is job number, %x is the job name above
#SBATCH --output=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/proj/bsp_248/lily/logs/logs-%x-%j.txt
## 6 hours
#SBATCH --time=1-6:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=256G

## Job Steps
srun echo "Starting: in sbatch we asked for 8 threads and 256G meme for count step"
srun echo `date`

cd /mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/
mkdir -p stages/count
cd stages/count
export PATH=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/local/bin/:$PATH
# make sure /mnt/lustre/RDS-live/angelopoulos/local/bin/bcl2fastq is in your path

reference_transcriptome=/mnt/lustre/RDS-live/bioinformatics/analysis/scrna/local/scriptome/Sus_scrofa.Sscrofa11.1-filt-cellr
fastqs_path=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/demux/run_1_demux/outs/fastq_path/2222W7FNX

# run 1
# sample parameter use the same numbering as index file, the id parameter is new assigned to make numbering in analysis clearer
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_01_count \
      --fastqs=$fastqs_path \
      --sample=4  \
      --transcriptome=$reference_transcriptome

# sample 05
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_02_count \
      --fastqs=$fastqs_path \
      --sample=5  \
      --transcriptome=$reference_transcriptome

# sample 06
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_03_count \
      --fastqs=$fastqs_path \
      --sample=6  \
      --transcriptome=$reference_transcriptome


# sample 07
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_04_count \
      --fastqs=$fastqs_path \
      --sample=7  \
      --transcriptome=$reference_transcriptome

# sample 08
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_05_count \
      --fastqs=$fastqs_path \
      --sample=8  \
      --transcriptome=$reference_transcriptome

# sample 09
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_06_count \
      --fastqs=$fastqs_path \
      --sample=9  \
      --transcriptome=$reference_transcriptome

# sample 10
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_07_count \
      --fastqs=$fastqs_path \
      --sample=10  \
      --transcriptome=$reference_transcriptome

# sample 11
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_08_count \
      --fastqs=$fastqs_path \
      --sample=11  \
      --transcriptome=$reference_transcriptome

# sample 12
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_09_count \
      --fastqs=$fastqs_path \
      --sample=12  \
      --transcriptome=$reference_transcriptome

srun echo `date`
srun sleep 10
srun echo "The End"
