#! /bin/bash
#SBATCH -N 1 # node count
#SBATCH --mem=10G
#SBATCH --ntasks-per-node=1
#SBATCH -t 00:10:00
#SBATCH --gres=gpu:1
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-user=fhertan@princeton.edu

module load anaconda3

# 


