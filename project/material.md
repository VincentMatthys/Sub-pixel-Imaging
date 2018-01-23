1. Effective reslution for printing https://www.askdesign.biz/blog/2013/08/effective-resolution-key-factor-of-image-scaling/
2. Quora:
  + [Is there a way to calculate the effective resolution of an image?](https://www.quora.com/Is-there-a-way-to-calculate-the-effective-resolution-of-an-image)
  + [How can I calculate the actual/effective resolution of a photo?](https://www.quora.com/How-can-I-calculate-the-actual-effective-resolution-of-a-photo)
  + [Is there any way to transform a low resolution image to quality high resolution?](https://www.quora.com/Is-there-any-way-to-transform-a-low-resolution-image-to-quality-high-resolution)
3. [Improving Resolution by Image Registration](material/improving_resolution_registration.pdf). Reconstruction from projections in many directions. In the superresolution case, each pixel is the projection of a region in a scene whose size is determined by the image blur.
4. [Image super-resolution survey](material/image_superresolultion_survey.pdf)
5. [Image quality assessment](material/image_quality_assessment.pdf)
  + Global phase coherence
    > As a sharp (or noise-free) image  is  much  more  sensitive  to  phase  degradations than a blurry (or noisy) image, such a characterization of  phase  coherence  is  directly  related  to  image  quality.
    > A consequence of (18) is that a texture obtained as the realization of a RPN model or a stationary Gaussian model is expected to have a small GPC value (that is, below 3 or 4 in general), which is in accordance with the fact that such texture models do not carry any phase information.
  + Shparness Index
  + Simplified version of sharpness index
6. [Image sharpness assessment based on local phase coherence](http://ieeexplore.ieee.org/document/6476013/), 2013, [with examples and (BROKEN yet) code (local copy of the code provided by the authors)](https://ece.uwaterloo.ca/~z70wang/research/lpcsi/)
  > Sharpness is an important determinant in visual assessment of image quality. The human visual system is able to effortlessly detect blur and evaluate sharpness of visual images, but the underlying mechanism is not fully understood. Existing blur/sharpness evaluation algorithms are mostly based on edge width, local gradient, or energy reduction of global/local high frequency content. Here we understand the subject from a different perspective, where sharpness is identified as strong local phase coherence (LPC) near distinctive image features evaluated in the complex wavelet transform domain. Previous LPC computation is restricted to be applied to complex coefficients spread in three consecutive dyadic scales in the scale-space. Here we propose a flexible framework that allows for LPC computation in arbitrary fractional scales.
7. [S3: A Spectral and Spatial Measure of Local Perceived Sharpness in Natural Images, 2012](http://ieeexplore.ieee.org/document/6030937/), with [examples of sharpness maps and Matlab code (that could be converted to Python)](http://vision.eng.shizuoka.ac.jp/s3/)
