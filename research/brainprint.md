---
title: BrainPrint
layout: default
group: research
---

# BrainPrint - Neuroanatomical Shape Analysis 

Our BrainPrint tools provide shape descriptors of neuroanatomical structures and require a FreeSurfer or
[FastSurfer](/research/fastsurfer/) segmentation as a pre-processing step.
BrainPrint is based on "ShapeDNA" a spectral shape descriptor that is well suited for the analysis of non-rigid
bendable shapes like biological structures. 

## Spectral Shape Analysis

In spectral shape analysis we employ the spectrum of the Laplace-Beltrami operator as a shape descriptor for the analysis of
shape differences. The main advantage is that this descriptor is isometry invariant. Isometry invariance means that distances
measured along the surface stay the same. So a hand with different finger positions or a person in different body postures
will be (near) isometric, as not much streching is involved. The distance from the nose to the foot is fixed for different
body postures, if measured along the surface (as opposed to measuring it in the embedding space).
Thus we are able to identify similar deformable objects even if they cannot be aligned/compared with a rigid transformation!

<!--- Example image needed -->

## BrainPrint

We have extended this work to analyze brain shape changes (with respect to symmetry, heritability, computer-aided diagnosis
of neurodegenerative disease, etc): BrainPrint Publication. 

<!--- More details and figures needed, also links to github code and short doc on how to use -->

## Selected Publications and Links

 - [BrainPrint: A Discriminative Characterization of Brain Morphology. C.Wachinger, ..., M.Reuter. NeuroImage 109:232-248, 2015.](/publications#reuter_2015)
 - [Laplace-Beltrami spectra as "Shape-DNA" of surfaces and solids. M. Reuter, F.-E. Wolter and N. Peinecke. Computer-Aided Design 38(4):342-366, 2006.](/publications#reuter_2006)

