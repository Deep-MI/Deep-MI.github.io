---
title: Fatsegnet Research
author: Santiago Estrada
layout: default
group: research
---


# FatSegNet

FatSegNet is a novel, fast, and fully automated deep learning pipeline to accurately identify, segment, and quantify visceral and subcutaneous adipose tissue (VAT and SAT) within a consistent, anatomically defined abdominal region on Dixon MRI scans. The proposed pipeline implements a three-stage design with our Competitive Dense Fully Convolutional Network (CDFNet) architecture at the core for localizing the abdominal region and segmenting the abdominal adipose tissue.

<img src="/static/img/research/fatsegnet/2_FatSegNet_pipeline.jpg" class="responsive" alt="FatSegNet Pipeline" style="
	display: block;
	margin-left: auto;
	margin-right: auto;
  width: 100%;
    max-width: 600px;
    height: auto;
">
<div  style="text-align: center;"> Fig 1. Proposed FatSegNet pipeline for segmenting Abdominal Adipose tissue
</div>


{::nomarkdown}
<div class="video-container">
         <iframe src="https://www.youtube.com/embed/eWqRT95fJYs" frameborder="0" width="280" height="107"></iframe>
</div>
{:/nomarkdown}



Our CDFNet is implemented by adopting a Dense-Unet architecture  and extending it toward competitive learning via maxout activations. The Maxout operation computes the maximum at each spatial location across feature maps instead of concatenating them. Some benefits of competitive learning through Maxout activations are:
- It promotes the formation of dedicated local sub-networks and improves features selectivity by introducing local competition.
- Each sub-network is capable of learning a sub-problem more efficiently. 
- By training only one network, all sub-networks are jointly regularized.
- It reduces the dimensionality of the feature space, hence it requires a significant lower number of learnable parameters.

<img src="/static/img/research/fatsegnet/3_CDFNet_method_v2.jpg" alt="CDFNet" style="
	display: block;
	margin-left: auto;
	margin-right: auto;
  width: 100%;
    max-width: 500px;
    height: auto;
">
<div  style="text-align: center;"> Fig 2. CDFNet architecture, the output filter for all convolutional layers in CUB, CDB and bottleneck were standardized to 64 channels.
</div>

For more information into competitive learning please check:
- Estrada, Santiago, et al. "Competition vs. concatenation in skip connections of fully convolutional networks." International Workshop on Machine Learning in Medical Imaging. Springer, Cham, 2018. [arxiv](https://arxiv.org/pdf/1807.07803.pdf)
- Goodfellow, Ian J., et al. "Maxout networks." arXiv preprint arXiv:1302.4389 (2013). [arxiv](http://proceedings.mlr.press/v28/goodfellow13.pdf)
-  Srivastava, Rupesh Kumar, et al. "Understanding locally competitive networks." arXiv preprint arXiv:1410.1165 (2014). [arxiv](https://arxiv.org/abs/1410.1165)
- Liao, Zhibin, and Gustavo Carneiro. "Competitive multi-scale convolution." arXiv preprint arXiv:1511.05635 (2015).[arxiv](https://arxiv.org/abs/1511.05635)

## Proof of Concept
FatSegNet is tested and validated in the [Rhineland Study](https://www.rheinland-studie.de/) – a large prospective cohort study based in Bonn, Germany. We evaluate the whole pipeline with respect to robustness and reliability against two independent test sets: a manually edited and a test-retest set. Additionally, we present a case study on unseen data comparing the VAT-V and SAT-V calculated from the FatSegNet segmentations against BMI to replicate age and sex effects on these volumes in a large cohort. 

### FatSegNet Performance
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-60hs{font-size:20px;text-align:left;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
<table class="tg" align="center">
  <tr>
    <td class="tg-0pky">N</td>
    <td class="tg-c3ow">Metric</td>
    <td class="tg-c3ow">VAT</td>
    <td class="tg-c3ow">SAT</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="4">Segmentation Accuracy: <span style="font-style:italic">FatSegNet</span> vs. Inter-Rater variability</td>
  </tr>
  <tr>
    <td class="tg-0pky">5</td>
    <td class="tg-0pky">DSC (SD)</td>
    <td class="tg-0pky"><span style="font-weight:bold">0.850</span> (0.076) vs. 0.788 (.060)</td>
    <td class="tg-0pky"><span style="font-weight:bold">0.975</span> (0.018) vs. 0.982 (0.018)</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="4">Test-Retest Reliability: Agreement between predictions of 2 consecutive scans</td>
  </tr>
  <tr>
    <td class="tg-0pky">17</td>
    <td class="tg-c3ow">ICC (A,1)<br>[95% CI</td>
    <td class="tg-c3ow">0.998<br>[0.995 - 0.999]</td>
    <td class="tg-c3ow">0.996<br>[0.986 - 0.999]</td>
  </tr>
  <tr>
    <td class="tg-0lax" colspan="4">Segmentation Generalizability: Agreement between FatSegNet and manually corrected predictions</td>
  </tr>
  <tr>
    <td class="tg-0lax">50</td>
    <td class="tg-baqh">ICC (A,1)<br>[95% CI</td>
    <td class="tg-baqh">0.999<br>[0.994 - 0.999]</td>
    <td class="tg-baqh">0.999<br>[0.999 – 1.000]</td>
  </tr>
</table>
<br>

### Validation in the Rhineland Study (N=587)

##### Replication of known age and sex effects on VAT and SAT volumes  
<img src="/static/img/research/fatsegnet/association.jpg" alt="Age-Gender-Effects" style="
	display: block;
	margin-left: auto;
	margin-right: auto;
  width: 100%;
    max-width: 400px;
    height: auto;
">
<div  style="text-align:justify;"> Fig 3. Association between age and volumes of SAT and VAT in men and women. VAT volumes significantly increased with age, and SAT volumes weakly associated with age in women (β= 0.02, p= 0.01) [[Machann et al.2005](https://link.springer.com/article/10.1007/s10334-005-0104-x), [Kuk et al.2005](https://academic.oup.com/ajcn/article/81/6/1330/4648767)]
</div>


##### Performance on Unseen Data 
<img src="/static/img/research/fatsegnet/results_unseen_data.jpg" alt="Results" style="
	display: block;
	margin-left: auto;
	margin-right: auto;
  width: 100%;
    max-width: 600px;
    height: auto;
">
<div  style="text-align: justify;"> Fig 4. Examples of FatSegNet results of different body shapes (blue: SAT, green: VAT, orange: bone and surrounding tissue, and red: other-tissue). A) arms in front of the abdominal cavity, B) obese-BMI, C) underweight-BMI, D) breast, and E) deviated spine
</div>

## Tool and Paper
- Our tool is available at [github](https://github.com/deep-mi/FatSegNet).
- For more information about FatSegNet please check our [journal paper](https://onlinelibrary.wiley.com/doi/full/10.1002/mrm.28022?af=R).
- A quick presentation on [YouTube](https://www.youtube.com/watch?v=eWqRT95fJYs).

## News
- FatSegNet was selected as June’s 2020 [MRM Highlights](https://blog.ismrm.org/category/highlights/) by the ISMRM community. More information: [Q&A](https://blog.ismrm.org/2020/06/19/qa-with-santiago-estrada-and-martin-reuter/) and [reproducible research](https://blog.ismrm.org/2020/07/03/reproducible-research-insights-with-santiago-estrada-and-martin-reuter/) interviews. 
- To the day our tool has been deployed in 2738 participants from the [Rhineland-Study](https://www.rheinland-studie.de/) processing 16520.52 Liters of Abdominal Adipose Tissue which are equal to 1939 cases of beer or 4130 six-packs.
- Currently, we are collaborating with [GenerationR](https://generationr.nl/) for improving the Domain adaptation of our tool into a wider population (age<30).
- We are happy to announce that one of our paper images got into the cover of the April edition of the journal [Magnetic Resonance in Medicine](https://onlinelibrary.wiley.com/toc/15222594/2020/83/4). 

<img src="/static/img/research/fatsegnet/mrm.v83.4.cover.jpg" alt="MRM Cover" style="
  display: block;
  margin-left: auto;
  margin-right: auto;
    width: 150px;
    height: auto;
">



