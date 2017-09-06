#rm ./gen/ckp.t7
CUDA_VISIBLE_DEVICES=0 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp1.t7 #> ./log/ckp1.doc
#CUDA_VISIBLE_DEVICES=1 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp2.t7 > ./log/ckp2.doc &
#CUDA_VISIBLE_DEVICES=2 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp3.t7 > ./log/ckp3.doc &
#CUDA_VISIBLE_DEVICES=3 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp4.t7 > ./log/ckp4.doc &
#CUDA_VISIBLE_DEVICES=4 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp5.t7 > ./log/ckp5.doc &
#CUDA_VISIBLE_DEVICES=5 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp6.t7 > ./log/ckp6.doc &
#CUDA_VISIBLE_DEVICES=6 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp7.t7 > ./log/ckp7.doc &
#CUDA_VISIBLE_DEVICES=7 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp8.t7 > ./log/ckp8.doc &
#CUDA_VISIBLE_DEVICES=8 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp9.t7 > ./log/ckp9.doc &
#CUDA_VISIBLE_DEVICES=9 th main.lua -depth 44 -batchSize 128 -nGPU 1 -nThreads 1 -shareGradInput true -data ./gen/ckp10.t7 > ./log/ckp10.doc &

