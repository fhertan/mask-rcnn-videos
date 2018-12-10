#! /bin/bash
#SBATCH --nodes=1 # node count
#SBATCH --mem=60G
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks-per-socket=2
#SBATCH -t 00:10:00
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-task=16
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-user=fhertan@princeton.edu

module load anaconda3/5.3.0
cd lib
sh make.sh

cd ..
python tools/train_net_step.py --dataset coco2017 --cfg configs/baselines/e2e_mask_rcnn_R-50-C4_1x.yaml --use_tfboard --bs 4 --nw 4
