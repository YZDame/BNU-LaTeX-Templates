#!/usr/bin/env python3
"""Build the release zip files after the templates have been compiled."""

import shutil
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DIST = ROOT / "dist"
STAGE = DIST / "stage"

SKIP_SUFFIXES = {
    ".aux", ".bbl", ".blg", ".bcf", ".log", ".out", ".toc", ".lof", ".lot",
    ".loa", ".fls", ".xdv", ".nav", ".snm", ".vrb", ".hd", ".idx", ".ilg",
    ".ind", ".nlo", ".nls", ".ptc", ".thm",
}
SKIP_NAMES = {
    "dtx-style.sty",
    ".DS_Store",
    "missfont.log",
    "mfput.log",
}


def skip(path: Path) -> bool:
    name = path.name
    if name in SKIP_NAMES:
        return True
    if name.endswith("-eps-converted-to.pdf"):
        return True
    if name.endswith(".synctex") or name.endswith(".synctex.gz"):
        return True
    if name.endswith(".run.xml") or name.endswith(".markdown.lua") or name.endswith(".markdown.err"):
        return True
    if path.suffix in SKIP_SUFFIXES:
        return True
    if name.startswith("_markdown_"):
        return True
    return False


def copy_tree(src: Path, dest: Path) -> None:
    for path in src.rglob("*"):
        rel = path.relative_to(src)
        if any(skip(part) if part.is_file() else False for part in [path]):
            continue
        if path.is_dir():
            continue
        if any(skip(parent) for parent in path.relative_to(src).parents):
            continue
        if skip(path):
            continue
        target = dest / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(path, target)


def require(path: Path) -> None:
    if not path.is_file() or path.stat().st_size == 0:
        raise SystemExit(f"missing compiled file: {path}")


def zip_dir(folder: Path, archive: Path) -> None:
    with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for path in sorted(folder.rglob("*")):
            if path.is_file():
                zf.write(path, path.relative_to(folder.parent))


def main() -> None:
    pdfs = [
        ROOT / "templates/paper/main.pdf",
        ROOT / "templates/cv/main.pdf",
        ROOT / "templates/slides/main.pdf",
        ROOT / "templates/thesis/bnuthesis-example.pdf",
        ROOT / "templates/thesis/spine.pdf",
    ]
    for pdf in pdfs:
        require(pdf)

    if STAGE.exists():
        shutil.rmtree(STAGE)
    DIST.mkdir(parents=True, exist_ok=True)

    copy_tree(ROOT / "templates/paper", STAGE / "bnu-paper")
    copy_tree(ROOT / "templates/cv", STAGE / "bnu-cv")
    copy_tree(ROOT / "templates/slides", STAGE / "bnu-slides")
    copy_tree(ROOT / "templates/thesis", STAGE / "bnu-thesis")

    lppl = ROOT / "LICENSE"
    logo_license = ROOT / "assets/bnu-logo/LICENSE"
    for name in ("bnu-paper", "bnu-cv", "bnu-slides"):
        shutil.copy2(lppl, STAGE / name / "LICENSE")
        shutil.copy2(logo_license, STAGE / name / "LOGO-GPL-3.0.txt")

    bundle = STAGE / "bnu-latex-templates"
    bundle.mkdir(parents=True)
    for name in ("README.md", "LICENSE", "AGENTS.md", "llms.txt", "Makefile"):
        shutil.copy2(ROOT / name, bundle / name)
    copy_tree(ROOT / "assets", bundle / "assets")
    copy_tree(ROOT / "templates", bundle / "templates")

    zip_dir(STAGE / "bnu-paper", DIST / "bnu-paper.zip")
    zip_dir(STAGE / "bnu-cv", DIST / "bnu-cv.zip")
    zip_dir(STAGE / "bnu-slides", DIST / "bnu-slides.zip")
    zip_dir(STAGE / "bnu-thesis", DIST / "bnu-thesis.zip")
    zip_dir(bundle, DIST / "bnu-latex-templates.zip")

    shutil.rmtree(STAGE)
    for archive in sorted(DIST.glob("*.zip")):
        print(f"{archive.name} {archive.stat().st_size}")


if __name__ == "__main__":
    main()
