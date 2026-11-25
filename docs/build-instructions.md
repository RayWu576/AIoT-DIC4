# Build instructions

Build each version from its own directory. Both use the IEEEtran conference class and IEEEtran BibTeX style. Standard TeX Live packages include amsmath, booktabs, array, TikZ and url.

```sh
cd paper/v1-initial
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

For V2, run the same command from `paper/v2-revised`. The submission PDFs were built separately using Tectonic 0.17.0 with BibTeX and the standard IEEEtran class.

```sh
tectonic --keep-logs main.tex
openspec validate --all --strict
```

Run the Tectonic command from a version directory and the OpenSpec command from the repository root. Use scratch directories for rebuilding released artifacts. The tagged V1 PDF, ZIP and source tree are the preservation reference.
