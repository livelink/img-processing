# AI Image Processing, Hackathon LiveLink 2021

This project is to show how are working some AI APIs in order to help users to improve or add creatives photos before print. 

Basically we call deepai.org API, remove.gb API (using RestClient), and RMagick to apply the following effects:

- colorizer (deepai.org)
- 'torch-srgan' (deepai.org)
- toonify (deepai.org)
- deepdream (deepai.org)
- waifu2x (deepai.org)
- remove_bg (remove.bg)
- blur (RMagick)
- blur_bg (RMagick + remove.bg)

## Another interesting research
### PyTorch libraries
[Object detection and tracking in PyTorch](https://towardsdatascience.com/object-detection-and-tracking-in-pytorch-b3cf1a696a98)
Learn how to use PyTorch to detect multiple objects in an image, and then how to track objects across video frames.
### OpenCV

### GAN Dissect
gandissect.res.ibm.com
Painting with GANs from MIT-IBM Watson AI Lab
This demo lets you modify a selection of meaningful GAN units for a generated image by simply painting.
http://gandissect.res.ibm.com/ganpaint.html?project=churchoutdoor&layer=layer4 

 (191 kB)
## Project settings

* Ruby version
2.7.1

* Rails version
6.0.3

* System dependencies
- ImageMagick

* Configuration
_.env_ keys to the AI APIs:

```bash
REMOVE_BG_KEY=...
DEEPAI_KEY=...
```

