Stand 20. April 2024 




***Julia programmieren mit REPLIT***

Dieses Replit/Repo ***(WIP - Work In Progress)*** ist öffendlich, auch auf Github, damit ***ich*** jederzeit von überall auf meine
Experimente und kleine Arbeiten mit ***Julia*** zugreifen kann. Spickzettel, Demos, PDFs und andere Notizen (siehe auch Notes - Essay Replit) gehören dazu. Es gibt einige kleine Überschneidungen mit meinen anderen Repos die hier aber keine Rolle spielen *(Aktualität kann leider variieren)*.

Natürlich kann und darf ***jeder*** darin stöbern und für sich nützliches verwenden ***(ohne Garantie)***. 

- [Worum es mir geht](#worum-es-mir-geht)
  - [CONFIGS (Resouce-Dateien, Init-Dateien)](#configs-resouce-dateien-init-dateien)
  - [NOTES (Kopie, ungefiltert)](#notes-kopie-ungefiltert)
  - [PDFs (Kopie, ungefiltert)](#pdfs-kopie-ungefiltert)
  - [Demos (mit Menuesystem)](#demos-mit-menuesystem)
  - [TEMPLATES (zum Nachsehen)](#templates-zum-nachsehen)
- [Übersicht](#Übersicht)
  - [Werkzeuge](#werkzeuge)
  - [Nützliche CLI Tools](#nützliche-cli-tools)
  - [Vim/NeoVim Plugins (offen)](#vimneovim-plugins-offen)
  - [Julia Module (add)](#julia-module-add)
  - [Julia Terminal I/O (in Arbeit)](#julia-terminal-io-in-arbeit)
  - [Nützliches für Apple (MacOS und iOS)](#nützliches-für-apple-macos-und-ios)
  - [Nützliches für Android](#nützliches-für-android)
  - [Movement/Keys (Angepaßt)](#movementkeys-angepaßt)
- [Merke](#merke)
- [Rechtliches](#rechtliches)


# Worum es mir geht

***Mein 'Werkzeugkasten' für Julia mit REPLIT wurde reduziert und angpasst für ein Shell zentriertes Arbeiten - überwiegend via iPhone/Android/Browser - mit Vim, (Vim-)Filemanager und einigen Tools***

* Vifm, FTP 
* Vim/NeoVim (Editor)
* Julia (Repl, ReplMaker, Debug, etc.) 


## CONFIGS (Resouce-Dateien, Init-Dateien)

- z (`source z` ersetzt bashrc in der Shell)
- vim (minimum)
- vifm (angepasst)
- julia (main.jl)


## NOTES (Kopie, ungefiltert)

- ftp.md
- git-spicker.md
- julia.md
- regex.md
- tmux.md
- vifm-spicker.md
- ***Essay - Replit mit Julia (2024)***


## PDFs (Kopie, ungefiltert)

- Handbücher zu Julia


## Demos (mit Menuesystem)

- Alles was ich so mal ausprobiert habe


## TEMPLATES (zum Nachsehen)

- Julia Beispiele aus dem Netz


# Übersicht

## Werkzeuge

- vifm (VIM orientierter Filemanager)
- vim/nvim (Editor)
- julia (Programmiersprache)


## Nützliche CLI Tools 

- `rsync` - Remote Sync u.a. Backups
- `ripgrep` - besseres `grep` z.B. `rg -tmd vim`
- `exa` - besseres `ls`
- `bat` - besseres `cat`
- `fd` - File Find
- `tldr` - kompaktes `man`
- `dust` - besseres `du` (Disk Info)
- `cheat` - Quick Referenzen
- `fzf` - Fuzzy File Find
- `wget` - Files aus dem Internet laden
- `vifm` (glow/walk/nnn/ranger) - Filemanager (x,xg,xh,xxx)
- `lftp`- FTP Programm 
- `glow`- markdown reader


## Vim/NeoVim Plugins (offen)

- junegunn/vim-plug (Manager)
- **frazrepo/vim-rainbow** - rainbow Indent/Klammern
- **tpope/vim-commentary** - Block-Kommentar
- JuliaEditorSupport/julia-vim - FÜR JULIA OK
- **vifm/vifm.vim** - MEIN bester Filemanager


- ## Julia Module (add)

- Revise - Autoreload *.jl
- BenchmarkTools - Benchmarks und Timing
- OhMyREPL - REPL aufgebohrt
- OffsetArrays - Arrays 0...n oder anderen Index
- CarouselArrays v0.1.0 - zum Vergleich
- Crayons - Für Farben
- Debugger - Fehlersuche
- Infiltrator - Fehlersuche
- ReplMaker - Eigene REPL definieren
- PyCall - Schnittstelle zu Python
- Distributions - MultiCore Unterstützung
- Primes - Für ein Beispiel

## Julia Terminal I/O (in Arbeit)


- TermWin.jl (JuliaPackageMirrors) Tree-Daten (u.a. Debug)
- TERMIOS.JI (kdheepak) Posix Interface
- ***Terming.jl*** (foldfelis) Interface TTY
- Terminals.jl(Keno) Interface TTY (Komplex)
- EchoREPL.jl (antimon2) - REPL Demo
- ***Term.jl*** (FedeClaudi) - Wie RICH plus Input
- NCurses.jl (Keno) - NCurses Interface

## Nützliches für Apple (MacOS und iOS)

- Blink - Terminalprogramm mit MOSH (ios)
- Termius - Terminal Emulator (ios)
- UpNote - Notizen (alle Platformen)
- usw.

## Nützliches für Android

- Userland - Linux
- Termius - Terminal Emulator
- UpNote - Notizen (alle Platformen)
- usw.

## Movement/Keys (Angepaßt)

<!--- (3x'-' für PANDOC)

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

-->

# Merke

> Retirement is: “Not having the need to work for money. Plus, the freedom to start and stop doing anything with no consequences.” - Unbekannt

> “I don’t think there is one size that fits all” — Steve Ballmer

# Rechtliches

*Der Herausgeber übernimmt keinerlei Gewähr für die Aktualität, Korrektheit, Vollständigkeit oder Qualität der bereitgestellten Informationen. Der Herausgeber behält es sich ausdrücklich vor, Teile der Seiten oder das gesamte Angebot ohne gesonderte Ankündigung zu verändern, zu ergänzen, zu löschen oder die Veröffentlichung zeitweise oder endgültig einzustellen. Haftungsansprüche gegen den Inhaber, die sich auf Schäden materieller oder ideeller Art beziehen, welche durch die Nutzung oder Nichtnutzung der dargebotenen Informationen bzw. durch die Nutzung fehlerhafter und unvollständiger Informationen verursacht wurden sind ausgeschlossen.*

*Die Links und Informationen werden nur zum Informationsaustausch bereitgestellt und begründen keine geschäftlichen oder beruflichen Beziehungen irgendwelcher Art, sondern dienen rein informativen Zwecken.*




