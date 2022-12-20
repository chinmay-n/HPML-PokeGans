# HPML-PokeGans
HPML Course Project
------------
Pokémon is a Japanese media franchise managed by The Pokémon Company, founded by Nintendo, Game Freak, and Creatures. The franchise was created by Satoshi Tajiri in 1996,[4] and is centered around fictional creatures called "Pokémon". In Pokémon, Pokémon Trainers are people who catch, train, care for, and battle with Pokémon. There are currently 1008 Pokémon species.
</br>
</br>
The goal of this project was to try and generate new pokemon using the existing ones, using Generative Adversarial Networks to learn from and then proceed to try and fake a Pokemon. GANs are a two part architecture - a Generator followed by a Discriminator. Essentially, the Generator will look at the true class images and try to create something that the does not belong
in the true class. This is then passed onto the Discriminator who then assesses the input for its validity in the true class. 
</br>
This two-stage process ultimately helps the Generator come up with better outputs in order to minimize the Discriminator losses and ultimately end up with an generated object that comes close to passing for the true class.
</br>
</br></br>
</br></br>
</br>

## Usage:

Place the 256x256 Input images into the input folder.

Run ```python pokegan.py``` to generate an output in the generated subfolder that will be created automatically. Image generation is performed at every epoch.
</br>
The model is saved at the end of the provided number of epochs, and thus can be extended to be resumed from that point from the saved objects.
</br></br>
</br>
## Code Structure:

Code is structured in the following manner:
```
├── parent directory
│   ├── generated
│   └── input
│       ├── pokemon
│       │   └── pokemon
│       └── pokemon_jpg
│           └── pokemon_jpg
```
The main file pokegan.py is available in the parent directory. All code references to paths are relative to the current path, ie as long as the input folder is 
available in the same directory as the main file, the code will execute without errors.
</br>
</br></br>
</br>
## Training Info:

The model is relatively compute heavy - following are the expected training times based on some samples that we performed as part of our training:

| GPU Type | #GPUs | #Epochs | Training Time(s) | Min. Generator Loss | Min. Discriminator Loss |
|----------|-------|---------|------------------|---------------------|-------------------------|
| RTX8000  | 1     | 50      | 382.79           | 0.000403            | 0.000093                |
| RTX8000  | 2     | 100     | 644.31           | 0.000210            | 0.000075                |
| RTX8000  | 4     | 100     | 760.61           | 0.000216            | 0.000071                |
| RTX8000  | 4     | 500     | 3802.72s         | 0.000093            | 0.000004                |
| V100     | 4     | 100     | 782.36           | 0.000179            | 0.000049                |

</br>
GPU Compute Utilization Graph for RTX8000 with a 4 GPU setup over the first 200 seconds:

![image](https://user-images.githubusercontent.com/5692652/208686235-c93bebc4-4ed2-43cb-b44d-ed96f4f8d567.png)

</br>

GPU Memory Utilization for Graph for RTX8000 with a 4 GPU setup over the first 200 seconds:

![image](https://user-images.githubusercontent.com/5692652/208692083-3cb774c5-7ec6-4a0b-8b92-c0983866914a.png)
 
</br>
</br>
</br></br>

## References:

Lazarou, Conor. "Autoencoding Generative Adversarial Networks." arXiv, 11 April 2020 (https://arxiv.org/abs/2004.05472)
</br>
Adversarial Autoencoders. arXiv, 18 November 2015 (https://arxiv.org/abs/1511.05644)
</br>
PyTorch Distributed DataParallel (https://pytorch.org/docs/stable/notes/ddp.html)
</br>

</br></br></br></br>

## Contributors:

[Nishal Sundarraman] (https://github.com/MynameisNishal)
</br>
[Chinmay Nivsarks] (https://github.com/chinmay-n)
