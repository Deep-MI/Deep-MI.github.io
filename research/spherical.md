---
title: p3CNN — Cortical Surface Segmentation
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
<h1>p3CNN</h1>
<p>Cortical surface parcellation using projection-based 3D convolutional neural networks on spherical meshes</p>
</div>
</div>

<div class="lab-wrap rp-page">

Spherical coordinate systems have become a standard for analyzing human cortical neuroimaging data. Surface-based signals such as curvature, folding patterns, functional activations, or estimates of myelination define relevant cortical regions. Surface-based deep learning approaches such as spherical CNNs, however, primarily focus on classification and cannot yet achieve satisfactory accuracy in segmentation tasks.

To perform surface-based segmentation of the human cortex, we introduce and evaluate a 2D parameter space approach with view aggregation (**p3CNN**). We show that it outperforms the spherical CNN by a margin, increasing the average Dice similarity score for cortical segmentation to above 0.9.

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/spherical/segmentation_bvm.jpg" alt="Spherical Segmentation">
<figcaption>Comparison of a spherical CNN (ugscnn, middle) and our proposed view-aggregation on 2D spherical parameter spaces (p3CNN, right) for cortical segmentation (bottom row).</figcaption>
</figure>
{:/nomarkdown}

## Links

- [Parameter Space CNN for Cortical Surface Segmentation](https://link.springer.com/chapter/10.1007/978-3-658-29267-6_49)
- [YouTube presentation](https://www.youtube.com/watch?v=2KHYIrL7Lyo)

## News

**May 2020** — Congratulations to Leonie Henschel for 1st place: Best Scientific Submission at the [BVM Workshop 2020](https://www.bvm-workshop.org/).

</div>
