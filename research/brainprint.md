---
title: BrainPrint
layout: lab
---

<style>
.rp-page { padding: 2.5rem 0 3rem; }
.rp-fig { text-align: center; margin: 2rem auto; }
.rp-fig img { max-width: 580px; width: 100%; height: auto; border-radius: 8px; border: 1px solid var(--lab-border); }
.rp-fig figcaption { color: #6b7a99; font-size: 0.92rem; margin-top: 0.6rem; text-align: justify; max-width: 580px; margin-left: auto; margin-right: auto; }
</style>

<div class="lab-page-header">
<div class="lab-wrap">
<a class="lab-breadcrumb" href="/research/">← Research</a>
<h1>BrainPrint</h1>
<p>Neuroanatomical shape analysis using Laplace-Beltrami spectral descriptors</p>
</div>
</div>

<div class="lab-wrap rp-page">

Our BrainPrint tools provide shape descriptors of neuroanatomical structures and require a [FastSurfer](/research/fastsurfer/) or FreeSurfer segmentation as a pre-processing step. BrainPrint is based on "ShapeDNA", a spectral shape descriptor well suited for the analysis of non-rigid bendable shapes like biological structures.

## Spectral Shape Analysis

In spectral shape analysis we employ the spectrum of the Laplace-Beltrami operator as a shape descriptor for the analysis of shape differences. The main advantage is that this descriptor is **isometry invariant** — distances measured along the surface stay the same regardless of pose. So a hand with different finger positions or a person in different body postures will be (near) isometric. We are thus able to identify similar deformable objects even if they cannot be aligned with a rigid transformation.

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/brainprint/01_eigenmode.png" alt="Eigenmode">
<figcaption>Fig. 1. First non-constant eigenmode for similar shapes. Red and blue dots at the tips denote the extrema, the green curves are level sets. The Reeb graph (gray curve) approximates the medial axis.</figcaption>
</figure>
{:/nomarkdown}

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/brainprint/02_registration.png" alt="Registration">
<figcaption>Fig. 2. Registration of segments across near-isometric shapes. Same color indicates registered parts across poses of the same model.</figcaption>
</figure>
{:/nomarkdown}

## BrainPrint

We have extended this work to analyze brain shape changes with respect to symmetry, heritability, and computer-aided diagnosis of neurodegenerative disease. The code for the BrainPrint tools is available on [GitHub](https://github.com/Deep-MI/BrainPrint) and documentation can be found [here](/BrainPrint).

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/brainprint/03_brainprint.png" alt="BrainPrint">
<figcaption>Fig. 3. Overview of BrainPrint computation. MRI scans are processed with FreeSurfer to obtain segmentations of cortical and subcortical structures. A mesh is created for each brain structure. The ShapeDNA is computed for all meshes, constituting the BrainPrint.</figcaption>
</figure>
{:/nomarkdown}

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/brainprint/04_asymmetry.png" alt="Asymmetry">
<figcaption>Fig. 4. Based on a brain segmentation, meshes from lateralized structures (e.g. the hippocampus) are created. The ShapeDNA yields the characteristic spectrum of each shape. The Mahalanobis distance between spectra of both hemispheres gives the shape asymmetry.</figcaption>
</figure>
{:/nomarkdown}

## Selected Publications

- [Documentation and API](/BrainPrint)
- [Open Source on GitHub](https://github.com/Deep-MI/BrainPrint)
- [BrainPrint: A Discriminative Characterization of Brain Morphology. C. Wachinger et al. NeuroImage. 2015.](/publications/#wachinger_2015_brainPrint)
- [Laplace-Beltrami spectra as "Shape-DNA" of surfaces and solids. M. Reuter et al. Computer-Aided Design. 2006.](/publications/#reuter_2006_shapedna)
- [Multidimensional heritability analysis of neuroanatomical shape. T. Ge et al. Nat Commun. 2016.](/publications/#ge_2016)
- [Whole-brain analysis reveals increased neuroanatomical asymmetries in dementia for hippocampus and amygdala. C. Wachinger et al. Brain. 2016.](/publications/#wachinger_2016)
- [A Longitudinal Imaging Genetics Study of Neuroanatomical Asymmetry in Alzheimer's Disease. Wachinger et al. Biol Psychiatry. 2018.](/publications/#wachinger_2018)

</div>
