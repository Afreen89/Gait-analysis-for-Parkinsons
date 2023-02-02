# Gait-analysis-for-Parkinsons
This repository contains the code from a masters thesis about the gait analysis for Parkinson's disease.
There are files related to a comparison between machine learning models and deep learning models.
There is a MATLAB file for creating gait energy image from seven images. There a code of Mask RCNN which was used to extract the mask (human silhouete) from the images.

# Motivation 
I worked on the future works of [A novel computer vision based gait analysis technique for normal and Parkinson’s gaits classification](https://ieeexplore.ieee.org/abstract/document/9251179)

# Dataset
Dataset used in this project is also taken from the paper mentioned above. However, there were some duplicates in the abnormal class, which was reduced while classifying using Machine Learning methods but I used over sampling when I used Deep Learning algorithms, especially Transfer learning models, VGG16 and ResNet50. You can download my set of representations (masks extracted from Mask RCNN) of Parkinson's gait analysis [here](https://drive.google.com/drive/u/0/folders/1LXpgI-9Aj-lqTBF4a2mdEYWScuze7GXR).  
