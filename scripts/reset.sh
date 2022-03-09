#!/bin/bash

## Resets bigbang.yaml and .sops.yaml after an attempted deployment of big bang

cp -f dev/bigbang.yaml.save dev/bigbang.yaml
cp -f .sops.yaml.save .sops.yaml