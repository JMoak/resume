# Jordan Moak - Resume

[![Build Resume PDF](https://github.com/JMoak/resume/actions/workflows/build-pdf.yml/badge.svg)](https://github.com/JMoak/resume/actions/workflows/build-pdf.yml)

**Current Role:** Senior Software Engineer @ Care.com (Promoted 2024)

📄 **[Download Latest Resume PDF](https://github.com/JMoak/resume/actions/workflows/build-pdf.yml)**

> **How to download:** Click the latest successful workflow run → Scroll to "Artifacts" → Download `resume-pdf`
>
> **Or** grab the PDF from [Releases](../../releases) for tagged versions

---

## Local Build Instructions

### Prerequisites
- Windows with PowerShell (admin) or Linux with TeX Live
- MiKTeX or TeX Live distribution with XeLaTeX support

### Quick Start

**Windows:**
```powershell
winget install MiKTeX.MiKTeX
```

**VS Code:**
- Install the `LaTeX Workshop` extension
- Open `Software Engineer/Jordan-Moak-Resume.tex`
- Press `Ctrl+Alt+B` to build

**Manual:**
```bash
cd "Software Engineer"
xelatex -interaction=nonstopmode "Jordan-Moak-Resume.tex"
xelatex -interaction=nonstopmode "Jordan-Moak-Resume.tex"  # Run twice for references
```

---

## Project Structure

```
resume/
├── .github/workflows/build-pdf.yml    # CI/CD pipeline
├── Software Engineer/
│   ├── Jordan-Moak-Resume.tex         # Main resume source
│   ├── moak-resume.cls                # Custom LaTeX class
│   └── Fonts/                         # Embedded fonts (TeX Gyre Heros, Lato)
├── _archive/                          # Previous resume versions
└── README.md                          # This file
```

---

## Credits

Based on [TwentySecondsCurriculumVitae-LaTeX](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex) by Carmine Spagnuolo.

---

### VS Code LaTeX Workshop Settings

Add to `.vscode/settings.json` for optimal editing experience:

```json
{
  "latex-workshop.latex.recipes": [
    {
      "name": "xelatex",
      "tools": ["xelatex", "xelatex"]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "%DOC%"
      ]
    }
  ]
}
```
