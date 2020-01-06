1. Using cuda() to move data to GPU.
Original sample runs on CPU!
GPU is far slower (double the time) than CPU
2. RNN from scratch
New to pyTorch, as usual, wanted to learn by doing things from scratch. Below are a few blogs that got me going.

Number 1, really from scratch
https://towardsdatascience.com/understanding-pytorch-with-an-example-a-step-by-step-tutorial-81fc5f8c4e8e?#3a3f

ImageRNN but it is using nn.RNN, I wanted even lower.. 🙂
https://medium.com/dair-ai/building-rnns-is-fun-with-pytorch-and-google-colab-3903ea9a3a79

PyTorch – Tutorial that set me thinking..but this is text classification not using Dataloader and batch processing, as I consider batching is tricky one to get going, so, I wanted to indulge on it 😉

https://pytorch.org/tutorials/intermediate/char_rnn_classification_tutorial.html
https://pytorch.org/tutorials/beginner/former_torchies/nnft_tutorial.html

More details here https://ojaslabs.com/pytorch-rnn-from-scratch
