#!/bin/bash

## run this with: sbatch muci_count_run2.sh
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

# reference_transcriptome=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/scriptome/Sus_scrofa.Sscrofa11.1-filt-cellr
reference_transcriptome=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/local/scriptome/Sus_scrofa.Sscrofa11.1.113/Sus_scrofa.Sscrofa11.1.113-filt-cellr

fastqs_path=/mnt/lustre/RDS-ephemeral/bioinformatics/analysis/scrna/proj/bsp_248/lily/stages/demux/run_2_demux/outs/fastq_path/2223K37NX

# run 2
# sample
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_10_count \
      --fastqs=$fastqs_path \
      --sample=1  \
      --transcriptome=$reference_transcriptome

# sample
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_11_count \
      --fastqs=$fastqs_path \
      --sample=2  \
      --transcriptome=$reference_transcriptome

# sample
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_12_count \
      --fastqs=$fastqs_path \
      --sample=3  \
      --transcriptome=$reference_transcriptome

# sample
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_13_count \
      --fastqs=$fastqs_path \
      --sample=5  \
      --transcriptome=$reference_transcriptome

/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_14_count \
      --fastqs=$fastqs_path \
      --sample=6  \
      --transcriptome=$reference_transcriptome


/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_15_count \
      --fastqs=$fastqs_path \
      --sample=7  \
      --transcriptome=$reference_transcriptome

# sample
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_16_count \
      --fastqs=$fastqs_path \
      --sample=8  \
      --transcriptome=$reference_transcriptome

# sample
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_17_count \
      --fastqs=$fastqs_path \
      --sample=9  \
      --transcriptome=$reference_transcriptome

# sample
/mnt/lustre/RDS-ephemeral/angelopoulos/local/src/cellranger-7.1.0/bin/cellranger count  \
      --id=muci_sample_18_count \
      --fastqs=$fastqs_path \
      --sample=10  \
      --transcriptome=$reference_transcriptome

srun echo `date`
srun sleep 10
srun echo "The End"
