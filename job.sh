#!/bin/bash
#SBATCH --job-name=Project
#SBATCH --partition=v100
#SBATCH --cpus-per-task=10
#SBATCH --gres=gpu:4
#SBATCH --output=%x.result
#SBATCH --mem=30GB
#SBATCH --time=00:60:00

module load python/intel/3.8.6
module load anaconda3/2020.07

cd /scratch/cmn8525/Assignments/HPML/Project/
eval "$(conda shell.bash hook)"
conda activate ../env/

timeout 900 nvidia-smi --query-gpu=memory.total,memory.used,utilization.gpu --format=csv -l 1 > rtx_results-file.csv & 

python pokegan.py
