

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3988569.svg)](https://doi.org/10.5281/zenodo.3988569)



# QI

QI is a package for Mathematica computer algebra system developed to support symbolic analysis of quantum states and operations.

## Usage

Package funcionality is defined in `QI.m`, `QIExtras.m`, and `QINisq` files, whish should be placed in `Applications` subdirectory in `.Mathematica` directory (on Unix-based systems).

The main package can be loaded
```
<<QI`
```

Less common functionality is available in `QIExtras` package

```
<<QIExtras`
```

Functions relevant for NISQ computing are available in `QINisq` package.
```
<<QINisq`
```

## Documentation

Documentation, including description of all functions, is available in `doc` subdirectory.

## Authors

J.A. Miszczak, Z. Puchała, P. Gawron, Quantum Sytstems of Informatics Groups, IITiS PAN, Gliwice

## Cite us


J.A. Miszczak, Z. Puchała, P. Gawron, *QI package for anaylsis of quantum systems, 2011-*, https://github.com/iitis/qi


Parts of the packages were also described in
J.A. Miszczak,  *Singular values decomposition and matrix reorderings in quantum information theory*, International Journal of Modern Physics C 22 (9), DOI:[10.1142/S0129183111016683](https://doi.org/10.1142/S0129183111016683), arXiv:[1011.1585
](https://arxiv.org/abs/1011.1585).

```
@article{miszczak2011singular,
  title={Singular value decomposition and matrix reorderings in quantum information theory},
  author={Miszczak, Jaros{\l}aw Adam},
  journal={International Journal of Modern Physics C},
  volume={22},
  number={09},
  pages={897--918},
  year={2011},
  publisher={World Scientific}
}
```
