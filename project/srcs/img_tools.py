import numpy as np
from numpy.fft import fft2, ifft2

def per_smooth_decomposition(u):
    """
    Periodic plus Smooth Image Decomposition
    Adapted from matlab implementation of Lionel Moisan
    available here http://www.mi.parisdescartes.fr/~moisan/p+s
    ----------------------------------------------------------

    Input:
    ------
    u: 2D array, float
       original image

    Output:
    -------
    p: 2D array
       periodic component of u
    s: 2D array
       smooth component of u
    """
    assert type(u) == np.ndarray and u.dtype == 'float',\
           "Input should be a np.array of type float"
    # Get the shape of u
    N, M = u.shape
    # Intermediate tool for computation
    v = np.zeros((N, M))
    v[0, :] = u[0, :] - u[-1, :]
    v[-1, :] = -v[0, :]
    v[:, 0] += u[:, 0] - u[:, -1]
    v[:, -1] += - u[:, 0] + u[:, -1]
    # Numerator part of smooth FT
    numerator = 0.5 * fft2(v)
    # Periodic part of smooth FT
    aux = 2 * np.pi * np.indices(u.shape)
    denominator = 2 - np.cos(aux[0] / N) - np.cos(aux[1] / M)
    # To avoid division by 0
    denominator[0, 0] = 1
    s = np.real(ifft2(numerator / denominator))
    p = u - s
    return p, s
