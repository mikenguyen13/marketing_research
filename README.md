# Marketing Research: A Technical and Academic Treatment

[![Build book](https://github.com/mikenguyen13/marketing_research/actions/workflows/build.yml/badge.svg)](https://github.com/mikenguyen13/marketing_research/actions/workflows/build.yml)
[![Publish to Posit Connect](https://github.com/mikenguyen13/marketing_research/actions/workflows/publish.yml/badge.svg)](https://github.com/mikenguyen13/marketing_research/actions/workflows/publish.yml)
[![Rendered with Quarto](https://img.shields.io/badge/rendered%20with-Quarto-blue?logo=quarto)](https://quarto.org)

A technical and academic treatment of marketing research: constructs, substantive domains, and the methods that connect them, with reproducible R code throughout.

**Read the book:** https://mike-marketing-research.share.connect.posit.cloud

## What's in the book

The book is organized around three pillars of marketing scholarship, plus a bridging section on unstructured data and a set of PhD-seminar-style integrative chapters:

- **Constructs** — construct vs. variable, satisfaction, and the relational, evaluative, brand-self, engagement, and frontier construct families
- **Substantive Domains** — strategy, branding, online environments, advertising, sales, CLV, celebrity endorsement, influencer marketing, nudges, pricing, service, health, gaming, marketing finance, privacy, innovation, market entry, virality
- **Methodology** — metrics, data, modeling, analytical and empirical models, and model building
- **Unstructured & Multimodal Data** — text, image, video, and other unstructured data as marketing measurement inputs
- **Integrative Seminars** — full-semester syllabus-style chapters that braid the three pillars together

See [`_quarto.yml`](_quarto.yml) for the complete chapter list.

## Building locally

The book is written in [Quarto](https://quarto.org) with R code chunks (via `knitr`).

Prerequisites:
- [Quarto CLI](https://quarto.org/docs/get-started/)
- R with `knitr`, `rmarkdown`, `downlit`, `xml2` (and any packages used by individual chapters)

```bash
quarto render          # renders HTML, PDF, and EPUB to _book/
quarto render --to html  # HTML only (uses committed _freeze/ caches, no R packages needed)
quarto preview          # live preview while editing
```

Most chapters ship a committed `_freeze/` execution cache, so an HTML-only render doesn't require the R packages a chapter uses — only chapters you actually edit re-execute.

## Contributing

Issues and corrections (typos, broken citations, dead links, errata) are welcome via [GitHub Issues](https://github.com/mikenguyen13/marketing_research/issues). For substantive edits, please open a pull request against a single chapter at a time.

## Citation

If you reference this work, please cite it as:

> Nguyen, M. *Marketing Research: A Technical and Academic Treatment*. https://github.com/mikenguyen13/marketing_research

## License

No license file is currently published for this repository — see [Issues](https://github.com/mikenguyen13/marketing_research/issues) or contact the author before reusing content beyond personal reference.
