#!/bin/bash

rm -rf bin
mkdir bin

npm ci --silent

npm run compile

# Bundle the application for distribution
./node_modules/.bin/ncc build ./dist/index.js -o ./bin/bundle
cp ./config.yml.example ./bin/config.yml

echo "--> BGPalerter bundled in bin/bundle/ (use 'node bin/bundle/index.js' to run)"

echo "--> BGPalerter compiled in bin/ (ignore the warnings about files that cannot be resolved)."

rm -rf dist
