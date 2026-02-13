# Member Template

Copy this template when adding a new member to `_data/members.yml`

```yaml
- name: Full Name
  image: /static/img/members/lastname.jpg
  position: Job Title (e.g., PhD Student, Postdoc, Research Assistant)
  email: name.surname (at) institution.edu
  scholar: GoogleScholarID  # optional
  twitter: twitterhandle  # optional
  orcid: 0000-0000-0000-0000  # optional
  github: githubusername  # optional
  description: 'Brief biography and research interests.


  Can span multiple paragraphs using blank lines between them.'
```

## Requirements

1. **Photo**: 365×365 pixels, 72 DPI, JPEG format (compressed)
2. **Location**: `/static/img/members/lastname.jpg`
3. **Required fields**: name, image, position
4. **Optional fields**: email, scholar, twitter, orcid, github, description

## Tips

- Use single quotes for multi-line descriptions
- Keep file size to max 100KB (optimization script helps with this)
- Use consistent naming: lastname.jpg

