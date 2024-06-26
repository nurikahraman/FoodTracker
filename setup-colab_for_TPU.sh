#!/bin/bash

rm -R /content/dataset/

echo
echo "AIcrowd installer starting..."
echo

#if ! nvidia-smi > /dev/null 2>&1; then
#  echo "🚫 BU AKIŞIN ÇALIŞMASI İÇİN BIR GRAFİK KARTI ATANMIŞ OLMALI, ANCAK HİÇBİR GPU ALGILANMADI"
#  echo "Gerekli düzeltme için: Runtime -> Change Runtime Type -> Hardware Accelerator -> GPU"
#  exit 1
#fi

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    KONTROL ET    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "Arka planda Python 3.10 kullanılıyor, alttaki torch ve yancısı torchvision python versiyonunu kontrol ettiği gibi" 
echo "birbirlerininde veriyonunu kontrol ediyor. Belli bir eşleşme olması gerekiyor yüklenebilmeleri için."
echo
echo "Setting up the environment for you!"
echo
echo "⚙️ Installing PyTorch..."
pip install -U torch==2.1.0 torchvision==0.16.0 -f https://download.pytorch.org/whl/cu101/torch_stable.html > /dev/null

echo "⚙️ Installing COCO API..."
pip install cython pyyaml==6.0.1 > /dev/null
pip install -U 'git+https://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@github.com/nurikahraman/FoodTracker.git#subdirectory=PythonAPI' > /dev/null

echo "⚙️ Installing detectron..."
pip install -q 'git+https://github.com/facebookresearch/detectron2.git'# > /dev/null

mkdir -p '/content/dataset/val'
mkdir -p '/content/dataset/train'

#Datasets (This gets downloaded in "/content/foodChallenge/data")
echo "🗄 Preparing the validation dataset..."
unzip -q "/content/drive/MyDrive/Colab Notebooks/content/FoodRecognitionChallenge/val.zip" -d "/content/dataset/val"

echo "🗄 Preparing the dataset for training..."
unzip -q "/content/drive/MyDrive/Colab Notebooks/content/FoodRecognitionChallenge/train.zip" -d "/content/dataset/train"

echo "All set! 🎉🍻"
