# PDFium Fonts (SFD Fork)

This repository is a fork of the **[PDFium project fonts](https://pdfium.googlesource.com/pdfium/+/refs/heads/main/core/fonts/)**, 
maintained in **[SFD (Spline Font Database)](https://fontforge.org/docs/techref/sfdformat.html)** format.  

The goal is to make the fonts easier to inspect, modify, and convert using free and open-source tools 
like [FontForge](https://fontforge.org/).

---

## Motivation

The original PDFium fonts are distributed in binary dumps (e.g., `.cpp`), which makes version control 
and modifications cumbersome. By maintaining them in `.sfd`:

- **Human-readable** source files that play nicely with `git`  
- **Simple modification** in FontForge or compatible editors  
- **Reproducible builds** back to `.ttf` / `.otf` / `.woff` formats  
- **Ease of conversion** for integration into other projects  

## Repository Structure

```
source/<FontName>.sfd       # Editable source in SFD format
dist/<format>/              # Generated binaries
````

## Usage

### Editing

Open any `.sfd` in [FontForge](https://fontforge.org/).  

```bash
   fontforge <FontName>.sfd
````

Make modifications as needed (glyph edits, metrics, kerning, etc.).

### Conversion

To export back to `.ttf` or `.otf`, you can use FontForge in batch mode:

```bash
fontforge -lang=ff -c 'Open($1); Generate($2)' <FontName>.sfd <FontName>.ttf
```

## License

The fonts retain the **same license** as the upstream PDFium fonts.
See [LICENSE_FOXIT](./source/LICENSE_FOXIT) for details.
