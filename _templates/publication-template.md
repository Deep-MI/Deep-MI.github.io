# Publication Template

Copy this template when adding a new publication to `_data/publications.yml`

```yaml
- id: 'lastname_year'
  authors: '**Labmember A**, Someone B, **Labmember C**, Lastauthor D'
  title: 'The title of this paper (use two single quotes to escape: Alzheimer''s)'
  journal: 'Journal Name or *under review*'
  type: 'journal'  # journal, conference, workshop, abstract, poster, preprint
  year: 2026
  month: 2  # optional
  pages: '123-145'  # optional
  volume: '42'  # optional
  number: '3'  # optional
  image: '/static/pub/lastname_year.jpg'
  pmcid: 'PMC1234567'  # optional - PubMed Central ID
  pmid: '12345678'  # optional - PubMed ID
  biorxiv: '2024.01.01.123456'  # optional - bioRxiv ID
  arxiv: '2401.12345'  # optional - arXiv ID
  doi: '10.1234/journal.2024.123456'  # strongly recommended
  pdf: 'https://journal.com/paper.pdf'  # or '/static/pub/lastname_year.pdf'
  github: 'deep-mi/repository-name'  # optional - relative to github.com
  bibtex: '/static/pub/lastname_year.bib'
  links:  # optional - additional links
    - name: 'Project Website'
      url: 'https://project.example.com'
    - name: 'Dataset'
      url: 'https://data.example.com'
```

## Requirements

1. **Teaser Image**: Max 200px height, JPEG format, max 100KB
   - Location: `/static/pub/paper_id.jpg`
2. **BibTeX file**: `/static/pub/paper_id.bib`
3. **PDF**: Link to open access or local file at `/static/pub/paper_id.pdf`
4. **paper_id**: Should match the `id` field

## Required Fields
- id (unique identifier)
- authors (bold lab members with `**name**`)
- title
- journal
- type
- year

## Tips

- Use single quotes for strings with special characters
- Always include DOI if available
- Bold current and former lab members in author list
- Keep image file size small (max 100KB)
- Test that all file paths exist before committing

