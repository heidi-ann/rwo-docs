#!/bin/bash

opam remote add ocamllabs git@github.com:ocamllabs/opam-repo-dev.git
opam switch 4.01.0+bin-doc
eval `opam config env`
opam install bin-doc 
opam install -b async bin_prot core core_extended fieldslib sexplib textutils variantslib
