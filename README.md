Stand 25. März 2024

Oftmals vergisst man im Laufe der Zeit wie man bestimmte Probleme in der Vergangenheit gelöst hat oder welche Schritte notwendig waren um etwas richtig zu installieren und zu konfigurieren. Insbesondere bei selten oder lange nicht benutzten Werkzeugen kann es nützlich sein eine Sammlung grundsätzlicher Informationen zur Hand zu haben.

Dieses Repo ***(WIP - Work In Progress)*** ist öffendlich damit ***ich*** jederzeit von überall auf meine Spickzettel, rudimentären Configs und Listen zugreifen kann. Natürlich kann und darf ***jeder*** darin stöbern und für sich nützliches verwenden ***(ohne Garantie)***. 

- [Worum es geht (INIT)](#worum-es-geht-init)
  - [CONFIGS (Resouce-Dateien, Init-Dateien)](#configs-resouce-dateien-init-dateien)
  - [NOTES (Kurzanleitungen, Checklisten, Essays, usw.)](#notes-kurzanleitungen-checklisten-essays-usw)
  - [TEMPLATES (Programmbeispiele, etc.)](#templates-programmbeispiele-etc)
- [Übersicht](#Übersicht)
  - [Werkzeuge](#werkzeuge)
  - [CLI Tools](#cli-tools)
  - [Selbstdefinierte Funktionen](#selbstdefinierte-funktionen)
  - [Vim/NeoVim Plugins](#vimneovim-plugins)
  - [Python](#python)
  - [Julia Module (add)](#julia-module-add)
  - [Julia Terminal I/O (in Arbeit)](#julia-terminal-io-in-arbeit)
  - [Nützliches für Apple (MacOS und iOS)](#nützliches-für-apple-macos-und-ios)
  - [Nützliches für Android](#nützliches-für-android)
  - [Visual Studio Code (Plugins)](#visual-studio-code-plugins)
  - [Jupyter Lab (Plugins)](#jupyter-lab-plugins)
  - [Standart Movement/Keys (Mac)](#standart-movementkeys-mac)
- [Merke](#merke)
- [Rechtliches](#rechtliches)


# Worum es geht (INIT)

***Mein 'Werkzeugkasten' für ein Shell zentriertes Arbeiten - überwiegend via SSH - mit Vim, (Vim-)Filemanager, Python und Julia:***

* ZSH, Vifm, FTP, SSH usw. (Shell) 
* Vim/NeoVim (Editor)
* Julia (Repl, ReplMaker, Debug, etc.) 
* IPython/PyPy (Codon, Numba/Cython etc.)
* Github (git/gh/~~hub~~)
* Tmux (mobil) / iTerm2 (local)
* Docker/Lima 

Im Einzelfall auch VSC und Jupyter Lab (Desktop) lokal verwenden!

> “I don’t think there is one size that fits all” — Steve Ballmer

## CONFIGS (Resouce-Dateien, Init-Dateien)

- zsh
- vim
- vifm
- tmux
- ipython
- julia

## NOTES (Kurzanleitungen, Checklisten, Essays, usw.)

- codon.md
- ftp.md
- git-spicker.md
- julia.md
- lima.md
- python-module.md
- python.md
- regex.md
- tmux.md
- vifm-spicker.md
- Essay - Replit mit Julia (2024) 

<!--- (3x'-' für PANDOC) 
- offen: Mobil First, Cloud Nativ, Provider Indepent (Essay)
- offen: Toolbox/Toolbelt (Essay)
- offen: Fuhrpark (Blog)
-->

## TEMPLATES (Programmbeispiele, etc.)

- Python
- Julia
- Jupyter

# Übersicht

## Werkzeuge

  - vifm (VIM orientierter Filemanager)
  - vim/nvim (Editor)
  - ipython (Interaktives Python - Jupyter)
  - julia (Programmiersprache)
  - tmux (Terminal Multiplexer)
  - lima (Docker VM für MacOS)
     
## CLI Tools

  - `locate` ...
  - `!!` und `!$` - Letztes CMD bzw. letzte Parameter 
  - `ALT+.`  - letztes Wort der letzten Eingabe (https://github.com/fliptheweb/bash-shortcuts-cheat-sheet)
  - `grep` - Zeichenketten in File(s) finden 
  - `sed`- Stream Editor (mächtig) 
  - `awk`- ...
  - `printf` - besseres ECHO
  - `jobs`- Liste aktueller Jobs
  - `tig` - GIT Tool (mit brew => the git guru)
  - `time` - time cmd (Zeitmessung)
  - `cal 1984` - cli Kalender
  - `fuck` oder `f` oder `fu` - 'thefuck' gegen Tipfehler
  - `j` autojump - Directory Hilfe (zoxide nicht benutzt!)
  - `jq` - Listet Json (falls mal json)
  - `direnv` ...
  - `nohup` ...
  - `rar` - winrar inkl. zip
  - `cd -` - cd zum letzten benutzten Ordner (nicht `cd ..`)
  - `mutt` - E-Mail (configuration mit web.de geht ok)
  - `ac` - Statistik (wie lange Verbunden)
  - `who` - Wer ist angemeldet
  - `which` oder `where[is]` - Programm suchen
  - `scp` - Secure Copy via Netzwerk
  - `rsync` - Remote Sync u.a. Backups
  - `ps` - für juliaup
  - `ripgrep` - besseres `grep` z.B. `rg -tmd vim`
  - `exa` - besseres `ls`
  - `bat` - besseres `cat`
  - `fd` - File Find
  - `tldr` - kompaktes `man`
  - `dust` - besseres `du` (Disk Info)
  - `hyperfine` ...
  - `eza` - ersetzt `exa`
  - `mdless` - less für Markdown
  - `vifm` (glow/walk/nnn/ranger) - Filemanager (x,xg,xh,xxx)
  - `cheat` - Quick Referenzen
  - `fzf` - Fuzzy File Find
  - `p7zip` - zipper
  - `wget` - Files aus dem Internet laden
  - `mc` - Midnight Commander (Norton-Clone)
  - `speedtest` - Internet Speed
  - `tree` - Baum
  - `atuin` - Control-R Erweiterung (History)
  - `fig` - neu: CodeWhisperer `cw`
  - `vivid` ...
  - `antibody` - Plugin Manager für ZSH
  - `mosh` - Mobil Secure Shell (Protokoll/Treiber)
  - `brew`- Packet Manager MacOS
  - `fast-theme` - Farbschemata Shell 
  - `conda` - Python Virtuel Environment (Anaconda)
  - `juliaup` - Julia Versionsverwaltung
  - `cmatrix` - Gimmeck
  - `ctag` - Extrahiert TAGs (primär für C & Vim)
  - `git` - Klassik GIT 
  - `gh` - Git Tool 
  - `hub` - Git Tool (nicht mehr benutzen sondern gh)
  - `frogmouth` (glow, mdv, mdless, grip) - Markdown Viewer

## Selbstdefinierte Funktionen

- *load* (vifm) - Gitverzeichnis mit GitHub abgleichen (laden)
- *update* (vifm) - GitHub mit Gitverzeichnis abgleichen (speichern)
- *saveconfig* (vifm) - Konfigurationsdateien und User Homeverzeichnis nach iCloud sichern
- *save* (shell) - wie saveconfig

## Vim/NeoVim Plugins

- Shougo/deoplete.nvim' (deaktiviert)
- zchee/deoplete-jedi (deaktiviert - Doppelung!)
- python-mode/python-mode (deaktiviert)
- **junegunn/vim-plug** (Manager)
- kshenoy/vim-signature ... (kann weg)
- Pjiangmiao/auto-pairs (kann entfallen)
- **preservim/nerdtree** - Sex, Tex, Vex oder NEU: vifm
- Yggdroot/indentLine - Vertikale Tabs: <M-i> (?)
- **itchyny/lightline.vim** - Statuszeile
- benmills/vimux ...
- sbdchd/neoformat ...
- jistr/vim-nerdtree-tabs (deaktiviert NEU: vifm)
- blueyed/vim-diminactive - Fenster dimmen (deaktiviert MD)
- **frazrepo/vim-rainbow** - rainbow Indent/Klammern
- **tpope/vim-commentary** - Block-Kommentar
- NLKNguyen/papercolor-theme - Theme (unbenutzt)
- kyoz/purify - ... { 'rtp': 'vim' } (?)
- **JuliaEditorSupport/julia-vim** - FÜR JULIA OK
- airblade/vim-gitgutter ... (deaktiviert)
- dylanaraps/fff.vim - Filemanager (kann entfallen)
- lifepillar/vim-mucomplete ... (deaktiviert)
- nvim-lua/plenary.nvim ... (deaktiviert)
- nvim-lua/popup.nvim ... (deaktiviert)
- ThePrimeagen/harpoon - Suchen (deaktiviert)
- godlygeek/tabular ...
- **ixru/nvim-markdown** - Markdown (auch als Viewer)
- preservim/vim-markdown - Markdown (deaktiviert)
- vimwiki/vimwiki - Wiki (deaktiviert)
- **vifm/vifm.vim** - MEIN bester Filemanager
- sheerun/vim-polyglot - u.a. Python (deaktiviert)
- greghor/vim-pyShell (deaktiviert - Zu Kompliziert)
- kassio/neoterm (deaktiviert - Terminal oder <C-z> benutzen) 

## Python

  - pylint - Linter
  - mypy - Typeinfo prüfen
  - pandoc - Formate wandeln
  - black - Formatierer
  - flake8 - Style Prüfen
  - isort - Imports sortieren
  - speedtest-cli - Internet Speedtest
  - pypy3 - JIT Python Compiler
  - ipython - Interaktives Python
  - numba - Compiler Erweiterung
  - cython - Compiter Erweiterung
  - rich - Ausgaberoutinen und mehr
  - ipdb - Debugger für IPython
  - ipwidgets - Erweiterung Jupyter (alt)
  - matplotlib - Plotter
  - pandas - Lib für Datenanalyse
  - numpy - Mathe, Arrays -> Schnell
  - tqdm - Fortschrittsanzeige
  - friendly - (NICHT mehr verwenden)
  - watermark - Python/Maschine Info (wm)
  - jedi - Erweiterung ua Vim
  - pygments - Lib für Farben und Formate
  - pynvim - Für NVim
  - colorama - Farben
  - icecream - Zum Debuggen (ersetzt Print)
  - pyfzf- fzf für Python
  - PySnooper - neues tool (trace)
  - ipyparallel - Jupyter Erweiterung (alt)
  - IPythonBell - Jupyter Erweiterung (alt)
  - julia - Interface zu Julia (Pythonmodul)
  - jupytext - Notebook Format Konverter
  - pyinputplus - Inputroutinen
  - textual - Input/Rich `python -m textual`

## Julia Module (add)

  - Revise - Autoreload *.jl
  - BenchmarkTools - Benchmarks und Timing
  - OhMyREPL - REPL aufgebohrt
  - OffsetArrays - Arrays 0...n oder anderen Index
  - Crayons - Für Farben
  - IJulia - Für Jupyter Notebooks / Lab
  - Debugger - Fehlersuche
  - Infiltrator - Fehlersuche
  - ReplMaker - Eigene REPL definieren
  - PyCall - Schnittstelle zu Python
  - Distributions - MultiCore Unterstützung
  - Metal - M1 GPUs rechnen lassen
  - PyPlot - Plot-Utilities (falls nötig)

## Julia Terminal I/O (in Arbeit)

- TerminalUI.jl (Julia PackageMirrors) Framework
- ***TerminalExtensions.jl*** (JuliaPackageMirrors) iTerm2
- TermWin.jl (JuliaPackageMirrors) Tree-Daten (u.a. Debug)
- TERMIOS.JI (kdheepak) Posix Interface
- TerminalGraphics.jl (m-j-w) - JPG etc.
- ***Terming.jl*** (foldfelis) Interface TTY
- Terminals.jl(Keno) Interface TTY (Komplex)
- EchoREPL.jl (antimon2) - REPL Demo
- ***Term.jl*** (FedeClaudi) - Wie RICH plus Input
- NCurses.jl (Keno) - NCurses Interface

## Nützliches für Apple (MacOS und iOS)

- One Markdown - Bester Markdown Editor (Mac)
- iTerm2 - Bestes Terminalprogramm (Mac)
- Blink - Terminalprogramm mit MOSH (ios)
- Termius - Terminal Emulator (ios)
- UpNote - Notizen (alle Platformen)
- GNU_Core_Utilities  - `brew install coreutils` (wikipedia)
- usw.

## Nützliches für Android

- Userland - Linux
- Termius - Terminal Emulator
- UpNote - Notizen (alle Platformen)
- Microsoft Swift Keys (ohne Swift)
- usw.

## Visual Studio Code (Plugins)

- *Spell Right* - Rechtschreibung
- *Todo Tree* - Hilfreich
- Visual Studio Code Dash (nur ctrl+alt+h & quitt mit cmd-q)
- Explorer Bookmark - als Merkliste für Dateien
- Deutsches Sprachpaket für VS Code
- *Indent-Rainbow*
- *Vim emulation*
- PDF Viewer - statt vscode-pdf (corentinartaud/vscode-pdfpreview)
- Zip Explorer
- Open iTerm2
- *Pylance* - alles für Python
- *Python* (IntelliSense)
- *Julia* - alles für Julia
- *Jupyter* (Keymap, Notebook Renderers, Slide Show, Cell Tags)
- Build++ wegen cppbuild is missing … vielleicht nur Relict!
- *Auto-Open Markdown Preview*
- *Markdown Preview Enhanced*
- Docker for Visual Studio Code Dev Containers
- Remote - SSH
- Remote Explorer (SSH FS)
- GitHub Codespaces
- Git Graph extension 
- Git History, Search and More
- Git History Diff
- GitHub Pull Requests and Issues (GIT)
- *Material Icon Theme* (vscode-icons-mac bad Icons)

## Jupyter Lab (Plugins)

- *imcovangent/jupyterlab_run_and_reload*
- ryantam626/jupyterlab_code_formatter
- krassowski/jupyterlab-lsp (LanguageServer)
- deshaw/jupyterlab-execute-time
- nbdiff (weiss nicht woher)
- jupyterlab/jupyterlab-git


## Standart Movement/Keys (Mac)

- Cursor, BS, FN-BS, Enter (Normal)
- CMD Cursor -> BOF/EOF, POS1/END (je App)
- Option Cursor -> next/last-Word, PageUp/PageDN (?)
- FN Cursor -> PageUp/PageDown, BOF/EOF
- Control Cursor next/last-Desktop, Exposé/App-Fenster 

|Funktion|Tasten| 
|---|---|
F1 bis F12 | FN F1-F12
Spezial [ ]| Option 5 und 6
Spezial { }| Option 8 und 9
Spezial ~  | Option n
Spezial µ  | Option m
Spezial \| | Option 7
Spezial \ | Shift Option 7
@ | Option l (L)
€ | Option e

# Merke

> Retirement is: “Not having the need to work for money. Plus, the freedom to start and stop doing anything with no consequences.”


# Rechtliches

*Der Herausgeber übernimmt keinerlei Gewähr für die Aktualität, Korrektheit, Vollständigkeit oder Qualität der bereitgestellten Informationen. Der Herausgeber behält es sich ausdrücklich vor, Teile der Seiten oder das gesamte Angebot ohne gesonderte Ankündigung zu verändern, zu ergänzen, zu löschen oder die Veröffentlichung zeitweise oder endgültig einzustellen. Haftungsansprüche gegen den Inhaber, die sich auf Schäden materieller oder ideeller Art beziehen, welche durch die Nutzung oder Nichtnutzung der dargebotenen Informationen bzw. durch die Nutzung fehlerhafter und unvollständiger Informationen verursacht wurden sind ausgeschlossen.*

*Die Links und Informationen werden nur zum Informationsaustausch bereitgestellt und begründen keine geschäftlichen oder beruflichen Beziehungen irgendwelcher Art, sondern dienen rein informativen Zwecken.*




