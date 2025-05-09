#!/bin/bash
#SBATCH -N 1                        	# number of compute nodes
#SBATCH -n 1                     		# number of tasks your job will spawn
#SBATCH --mem=40G                    	# amount of RAM requested in GiB 
#SBATCH -p general                       # Run the job on HTC or if want to use GPU use -p gpu (for wall time of > 4 hrs)
#SBATCH -q public                 	    # Run job under wildfire QOS queue  # For wildfire use -q wildfire
#SBATCH --gpus=a100:1          	    # Request 2 GPU (V100_32, A100) [A100 40GB]
#SBATCH -t 0-02:30                  	    # wall time (D-HH:MM)
#SBATCH -o slurm.%j.out             	# STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err             	# STDERR (%j = JobId)
#SBATCH --mail-type=ALL             	# Send a notification when a job starts, stops, or fails
#SBATCH --mail-user=ywan1240@asu.edu 	# send-to address (Please change to the email user address)
#SBATCH --export=NONE

module purge

module load mamba/latest

source activate denoise-HDR

python denoise_mf.py --data "/scratch/ywan1240//scratch/ywan1240/PtCeO2_030303.tif"