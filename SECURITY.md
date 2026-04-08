# Security Policy

## Supported Versions

This website uses Jekyll and GitHub Pages. We recommend always using the latest versions:

| Component | Version | Supported |
| --------- | ------- | --------- |
| Jekyll | Latest | ✅ |
| Ruby | 3.x | ✅ |
| Ruby | 2.7.x | ✅ |
| Ruby | < 2.7 | ❌ |

## Security Best Practices

### Dependencies

- Always run `bundle update` regularly to get security patches
- Review GitHub Dependabot alerts when they appear
- Never commit `Gemfile.lock` with known vulnerabilities

### Content Security

- Never commit sensitive information (API keys, passwords, etc.)
- Review all external links before publishing
- Validate user-contributed content
- Optimize and scan images before uploading

### Access Control

- Limit write access to the repository
- Use branch protection rules for main/master branch
- Require pull request reviews for sensitive changes
- Enable 2FA for all contributors

## Reporting a Vulnerability

If you discover a security vulnerability in this website, please report it by:

1. **Email**: Contact the lab administrators directly (do not open a public issue)
2. **Expected Response**: Within 48 hours
3. **Updates**: We'll keep you informed of the progress

### What to Include

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if applicable)

## Security Measures

### Automated Checks

- GitHub Actions CI runs on all pull requests
- HTML validation and link checking
- YAML syntax validation
- Post format validation

### Manual Reviews

- All content changes reviewed before merging
- Regular audits of dependencies
- Periodic security assessments

## Known Limitations

### GitHub Pages

This site is hosted on GitHub Pages, which has certain security constraints:

- No server-side code execution
- Static content only
- HTTPS enforced automatically
- Limited control over server headers

### Third-Party Content

We include content from:
- Google Scholar (user profiles)
- Twitter (social media links)
- External publication PDFs

Users should be aware these are external resources not under our direct control.

## Updates

This security policy is reviewed and updated quarterly.

Last updated: February 2026

