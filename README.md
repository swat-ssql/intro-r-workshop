# Intro to R and RStudio

Materials for the SSQL workshop **Intro to R and RStudio** at Swarthmore College (Fall 2026), for students with little or no prior R experience.

**Just want the slides?** [Open the PDF](https://github.com/swat-ssql/intro-r-workshop/blob/main/slides/slides.pdf) directly on GitHub.

## Get started

1. Install the software listed below.
2. Click the green **Code** button on this page, choose **Download ZIP**, and unzip the folder somewhere sensible (not inside Downloads).
3. Double-click **`intro-r-workshop.Rproj`**. RStudio opens the folder as a project.
4. Open **`handout.qmd`** and work through it from top to bottom.

## Software

| Tool | Where to get it |
|:--|:--|
| R | [cran.r-project.org](https://cran.r-project.org) |
| RStudio Desktop | [posit.co/download/rstudio-desktop](https://posit.co/download/rstudio-desktop/) |
| tidyverse | run `install.packages("tidyverse")` in the RStudio Console |
| Quarto | Included with RStudio (version 2022.07.1 and later). Otherwise [quarto.org/docs/download](https://quarto.org/docs/download/) |

Quarto makes PDFs with Typst, which comes with Quarto, so there is no LaTeX to install. If a PDF will not render, change `format: typst` to `format: html` at the top of the file.

## What is in this folder

| Path | What it is |
|:--|:--|
| `handout.qmd` | The student handout. Some code chunks are blank on purpose |
| `handout_guide.qmd`, `handout_guide.pdf` | The same handout with the walkthrough chunks filled in |
| `handout_code.R` | The same code as the handout, as a plain R script (to compare a script with a Quarto file) |
| `handout.pdf` | A rendered copy of the blank handout |
| [`slides/slides.pdf`](https://github.com/swat-ssql/intro-r-workshop/blob/main/slides/slides.pdf) | The workshop slides as a PDF. View it right on GitHub, no download or unzipping needed |
| `slides/slides.html` | The workshop slides. Open in a browser; press **S** for speaker notes |
| `slides/slides.qmd`, `slides/custom.scss` | Slide source. Render with `quarto render slides/slides.qmd` |
| `data/` | The datasets used in the handout |
| `bib/handout.bib` | References cited in the handout |
| `pics/` | Figure used in the handout and the stop-and-frisk codebook |

## Data

- **Disaster aid** (`data/disasteraid.csv`, `data/disasteraid.tsv`): county-level disaster relief aid and incumbent-party vote share, 1988 to 2004, 15,561 county-years. The same data in two formats. The handout is an abridged version of the study by Healy and Malhotra (2009).
- **Stop-and-frisk** (`data/subset_saf.csv`): a subset of the New York City stop-and-frisk data from 2012 (19,392 rows, 9 variables). The variables are described in `pics/SQF_Codebook.pdf`. `data/saf_subset.txt` holds the same subset in a space-delimited format and is not used in the handout.

## References

- Healy, Andrew, and Neil Malhotra. 2009. "Myopic Voters and Natural Disaster Policy." *American Political Science Review* 103 (3): 387-406. <https://doi.org/10.1017/S0003055409990104>
- Gelman, Andrew, Jeffrey Fagan, and Alex Kiss. 2007. "An Analysis of the New York City Police Department's 'Stop-and-Frisk' Policy in the Context of Claims of Racial Bias." *Journal of the American Statistical Association* 102 (479): 813-823. <https://doi.org/10.1198/016214506000001040>
