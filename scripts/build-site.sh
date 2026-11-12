#!/usr/bin/env bash
# Assemble the GitHub Pages site. PDFs are compiled by the workflow and are
# not stored in git. Preview PNGs are copied from assets/previews.
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
SITE="$ROOT/_site"

rm -rf "$SITE"
mkdir -p "$SITE/pdf" "$SITE/previews"
cp -a "$ROOT/site/." "$SITE/"
rm -rf "$SITE/previews"
mkdir -p "$SITE/previews"
cp "$ROOT/assets/previews/"*.png "$SITE/previews/"
cp "$ROOT/llms.txt" "$SITE/llms.txt"

cp "$ROOT/templates/paper/main.pdf" "$SITE/pdf/paper.pdf"
cp "$ROOT/templates/cv/main.pdf" "$SITE/pdf/cv.pdf"
cp "$ROOT/templates/slides/main.pdf" "$SITE/pdf/slides.pdf"
cp "$ROOT/templates/thesis/bnuthesis-example.pdf" "$SITE/pdf/thesis.pdf"
cp "$ROOT/templates/thesis/spine.pdf" "$SITE/pdf/thesis-spine.pdf"

test -s "$SITE/index.html"
test -s "$SITE/llms.txt"
test -s "$SITE/previews/cv.png"
test -s "$SITE/previews/paper-cover.png"
test -s "$SITE/previews/thesis-cover.png"
test -s "$SITE/previews/slides-title.png"
test -s "$SITE/pdf/paper.pdf"
test -s "$SITE/pdf/cv.pdf"
test -s "$SITE/pdf/slides.pdf"
test -s "$SITE/pdf/thesis.pdf"
test -s "$SITE/pdf/thesis-spine.pdf"
