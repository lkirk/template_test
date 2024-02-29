# Manuscript

This is a simple template for the accompanying manuscript for an analysis
project. For a more complete version, see [this
example](https://github.com/RagsdaleLab/utilities/tree/main/document_templates/latex_article/).

To continuously compile this project, run:

```
./compile-loop main.tex
```

This will continuously compile the manuscript until you press `Ctrl-C`. All of
the tex intermediates will be stored in `out`, so if you want to start fresh,
you can `rm out` to clean everything up.

TODO: script to build standalone without looping.
