---
title: p3CNN - Cortical Surface Segmentation
author: Martin Reuter
layout: default
group: research
---

## p3CNN - Cortical Surface Segmentation

Spherical coordinate systems have become a standard for analyzing human cortical neuroimaging data.
Surface-based signals, such as curvature, folding patterns, functional activations, or estimates of
myelination define relevant cortical regions. Surface-based deep learning approaches, however, such
as spherical CNNs primarily focus on classification and cannot yet achieve satisfactory accuracy in
segmentation tasks. To perform surface-based segmentation of the human cortex, we introduce and
evaluate a 2D parameter space approach with view aggregation (p3CNN). We evaluate this network with
respect to accuracy and show that it outperforms the spherical CNN by a margin, increasing the
average Dice similarity score for cortical segmentation to above 0.9.

<img src="/static/img/research/spherical/segmentation_bvm.jpg" class="responsive" alt="Spherical-Segmentation" style="
	display: block;
	margin-left: auto;
	margin-right: auto;
  width: auto;
  max-width: 600px;
  height: auto;
">
<div  style="text-align: justify; width:600px; margin:0 auto;">
Figure: Comparison of a spherical CNN (ugscnn, middle) and our proposed view-aggregation on 2D spherical parameter
spaces (p3CNN, right) for cortical segmentation of the cortex (bottom row).
</div>


### Links

- [Parameter Space CNN for Cortical Surface Segmentation](https://link.springer.com/chapter/10.1007/978-3-658-29267-6_49)
- [YouTube presentation](https://www.youtube.com/watch?v=2KHYIrL7Lyo) 


### News

2020 May: Congratulations to Leonie Henschel for the 1st place: Best Scientific Submission at the 
2020 [BVM Workshop](https://www.bvm-workshop.org/)



