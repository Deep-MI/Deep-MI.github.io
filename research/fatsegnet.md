---
title: FatSegNet
layout: lab
---

<style>
.rp-page { padding: 2.5rem 0 3rem; }
.rp-fig { text-align: center; margin: 2rem auto; }
.rp-fig img { max-width: 580px; width: 100%; height: auto; border-radius: 8px; border: 1px solid var(--lab-border); }
.rp-fig figcaption { color: #6b7a99; font-size: 0.92rem; margin-top: 0.6rem; text-align: justify; }
.rp-table { border-collapse: collapse; width: 100%; margin: 1.5rem 0; font-size: 0.9rem; }
.rp-table th { background: var(--lab-soft, #f1f5fb); font-weight: 600; }
.rp-table th, .rp-table td { border: 1px solid var(--lab-border); padding: 0.5rem 0.75rem; text-align: center; }
.rp-table td:first-child { text-align: left; }
.rp-table tr.rp-subhead td { font-style: italic; background: var(--lab-soft, #f1f5fb); text-align: left; }
</style>

<div class="lab-page-header">
<div class="lab-wrap">
<a class="lab-breadcrumb" href="/research/">← Research</a>
<h1>FatSegNet</h1>
<p>Deep learning pipeline for automated abdominal adipose tissue segmentation on Dixon MRI</p>
</div>
</div>

<div class="lab-wrap rp-page">

FatSegNet is a fast and fully automated deep learning pipeline to accurately identify, segment, and quantify visceral and subcutaneous adipose tissue (VAT and SAT) within a consistent, anatomically defined abdominal region on Dixon MRI scans. The pipeline implements a three-stage design with our Competitive Dense Fully Convolutional Network (CDFNet) architecture at its core for localizing the abdominal region and segmenting abdominal adipose tissue.

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/fatsegnet/2_FatSegNet_pipeline.jpg" alt="FatSegNet Pipeline">
<figcaption>Fig. 1. Proposed FatSegNet pipeline for segmenting abdominal adipose tissue.</figcaption>
</figure>
{:/nomarkdown}

## CDFNet Architecture

Our CDFNet adopts a Dense-Unet architecture extended toward competitive learning via maxout activations. The Maxout operation computes the maximum at each spatial location across feature maps instead of concatenating them. Benefits of competitive learning through Maxout activations:

- It promotes dedicated local sub-networks and improves feature selectivity through local competition.
- Each sub-network can learn a sub-problem more efficiently.
- All sub-networks are jointly regularized by training only one network.
- It reduces the dimensionality of the feature space, requiring significantly fewer learnable parameters.

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/fatsegnet/3_CDFNet_method_v2.jpg" alt="CDFNet">
<figcaption>Fig. 2. CDFNet architecture. Output filters for all convolutional layers in CUB, CDB and bottleneck are standardized to 64 channels.</figcaption>
</figure>
{:/nomarkdown}

For more information on competitive learning:
- Estrada et al. "Competition vs. concatenation in skip connections of fully convolutional networks." MLMI 2018. [arxiv](https://arxiv.org/pdf/1807.07803.pdf)
- Goodfellow et al. "Maxout networks." arXiv:1302.4389 (2013). [arxiv](https://proceedings.mlr.press/v28/goodfellow13.pdf)
- Srivastava et al. "Understanding locally competitive networks." arXiv:1410.1165 (2014). [arxiv](https://arxiv.org/abs/1410.1165)
- Liao &amp; Carneiro. "Competitive multi-scale convolution." arXiv:1511.05635 (2015). [arxiv](https://arxiv.org/abs/1511.05635)

## Proof of Concept

FatSegNet was tested and validated in the [Rhineland Study](https://www.rheinland-studie.de/), a large prospective cohort study based in Bonn, Germany. We evaluate the whole pipeline with respect to robustness and reliability against two independent test sets: a manually edited set and a test-retest set.

{::nomarkdown}
<table class="rp-table">
<thead>
<tr><th>N</th><th>Metric</th><th>VAT</th><th>SAT</th></tr>
</thead>
<tbody>
<tr class="rp-subhead"><td colspan="4">Segmentation Accuracy: FatSegNet vs. Inter-Rater variability</td></tr>
<tr><td>5</td><td>DSC (SD)</td><td><strong>0.850</strong> (0.076) vs. 0.788 (.060)</td><td><strong>0.975</strong> (0.018) vs. 0.982 (0.018)</td></tr>
<tr class="rp-subhead"><td colspan="4">Test-Retest Reliability: Agreement between predictions of 2 consecutive scans</td></tr>
<tr><td>17</td><td>ICC (A,1) [95% CI]</td><td>0.998 [0.995&ndash;0.999]</td><td>0.996 [0.986&ndash;0.999]</td></tr>
<tr class="rp-subhead"><td colspan="4">Segmentation Generalizability: Agreement between FatSegNet and manually corrected predictions</td></tr>
<tr><td>50</td><td>ICC (A,1) [95% CI]</td><td>0.999 [0.994&ndash;0.999]</td><td>0.999 [0.999&ndash;1.000]</td></tr>
</tbody>
</table>
{:/nomarkdown}

### Validation in the Rhineland Study (N=587)

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/fatsegnet/association.jpg" alt="Age-Gender-Effects">
<figcaption>Fig. 3. Association between age and volumes of SAT and VAT in men and women. VAT volumes significantly increased with age; SAT volumes weakly associated with age in women.</figcaption>
</figure>
{:/nomarkdown}

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/fatsegnet/results_unseen_data.jpg" alt="Results on unseen data">
<figcaption>Fig. 4. Examples of FatSegNet results on different body shapes (blue: SAT, green: VAT, orange: bone and surrounding tissue, red: other tissue). A) arms in front of the abdominal cavity, B) obese-BMI, C) underweight-BMI, D) breast, E) deviated spine.</figcaption>
</figure>
{:/nomarkdown}

## Tool and Paper

- Tool available on [GitHub](https://github.com/deep-mi/FatSegNet)
- [Journal paper](https://onlinelibrary.wiley.com/doi/full/10.1002/mrm.28022) — Magnetic Resonance in Medicine 2020
- [YouTube presentation](https://www.youtube.com/watch?v=eWqRT95fJYs)

## News

- FatSegNet was selected as June 2020 [MRM Highlights](https://blog.ismrm.org/category/highlights/) by the ISMRM community — [Q&amp;A interview](https://blog.ismrm.org/2020/06/19/qa-with-santiago-estrada-and-martin-reuter/) · [reproducible research interview](https://blog.ismrm.org/2020/07/03/reproducible-research-insights-with-santiago-estrada-and-martin-reuter/).
- The tool has been deployed in 2,738 participants from the [Rhineland Study](https://www.rheinland-studie.de/), processing 16,520 liters of abdominal adipose tissue.
- We are collaborating with [GenerationR](https://generationr.nl/) to improve domain adaptation to a wider population (age &lt; 30).
- One of our paper images appeared on the cover of the April 2020 edition of [Magnetic Resonance in Medicine](https://onlinelibrary.wiley.com/toc/15222594/2020/83/4).

{::nomarkdown}
<figure class="rp-fig">
<img src="/static/img/research/fatsegnet/mrm.v83.4.cover.jpg" alt="MRM Cover" style="max-width:160px">
</figure>
{:/nomarkdown}

</div>
