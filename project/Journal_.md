# Résolution effective d'une image
  
  
Projet dans le cadre du cours d'imagerie sous-pixellique
  
Encadrant : `Lionel Moisan` à Paris Descartes - Site saint Germain
  
## lundi 3 décembre 2017
  
  
Choix du sujet (numéro 1)
Enoncé du sujet initial :
  
_La résolution nominale (nombre de pixels) d'une image peut, pour des raisons diverses, ne pas correspondre à l'information effectivement présente dans l'image. On se trouve alors dans une situation de sur-échantillonnage où, au bruit près, les hautes fréquences du spectre n'apportent aucune information. Une façon simple de réaliser ce phénomène est de réduire une image par coupure fréquentielle, puis de la rezoomer à la résolution initiale par zero-padding: si l'on obtient ainsi une image indiscernable de l'image originale, cela prouve bien que la résolution effective de l'image est inférieure à sa résolution nominale. On proposera une ou plusieurs solutions pour tenter de mesurer la résolution effective d'une image, avec une validation sur données simulées et données réelles._
  
Recherche de mots clés sur des articles traitant du sujeet :
+ _actual resolution_ - pas de résultats
+ _effective resolution_ - pas de résultats
  
## jeudi 7 décembre 2017
  
  
Premières pistes données par M. Moisan :
### Définir un cadre précis.
  
Dans un premier temps, définir ce qu'on entend par réslution effective d'une image.
1. Se dire qu'une image sous-résolue présente un spectre dont les hautes fréquence sont principalement du bruit, et qu'on gagnerait donc en résolution si on les coupait.
+ Partir du fait qu'un bruit blanc gaussien `pur` a une résolution nulle, même si dans le cadre de la théorie de l'information, au contraire, sa résolution n'est pas nulle (puisque si on transmet des choses cohérentes entre-elles, on peut optimiser la transmission en ne conservant que les parties incohérentes)
+ Définir des opérations simples ne changeant pas la résolution effective d'une image. Par exemple, le zoom par zéro padding avec rajout de bruit sur les hautes fréquences ne change pas la résolution effective (suivant notre définition)
+ Construire une base d'images réelles ou de synthèse dont on considère connaître la résolution (c'est-à-dire donc le spectre de Fourier est jugé suffisamment rempli)
+ Si on prend une image, qu'on randomise sa phase, trouver des statistiques d'évaluation du résultat obtenu. Si le résultat obtenu contient appproximativement la même information, on peut alors considérer que la résolution de l'image considérée n'est pas la résolution nominale. (Même concept possible en randomisant le module ?).
+ Question substencielle : qu'est-ce qu'un bruit blanc.
  
  
### Objectif (modulable) déterminer quelle est la résolution effective d'une image
  
  
## mardi 23 janvie 2018
  
(Premier point sur le projet)
  
Il a été rappelé que le but du projet n'était pas forcément d'aboutir à une méthode satisfaisante ni complète pour déterminer la résolution d'une image, mais bien la démarche et l'approfondissement de la méthode choisie.
  
1. On peut commencer par définir de façon triviale la résolution d'une image comme étant le plus petit rectangle contenant tout le spectre de Fourier de l'image originale. C'est _stable_ par zoom par zéro-padding, mais le bruit blanc gaussien n'aurait pas une résolution nulle.
2. On modélise le bruit additif gaussien : <img src="https://latex.codecogs.com/gif.latex?u%20=%20&#x5C;tilda{u}%20+%20n"/>, et on prend la transformée de Fourier. Le bruit étant additif, les coefficients de Fourier de u sont la somme de la contribution des coefficients de Fourier de v, l'image débruitée et de n, du bruit. Chaque composant de TF(v) va alors être bruitée par une variable gaussienne.
  + Considérant le résidu <img src="https://latex.codecogs.com/gif.latex?&#x5C;int_{Omega_tilda%20&#x5C;%20Omega}"/>
  