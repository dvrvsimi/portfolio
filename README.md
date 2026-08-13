# Olorundara Akojede — engineering research portfolio

This is a framework-free static research portfolio. The landing page presents
Olorundara's research profile, current work, technical case studies,
experience and contact links. The two technical reports elsewhere in the
workspace remain the case-study content sources; generated project pages and
PDFs are placed in this directory.

## Build

```sh
sh scripts/build.sh
```

## Preview locally

```sh
python3 -m http.server 8000 --directory .
```

Then open `http://localhost:8000`.

## Structure

- `index.html`: portfolio landing page
- `styles.css`: the complete black-and-white visual system
- `projects/`: generated case-study pages and their local image assets
- `downloads/`: generated PDF case studies
- `templates/`: Pandoc page template
- `scripts/`: repeatable site and PDF build tools

No framework, package manager or JavaScript is required to serve the site.
Pandoc and WeasyPrint are used locally to regenerate its HTML and PDF files.
