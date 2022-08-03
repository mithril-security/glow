set -e

wget -nc https://github.com/onnx/models/blob/main/vision/classification/resnet/model/resnet50-v2-7.onnx?raw=true
../../../build_Debug/bin/model-compiler -g -backend=CPU -model=resnet50.onnx -onnx-define-symbol=N,1 -model-input=data,float,[1,3,224,224] -emit-bundle=. -bundle-api=dynamic
g++ -c main.cpp
g++ -no-pie main.o resnet50.o -lpng