# Notes

From [Satellite Image Resolution Enhancement Using Complex Wavelet Transform](https://pdfs.semanticscholar.org/928f/a8611abd47bff5af03a50f27bb59bf73bfcb.pdf)
One  of the most important quality factors in images comes from its resolution. Interpolation in image processing is a well-known method to increase the resolution of a digital image. Interpolation has been widely  used in many image-processing applications such as facial reconstruction [1], multiple-description coding [2], and resolution enhancement [3], [4].

1. [The wrinkle generation method for facial reconstruction based on extraction of partition wrinkle line features and fractal interpolation](http://ieeexplore.ieee.org/abstract/document/4297213/)
2. [Downsample-based multiple description coding and post-processing of decoding](http://ieeexplore.ieee.org/abstract/document/4605276/)
3. [Optimal image scaling using pixel classification](http://ieeexplore.ieee.org/abstract/document/958257/)
4. [Image Resolution Enhancement using Inter-Subband Correlation in Wavelet Domain](http://ieeexplore.ieee.org/abstract/document/4378987/)

# Base de données

Construction d'une base de donnée d'images réelles ou de synthèse dont on considère connaître la résolution, c'est-à-dire dont le spectre de Fourier est jugé suffisamment rempli.


# Qu'est-ce que la résolution d'une image ?

## Invariance
Définition des opéartions simples ne changeant pas la résolution effective d'une image.
  1. Zoom par zéro-paddding
  2. Changement de contraste affine

### Zoom par 0-padding
  Laisse invariant la résolution effective


## Définition conversion analogique-digitale

Effective resolution is defined in units of bits with the equation:
```
Effective resolution = log2[full-scale input voltage range/ADC RMS noise]
```
[source](https://www.maximintegrated.com/en/app-notes/index.mvp/id/5384)

# Statistiques d'évaluation

### Mesure de cohérence de phase
[Trois mesures:](material/image_quality_assessment)
  1. Global phase coherence
  2. Shparness index
  3. Index S
On préferera les deux dernières (plus rapides et sans trop de perte d'informations, cf papier Moisan 201X).

MSE
