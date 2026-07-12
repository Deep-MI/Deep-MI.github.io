---
title: Program — FastSurfer/FreeSurfer Course 2026
layout: lab
group: events
---

<div class="lab-page-header">
<div class="lab-wrap">
<a class="lab-breadcrumb" href="/events/">← Events</a>
<h1>FastSurfer / FreeSurfer Course 2026</h1>
<p>October 14&ndash;16, 2026 &middot; German Center for Neurodegenerative Diseases (DZNE), Bonn</p>
</div>
</div>
<nav class="fs26-nav">
<div class="lab-wrap">
<a href="/events/workshops/fastsurfer-course-2026/">Overview</a>
<a href="/events/workshops/fastsurfer-course-2026/program">Program</a>
<a href="/events/workshops/fastsurfer-course-2026/schedule">Schedule</a>
<a href="/events/workshops/fastsurfer-course-2026/location">Location</a>
<a href="/events/workshops/fastsurfer-course-2026/registration" class="reg">Register</a>
</div>
</nav>
<style>
.fs26-nav { background:#162032; border-bottom:1px solid rgba(255,255,255,0.1); }
.fs26-nav .lab-wrap { display:flex; gap:0; overflow-x:auto; }
.fs26-nav a { color:rgba(255,255,255,0.72); font-size:0.87rem; font-weight:500; padding:0.65rem 1.1rem; white-space:nowrap; text-decoration:none; transition:color .15s,background .15s; border-right:1px solid rgba(255,255,255,0.06); }
.fs26-nav a:hover { color:#fff; background:rgba(255,255,255,0.08); text-decoration:none; }
.fs26-nav a.reg { color:#fff; background:var(--lab-accent); font-weight:600; border-right:none; margin-left:auto; }
.fs26-nav a.reg:hover { background:#0b7a71; color:#fff; }
</style>

<div class="lab-wrap" markdown="1" style="padding-top:2.5rem;padding-bottom:4rem">

## Program

<img src="/static/img/events/p_flowchart.png" alt="Course flowchart" style="width:100%;max-width:800px;height:auto;margin-bottom:1.5rem">

<div style="text-align:justify"> 
The DeepMI FastSurfer/FreeSurfer course will be divided into several modules that give a comprehensive overview of the FastSurfer and FreeSurfer software packages and provide detailed guidance for their application in your own research. After an <span style="color:#808080">**introduction**</span>, the <span style="color:#21bfbf">**segmentation**</span> module will cover advanced deep-learning methods for image segmentation. The <span style="color:#147373">**surface**</span> module will explain how 3D surface models are created from brain images. The <span style="color:#732b14">**group analysis**</span> module will discuss statistical modeling and inference for obtaining interpretable results in a group analysis. The <span style="color:#bf4821">**longitudinal**</span> module will integrate the segmentation, surface processing, and statistical analysis topics for study designs with longitudinal data. Finally, the <span style="color:#2163bf">**QC and ecosystem**</span> modules give practical guidance on QC and troubleshooting as well as an outlook into the current and future FastSurfer ecosystem. All lectures will be accompanied by demos and/or practical exercises.
</div>

---

## <span style="color:#808080">Introduction to structural neuroimaging</span>

<img src="/static/img/research/fastsurfer/01_teaser_white.png" alt="FastSurfer overview" style="width:100%;max-width:600px;height:auto;margin-bottom:1rem">

This module provides an **overview** of the FastSurfer / FreeSurfer software packages, their image processing pipelines, and the resulting metrics for quantifying anatomical properties of the human brain. This includes:
- A brief introduction to artificial intelligence and human neuroimaging research
- Application of FastSurfer and FreeSurfer in human neuroimaging studies
- Properties, commonalities and differences of the FastSurfer and FreeSurfer software packages

This module also includes a short tutorial on working with our Linux workstations and on running scripts via the command line.

---

## <span style="color:#21bfbf">Advanced deep-learning for image segmentation</span>

<img src="/static/img/events/p_segmentation.jpg" alt="Segmentation" style="width:100%;max-width:600px;height:auto;margin-bottom:1rem">

This session covers the core module of the FastSurfer software — fast and reliable image **segmentation**. We will focus on the analysis of individual cases and discuss the following topics:
- Deep-learning-based segmentation of anatomical brain images
- From images to metrics: quantification of anatomical information
- Pipelines, commands, outputs: practical and technical aspects 
- How to get everything up and running: installation, setup, and deployment of the FastSurfer and FreeSurfer software

This module includes a practical session during which participants can conduct their own segmentation analysis using FastSurfer and evaluate the resulting output.

---

## <span style="color:#147373">Surface models of the brain</span>

<img src="/static/img/research/fastsurfer/03_recon_surf.png" alt="Surface models" style="width:100%;max-width:600px;height:auto;margin-bottom:1rem">

This module continues the analysis of individual cases and introduces the creation of **surface models** of the brain and how they can be used to extract a rich set of anatomical and morphometric features. It will cover the following topics:
- What are surface models — and why should we use them?
- What surface-based outputs can we get — and how can we use them?
- Surface registration and the preparation of statistical analysis

A practical session will allow participants to become familiar with the full FastSurfer / FreeSurfer output as well as the Freeview program, our primary tool for the visualization and inspection of individual results.

---

## <span style="color:#bf4821">Longitudinal processing and analysis</span>

<img src="/static/img/events/p_longitudinal.png" alt="Longitudinal analysis" style="width:100%;max-width:600px;height:auto;margin-bottom:1rem">

This module is about **longitudinal image processing and statistical analysis**. Longitudinal study designs can be very powerful for detecting subtle changes across time, but come with their own challenges and intricacies. We will discuss:
- Unbiased within-subject registration and person-specific templates
- Advanced statistical analysis using linear mixed-effect models for modeling changes within and differences across persons
- Implementation in FastSurfer's longitudinal stream

A practical session demonstrates basic steps and commands for longitudinal processing, results inspection, and the setup, conduction, and interpretation of a statistical analysis.

---

## <span style="color:#732b14">Statistical modeling and inference</span>

<img src="/static/img/events/p_group.jpg" alt="Group analysis" style="width:100%;max-width:600px;height:auto;margin-bottom:1rem">

This module covers **statistical modeling and inference**. We will address how data from individual cases can be aggregated at the group level for the purpose of answering applied research questions (e.g., group differences, association studies). We will discuss:
- Application of the general linear model in neuroimaging analyses
- The statistical design: hypotheses, contrasts, statistical parameters
- Multiple comparison correction in mass-univariate analyses
- Commands, output files, and visualization using the Freeview software

A practical session covers the complete workflow of an analysis at the group level, using preprocessed data from a prototypical study.

---

## <span style="color:#2163bf">Quality control and edits</span>

<img src="/static/img/events/p_qc.jpg" alt="Quality control" style="width:100%;max-width:600px;height:auto;margin-bottom:1rem">

This module illustrates potential **pitfalls and issues** during a FastSurfer / FreeSurfer analysis, and provides suggestions for mitigating them. It will cover:
- Quality control: automatic and visual inspection of processing results
- Manual edits: how to manually correct segmentations for challenging cases
- Troubleshooting: what to do in case of processing failures or segmentation errors
- Caveats: scenarios when (and how) to use FastSurfer or FreeSurfer — and when not

During a practical session, participants will learn how to apply strategies and techniques for quality checking.

---

## <span style="color:#143b73">The FastSurfer ecosystem</span>

<img src="/static/img/events/p_eco-white.jpg" alt="FastSurfer ecosystem" style="width:100%;max-width:600px;height:auto;margin-bottom:1rem">

The final module introduces the **FastSurfer ecosystem**, i.e. the set of software tools that extend and smoothly interoperate with the core FastSurfer software. We also give an outlook about future directions in the development of the software. We will cover:
- Specialized application scenarios: infants, lesions, high-resolution or high field-strength data
- Add-on modules for Amygdala/Hippocampus, Thalamus, Hypothalamus, Olfactory Bulb, brainstem, Cerebellum
- Outlook to ongoing and planned developments; interaction with the FastSurfer user community

The course concludes with a question-and-answer session about any potentially remaining issues.

</div>
