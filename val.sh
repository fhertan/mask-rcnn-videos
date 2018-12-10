#! /bin/bash
#SBATCH --nodes=1 # node count
#SBATCH --mem=60G
#SBATCH --ntasks-per-node=4
#SBATCH --ntasks-per-socket=2
#SBATCH -t 00:10:00
#SBATCH --gres=gpu:4
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#SBATCH --mail-user=fhertan@princeton.edu

module load anaconda3/5.3.0
cd lib
sh make.sh
cd ..

python tools/test_net.py --dataset coco2017 --cfg /home/fhertan/mask-rcnn-videos/configs/baselines/e2e_mask_rcnn_R-50-C4_1x.yaml --multi-gpu-testing  \
--load_ckpt /scratch/network/fhertan/Outputs/e2e_mask_rcnn_R-50-C4_1x/Dec03-01-31-44_adroit-h11g2_step/events.out.tfevents.1543818705.adroit-h11g2
