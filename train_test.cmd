#!/bin/bash -l
#SBATCH -o ./tjob.out.%j
#SBATCH -e ./tjob.err.%j
#SBATCH -D ./
#SBATCH -J test_slurm
#SBATCH --partition=gpu
#SBATCH --constraint="gpu"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --mail-type=none
#SBATCH --mail-user=@rzg.mpg.de
#SBATCH --time=24:00:00

PROJECT=GalaxyGAN
DIR=/u/{$USER}/$PROJECT
DATA_DIR=$DIR/data/fitsdata
SCRIPT=$DIR/roou.py

chmod u+x $SCRIPT

module load cuda
module load cudnn

# Run the program:
#srun ./my_gpu_prog > prog.out

# If the mode equals zero, this is the training data. If the mode equals one, the data is used for testing.
./$SCRIPT --input $DATA_DIR/fits_train --fwhm 1.4 --sig 1.2 --mode 0
./$SCRIPT --input $DATA_DIR/fits_test --fwhm 1.4 --sig 1.2 --mode 1
