#!/bin/bash

#@title ÖN KURULUM

echo "AIcrowd installer starting..."

if ! nvidia-smi > /dev/null 2>&1; then
  echo "🚫 BU AKIŞIN ÇALIŞMASI İÇİN BIR GRAFİK KARTI ATANMIŞ OLMALI, ANCAK HİÇBİR GPU ALGILANMADI"
  echo "Gerekli düzeltme için: Runtime -> Change Runtime Type -> Hardware Accelerator -> GPU"
  exit 1
fi

#!!!!!!!!!!!!!!!!!!!!!!! KONTROL ET !!!!!!!!!!!!!!!!!!!!!!!!!!!
#Arka planda Python 3.10 kullanılıyor, alttaki torch ve yancısı torchvision python versiyonunu kontrol ettiği gibi 
#birbirlerininde veriyonunu kontrol ediyor. Belli bir eşleşme olması gerekiyor yüklenebilmeleri için.

echo "Setting up the environment for you!"

echo "⚙️ Installing PyTorch..."
pip install -U torch==2.1.0 torchvision==0.16.0 -f https://download.pytorch.org/whl/cu101/torch_stable.html > /dev/null

echo "⚙️ Installing COCO API..."
pip install cython pyyaml==6.0.1 > /dev/null
pip install -U 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI' > /dev/null

echo "⚙️ Installing detectron..."
pip install -q 'git+https://github.com/facebookresearch/detectron2.git' > /dev/null


#Datasets (This gets downloaded in "/content/foodChallenge/data")
echo "🗄 Preparing the dataset for training..."
wget -q -nv https://datasets.aicrowd.com/default/aicrowd-public-datasets/food-recognition-challenge/v0.4/train-v0.4.tar.gz
unzip -q -d dataset train-v0.4.tar.gz

echo "🗄 Preparing the validation dataset..."
wget -q -nv https://datasets.aicrowd.com/default/aicrowd-public-datasets/food-recognition-challenge/v0.4/val-v0.4.tar.gz
unzip -q -d dataset val-v0.4.tar.gz

echo "All set! 🎉🍻"
