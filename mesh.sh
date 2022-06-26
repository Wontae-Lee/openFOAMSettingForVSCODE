rm -r 0
cp -r 0.orig 0

blockMesh 
surfaceFeatures
decomposePar
# mpirun -np 8 snappyHexMesh -parallel -overwrite | tee log.shm
mpirun -np 8 snappyHexMesh > /dev/null -parallel -overwrite
reconstructParMesh -constant


createBaffles -overwrite
splitBaffles -overwrite
createPatch



renumberMesh -overwrite




