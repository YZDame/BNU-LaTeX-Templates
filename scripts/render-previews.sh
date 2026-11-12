#!/usr/bin/env bash
# Render README/Pages preview PNGs from already compiled PDFs.
# Does not commit. CI does not run this script.
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
OUT="$ROOT/assets/previews"
mkdir -p "$OUT"

require() {
  if [[ ! -s "$1" ]]; then
    echo "missing PDF: $1" >&2
    echo "compile first: make all" >&2
    exit 1
  fi
}

render() {
  local pdf="$1"
  local page="$2"
  local dest="$3"
  local tmp
  tmp=$(mktemp -d)
  pdftoppm -png -f "$page" -l "$page" -scale-to-x 1200 -scale-to-y -1 "$pdf" "$tmp/page"
  local src
  src=$(find "$tmp" -name 'page-*.png' | head -n 1)
  if command -v pngquant >/dev/null 2>&1; then
    pngquant --force --skip-if-larger --quality 68-88 --output "$dest" -- "$src" || cp "$src" "$dest"
  else
    cp "$src" "$dest"
  fi
  if command -v optipng >/dev/null 2>&1; then
    optipng -o2 -quiet "$dest" || true
  fi
  rm -rf "$tmp"
}

require "$ROOT/templates/paper/main.pdf"
require "$ROOT/templates/cv/main.pdf"
require "$ROOT/templates/slides/main.pdf"
require "$ROOT/templates/thesis/bnuthesis-example.pdf"

render "$ROOT/templates/paper/main.pdf" 1 "$OUT/paper-cover.png"
render "$ROOT/templates/paper/main.pdf" "${PAPER_BODY_PAGE:-3}" "$OUT/paper-body.png"
render "$ROOT/templates/cv/main.pdf" 1 "$OUT/cv.png"
render "$ROOT/templates/slides/main.pdf" 1 "$OUT/slides-title.png"
render "$ROOT/templates/slides/main.pdf" "${SLIDES_BODY_PAGE:-6}" "$OUT/slides-content.png"
render "$ROOT/templates/thesis/bnuthesis-example.pdf" 1 "$OUT/thesis-cover.png"
render "$ROOT/templates/thesis/bnuthesis-example.pdf" "${THESIS_BODY_PAGE:-11}" "$OUT/thesis-body.png"

find "$OUT" -name '*.png' -printf '%p %s\n'
