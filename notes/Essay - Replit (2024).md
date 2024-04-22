Stand 22. April 2024

# Julia mit Replit (Essay) 

Replit ist, vereinfacht gesagt, ein Anbieter einer cloudbasierten Lösung für Programmierer, die kleine Projekte in verschiedenen Programmiersprachen entwickeln möchten, allerdings in erster Linie zu Lernzwecken. Das Replit noch weit aus mehr zu bieten hat ist nicht Thema dieses Essays.

Der Einstieg ist durch eine vorinstallierte IDE und hauseigene Benutzerführung zur Administration sehr leicht und zudem kostenlos. Das kostenlose Angebot kann durch ein Abonnement hinreichend erweitert werden.


## Zugang

- Zugriff über Browser (auch als Web-App)
- Verfügbar im Google Play Store für Android
- Verfügbar im Apple App Store für iPhone
- Verfügbar im Apple App Store für iPad
- Desktop-App für Windows
- Desktop-App für macOS (Intel & M1)


Das Verhalten von Replit variiert leicht je nach Zugriffsmethode. Eine Anmeldung ist in jedem Fall erforderlich. Die Desktop-Versionen können nach einer Anmeldung im Browser geladen werden (Sidebar unten) oder über diesen Link: https://replit.com/desktop. Die „Apps „ entsprechen weitestgehend den Browserversionen, allerdings mit mehr Bildschirmfläche. 

Replit konzentriert sich auf Programmiersprachen, die überwiegend interaktiv verwendet werden können. Der Firmenname 'REPLIT' leitet sich von der Arbeitsweise einer 'REPL' (Read-Eval-Print-Loop) ab.

Für mich ist es entscheidend, dass Julia (aktuell Version 1.7.2) unterstützt wird. Allerdings garantiert die Unterstützung von Julia noch nicht, dass ich meinen Anwendungsbereich abdecken kann. 

Ich benötigte anfangs zu Lernzwecken und später zum Entwickeln kleiner Funktionen eine Cloudlösung für Julia, da es auf iOS noch keine native Unterstützung für Julia gibt. Generell gibt es auf iOS-Basis für Entwickler im Vergleich zu Android kaum lokale Lösungen.

Seit meinem ersten Ausprobieren im Jahr 2022 hat sich Replit in vielerlei Hinsicht verändert. Es ist nicht ausgeschlossen, dass neuere Entwicklungen die von mir bevorzugten Verwendungsmöglichkeiten erschweren oder unmöglich machen könnten.


## Erfahrungen

- Browser und Desktop-Apps verhalten sich unauffällig.

- Bei allen mobilen Geräten gibt es Einschränkungen, hauptsächlich mit den Bildschirmtastaturen.

- Mobile Bluetooth-Tastaturen unterscheiden sich nur leicht voneinander, erweitern jedoch die Bedienbarkeit erheblich. Ein Ständer für das Gerät ist nützlich.

- Mit Android ist mobiles Arbeiten ohne BT-Tastatur tricky, da die Android App eine Voll-Tastatur mit Korrekturvorschlägen erzwingt, was zu ständigen Eingabefehlern führt. Abhilfe: Alternative Tastatur (ohne automatische Komfortfunktionen) installieren und diese für Replit benutzen. Hier hat sich Codeboard bewährt. Mit einer ansonsten für Terminals gut geeigneten Bildschirmtastatur, wie z.B. Microsoft Swift Keyboard, ist es unnötig schwierig Replit zu bedienen, auch weil Replit weitestgehend auf zusätzliche Cursor- und Control-Tasten in der App verzichtet.

- Mit iOS oder iPadOS wird das mobile Arbeiten unnötig erschwert, da Cursor- und Control-Tasten der App fehlen. Das oben erwähnte Microsoft Swift Keyboard ist bei weiten nicht so leistungsfähig wie unter Android. Letztlich wären "MyKeyboard" oder „xKeyboard“ zu empfehlen, da sie frei konfigurierbar sind und so bestens an die Bedürfnisse des Programmierers angepasst werden können, allerdings ohne Cursor- und Control-Tasten, wie bei Apples Bildschirmtastaturen leider üblich. Letztlich bevorzuge ich „Fleksy“ parallel zur iOS Tastatur mit ähnlicher Belegung und zusätzlicher Ziffernreihe. Eigene Tasten können auch definiert werden, machen das Arbeiten mit iOS aber nicht wirklich besser. 

- Erfreulicherweise kann man mit einigen Tricks eine SHELL so konfigurieren, dass die Julia REPL auch mit hinzugefügten Julia-Paketen, Vim und Vifm läuft. Mit Androiden läßt sich in der Shell so gut arbeiten. Bei Verwendung von iOS oder iPadOS gibt es keine Cursor- oder Control-Tasten. Einzig Ctrl-C, Ctrl-D, Ctrl-Z, ESC und Tab sind als Buttons vorhanden. Somit muss man Vim und Vifm geschickt anpassen, wenn man keine BT-Tastatur verwendet.

- In der Shell und besonders im Vim oder Nano stehen diverse Zeichen die mit ALT erreicht werden nicht zur Verfügung. Dies gilt für den Browser und die Desktop Apps. Unter Android und iOS funktioniert es mit `[]{}\|` da die Zeichen auf dem Bildschirmtastaturen vorhanden sind. 

- Subjektiv kommt es, zumindest in der kostenlosen Version, auf Androiden wesentlich häufiger zu unschönen Verzögerungen der Ein- und Ausgaben per Tastatur, als unter iOS. Auch das gänzlichen verschlucken von Tastenanschlägen tritt häufig mit Android auf.

- In alten Versionen der App war auf dem iPad nur die Landscape-Ansicht möglich, heute folgt die IDE zumindest der Ausrichtung.

- Die App für iPadOS ist noch nicht optimal, z.B. das Terminal wird von der Bildschirm-Tastatur etwas überdeckt. Safari passt sich nicht gut an die Onlineversion an, daher ist das auch keine Option. Auf einem iPad Mini ist zudem alles zu klein. iPads (selbst mit guter Tastatur) scheiden eigentlich zur Zeit aus. 

- Die Einstellung des Zeichensatzes (Größe) gilt global für alle Zugriffsversionen (siehe oben), was problematisch ist, wenn verschiedene Geräte abwechselnd verwendet werden.

- Der Editor für Julia bleibt im Vergleich zu Python hinter seinen Möglichkeiten zurück.

- Die KI im Editor ist eher störend und muss in den Einstellungen deaktiviert werden.

- Die macOS Intel-App läuft nicht auf älteren Systemen (z.B. MacOS High Sierra). Abhilfe: Zugang via Browser.

- Mac Pro 2013 MacOS Monterey 12.7.4 → Desktop App Intel läuft!

- Git funktioniert gut.

- Up- und Downloads in die IDE sind in Ordnung.

- Zusätzlich kann per 1-Click eine ZIP-Datei von allen Dateien runtergeladen werden (Backup).

- Noch eine kleine Einschränkung mit Android und iOS: die virtuelle Maschine stoppt sehr schnell, wenn man die App wechselt, z.B. wenn man im Browser recherchiert. Das ist lästig. Allerdings gibt es in Replit ein KI-Chatprogramm das man alternativ benutzen kann. In der Shell geht das reconnect viel schneller, aber man muss die Shell neu initiieren mit dem (selbst entwickelten) Konfigurations-Skript. 

- Die voreingestellte ‚main.jl‘ Datei per RUN-BUTTON lässt sich nicht immer fehlerfrei ohne aufhängen wiederholen, das ist ein Bug! In der Shell funktioniert es. 

- Mit Samsung Oberfläche wäre auch Multitasking (zwei Fenster) möglich  

- In der Freien Version sind alle Repl's die man erzeugt öffentlich einsehbar. Von GitHub kann man nur öffentliche Repos importieren. 

- In der Bezahlversion ist zudem ein SSH Zugang zu den Repl's möglich 


## Empfehlung 

* Umfangreiche Arbeiten am Desktop mittels App
* Mobiles Arbeiten bevorzugt unter iOS und primär in der Shell mit vifm/vim, im Einzelfall auch mit dem Editor
* Julia-Repl in der Shell ist Tricky. 


## Zusammenfassung

Insgesamt bietet Replit eine cloudbasierte Lösung für Programmierer, die vor allem für Lernzwecke konzipiert ist. Der Zugang erfolgt über verschiedene Plattformen wie Browser, Desktop-Apps und mobile Geräte, wobei es je nach Zugriffsmethode leichte Unterschiede im Verhalten gibt. Die Erfahrungen mit Replit variieren, wobei insbesondere die Nutzung auf mobilen Geräten mit Einschränkungen verbunden ist, jedoch durch externe Tastaturen verbessert werden kann. Die Unterstützung für verschiedene Programmiersprachen wie Julia ist gegeben, obwohl der Editor für Julia im Vergleich zu anderen Sprachen hinter seinen Möglichkeiten zurückbleibt. Trotz einiger Schwierigkeiten wie störender KI im Editor und Einschränkungen auf bestimmten Systemen bietet Replit Funktionen wie Git-Backups und ermöglicht die Konfiguration der SHELL für erweiterte Nutzungsmöglichkeiten.

Da iPhones auch in anderer Hinsicht bessere Software bieten und letztlich eine bessere Hardware haben (außer in Bezug auf Falt-Eigenschaften), bleibt von meinem "Mobil First..."-Experiment (vgl. weiteres Essay) nur übrig: Zurück zum iPhone, unterstützt vom Mac/Macbook. 

Warum? Replit ersetzt für mich überdimensionierte Möglichkeiten wie Userland, CoCalc oder einen eigenen Server (per SSH App) perfekt.

Darüber hinaus wird von mir in Zukunft verstärkt der 80/20-Ansatz zum Julia & Vim-Hobby verfolgt (vgl. weiteres Essay), was sich in der aktuellen Lern- und Probierphase hervorragend mit Replit erledigen lässt.

<!--
-->


## Tips zur Konfiguration 

Replit ist prinzipiell so aufgebaut, dass eine vorkonfigurierte virtuelle Maschine gestartet wird, deren persistenter Bereich ein Verzeichnis mit dem Namen des jeweiligen Projekts unterhalb des Homeverzeichnisses ist. Diese Struktur kann jedoch zu Problemen mit der Paketverwaltung von Julia und einigen Konfigurationsdateien wie z.B. vimrc führen. Auch die vorgegebenen Startdateien für die Bash können weitere Probleme verursachen. 

Dennoch gibt es Möglichkeiten, diese Herausforderungen zu bewältigen.

- Um Julia-Pakete effektiv zu verwalten, können sie im Homeverzeichnis unter ".julia" gespeichert werden. Dieses Verzeichnis kann einmalig in den persistenten Bereich kopiert werden, und nach einem Neustart des Projekts kann ein Symlink im Homeverzeichnis erstellt werden, um auf das persistente ".julia"-Verzeichnis zuzugreifen: `cp -r ~/.julia ~/Test-1/. oder cp -r /home/runner/.julia/ $(pwd)/` und `ln -s $(pwd)/.julia/ ~/.julia` 

- Das .vim Verzeichnis für Plugins muss ebenso behandelt werden. 

- Da die bash-Startdateien nicht veränderbar sind und das Homeverzeichnis bei jedem Neustart des Projekts überschrieben wird, ist es notwendig, bei jedem Start einer Shell manuell ein intelligentes Skript zu sourcen (". z"), das Aliase, Variablen, Links und Verzeichnisse erstellt und Dateien dorthin kopiert, wo sie erwartet werden.

- Utilities wie z.B. exa können persistenzfähig über "nix" nachinstalliert werden. Bat, Vifm und Vim sind erfreulicherweise schon vorhanden, benötigen aber noch Anpassungen in den Konfigurationsdateien. Dabei hilft das System: Ruft man ein dem System bekanntes Utility, wie exa, erstmalig ein fragt es ob es per "nix" installiert werden soll.

- Test ob ein Utility Paket vorhanden ist  (?) `nix-env -qaP | grep 'paketname'` und ggf. installieren z.B. mit `nix-env -iA nixpkgs.vifm` (?)

- Da der Pfad nicht geändert werden kann, müssen kleine Skripte oder selbstgeschriebene Anwendungen, in das einzige ungeschützte Verzeichnis ".local/bin" kopiert werden.

- Atuin läßt sich mit "nix" installieren, muss aber im Startskript initialisiert werden. Der Init-Code kann mit `atuin init bash > zatuin` erzeugt werden.

- NeoVim (nvim) kann installiert werden

- Damit Vim/Nvim in der Shell richtig funktionieren muss `set backspace=indent,eol,start` gesetzt werden (vimrc).

- Darüberhinaus müssen für den Zugang via Browser und Shell Keybindings `[]{}\|@` für die Bash und für Vim/Nano eingerichtet werden (siehe Skripte). Ich verwende die Umlaute. Auf US-Tastaturen besteht das Problem wahrscheinlich nicht. 


## Nützliche CLI Tools 

- `rsync` - Remote Sync u.a. Backups
- `ripgrep` - besseres `grep` z.B. `rg -tmd vim`
- `exa` - besseres `ls`
- `bat` - besseres `cat`
- `fd` - File Find
- `tldr` - kompaktes `man`
- `dust` - besseres `du` (Disk Info)
- `***** mdless` - less für Markdown - nicht mit nix
- `cheat` - Quick Referenzen
- `fzf` - Fuzzy File Find
- `***** p7zip` - zipper - nicht mit nix
- `wget` - Files aus dem Internet laden
- `vifm` (glow/walk/nnn/ranger) - Filemanager
- `***** frogmouth` (glow, mdv, mdless, grip) - Markdown Viewer nicht mit nix
- `lftp`- FTP Programm 
- `glow`- markdown reader


## Meine aktuellen Skripts

### Liste der Julia Pakete:

*   BenchmarkTools v1.5.0
*   Crayons v4.1.1
*   Debugger v0.7.8
*   Infiltrator v1.7.0 (Kein Precompile)
*   OffsetArrays v1.13.0
*   CarouselArrays v0.1.0
*   Distributions v0.25.107
*   OhMyREPL v0.5.24
*   PyCall v1.96.4
*   PyPlot v2.11.2 (Kein Plot)
*   ReplMaker v0.2.7
*   Revise v3.5.14
*   Term v2.0.5
*   Terming v0.2.6

### Shell und Julia Pakete einrichten (source z)

```bash
clear

if [[ -z "$WDIR" ]]; then
  export WDIR=$(pwd)
fi

# .vim Verzeichnis als Indikator
if [ ! -L ~/.vim ]; then

  # Links neu angelegen usw.
  ln -s $WDIR/.vim/ ~/.vim
  ln -s $WDIR/.vimrc ~/.vimrc
  ln -s $WDIR/.vifmrc ~/.vifmrc
  ln -s $WDIR/.julia/ ~/.julia
  cp -r $WDIR/.local/ /home/runner/
  mkdir /home/runner/.config/vifm
  cp $WDIR/.local/favicons.vifm /home/runner/.config/vifm

fi

alias c="clear"
alias x="vifm"
alias X="cd $WDIR && vifm $WDIR"
alias nvim="vim"
alias rst="source $WDIR/z"
alias cc="cd $WDIR"
alias ed="vim"
alias edn="vim $WDIR/.vimrc"
alias edz="vim $WDIR/z"
alias m="cd $WDIR/demo && julia $WDIR/demo/_mainmenue!.jl"
alias r="julia $WDIR/_work.jl"
alias e="vim $WDIR/_work.jl"
alias jj="julia -q"
alias JJ="julia -iq $WDIR/romio/romio-ok.jl"
alias Jj="julia -iq $WDIR/romio/romio-ok.jl"
alias jl="exa -1 --color=always --group-directories-first --sort name --no-user --git *jl"
alias lj="exa -1 --color=always --group-directories-first --sort name --no-user --git *jl"
alias ls="exa --color=always --group-directories-first --sort name --no-user --git --time-style iso"
alias l="exa -1l --color=always --group-directories-first --sort name --no-user --git --time-style iso --no-permissions"
alias ll="exa -a1l --color=always --group-directories-first --sort name --no-user --git --no-time " #--no-filesize"
alias la="exa -a1l --color=always --group-directories-first --sort name --no-user --git --no-permissions --time-style iso"
alias qq="exit"

export PS1='>>> \W$ '

export MYVIFMRC=~/.vifmrc

source $WDIR/.zatuin

bind '"\ö": "["'
bind '"\ä": "]"'
bind '"\Ö": "{"'
bind '"\Ä": "}"'
bind '"\ü": "\\"'
bind '"\Ü": "|"'
bind '"\ß": "@"'

```

### Vim minimal einrichten (.vimrc)

> Mehr Informationen: https://github.com/junegunn/vim-plug

```vim
call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()


set rnu
set nu
syntax on
set backspace=indent,eol,start

nnoremap Zz ZZ
nnoremap Zq ZQ

inoremap <c-a> <esc>0i
inoremap <c-e> <esc>A
inoremap <c-k> <esc>l<esc>d$<esc>A
inoremap <c-u> <esc>dd<esc>i<cr><esc>ki

inoremap ,, ,,
inoremap Zz <esc>ZZ
inoremap ZZ <esc>ZZ

inoremap Aa <esc>0i
inoremap Ee <esc>A
inoremap Kk <esc>l<esc>d$<esc>A
inoremap Uu <esc>dd<esc>i<cr><esc>ki

inoremap ö [
inoremap ä ]
inoremap Ö {
inoremap Ä }
inoremap ü \
inoremap Ü \|
inoremap ß @

nnoremap ö [
nnoremap ä ]
nnoremap Ö {
nnoremap Ä }
nnoremap ü \
nnoremap Ü \|
nnoremap ß @

vnoremap ö [
vnoremap ä ]
vnoremap Ö {
vnoremap Ä }
vnoremap ü \
vnoremap Ü \|
vnoremap ß @



" restore cursor position
augroup restore_pos | au!
    au BufWinEnter *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe 'normal! g`"zz'
        \ | endif
augroup end


function! ToggleZeroBehavior()
if col('.') ==# 1
    "call feedkeys("$")
    call cursor(line('.'), col('$'))
else
    call cursor(line('.'), 1)
endif
endfunction

nnoremap <silent> 0 <esc>:call ToggleZeroBehavior()<cr>

nnoremap <silent> ll <c-w>w

```


### Mein aktuelles "main.jl" (RUN-Button)

```Julia
# --------------------------
# REPLIT macht Fehler!
# (RUN/STOP/EDIT/RUN-ZYKLUS)
# besser nur SHELL benutzen!
#            ===============
#   + MAC ohne  @[]{}\| usw. 
#   + iPhone ohne Cursor ...
#   ========================
#
# Stand 19. April 2024
# --------------------------

try
  using Crayons
catch
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"
  run(`sh -c $script`;wait=true)
end

using OhMyREPL
cd("demo")
include("demo/_mainmenue!.jl")
println("\033c","Julia Repl Mode ...!")

# exit(0) # KEIN EXIT

```

### Meine 'vifm' Konfiguration (.vifmrc)

```vim
" Datei vifmrc (Version REPLIT)
" Ort: $WDIR/.vifmrc
" Config für VIFM (Angepasst fuer REPLIT ggf. auch iMac)
" Zweck: Einstellungen, Tastenbelegung, Commandos, etc.
"
" Stand 10. April 2024


" ------------------------------------------------------------------------------
" Main settings
" ------------------------------------------------------------------------------

set vicmd=vim
set syscalls
set trash


" What should be saved automatically on restarting vifm. Drop "savedirs"
" value if you don't want vifm to remember last visited directories for you.

set vifminfo=dhistory,savedirs,chistory,state,tui,shistory,
            \phistory,fhistory,dirstack,registers,bookmarks,bmarks

set history=100
set nofollowlinks
set sortnumbers
set undolevels=100
set vimhelp

" If you would like to run an executable file when you
" press Enter, l or Right Arrow, set this, or norunexec

set runexec

"""""" set timefmt='%Y/%m/%d %H:%M'
set timefmt='%d/%m/%Y %H:%M'

set wildmenu
set wildstyle=popup
set suggestoptions=normal,visual,view,otherpane,keys,marks,registers
set ignorecase
set smartcase
set nohlsearch
set incsearch
set scrolloff=4
set slowfs=curlftpfs
set nowrap

" Set custom status line look
"""""" set statusline=" Hint: %z%= %A %10u:%-7g %15s %20d "
set statusline=" %= %A %10u:%-7g %15s %20d "

" List of color schemes to try (picks the first one supported by the terminal)
colorscheme dvmlight Default Default-256 molokai papercolor-light

" ohne SET -> macht ONE-PANE-Mode (:on geht auch)
only

" Show dotfiles/dotdirs in the first place SCHADE geht nicht
"""""" set dotfiles
"""""" set sortgroups='(|\.).*'
"""""" set sort=+groups,+dir,+name

set dotdirs=rootparent

let $INSIDE_VIFM = 'true'


" ------------------------------------------------------------------------------
" Bookmarks
" ------------------------------------------------------------------------------

" :mark mark /full/directory/path [filename]

mark h ~/
mark h $WDIR/
mark H ~/


" ------------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------------

" :com[mand][!] command_name action
"
" These are some of the macros that can be used in the action part:
" %a for user arguments
" %c for current file under the cursor
" %C for current file under the cursor of inactive pane
" %f for selected file(s)
" %F for selected file(s) of inactive pane
" %b is the same as %f %F
" %d for current directory name
" %D for current directory name of inactive pane
" %r{x} for list of files in register {x}
" %m runs the command in a menu window
" %u uses command's output to build a file list
" see `:help vifm-macros` and `:help vifm-filename-modifiers` for more

" command! df df -h %m 2> /dev/null
" command! diff vim -d %f %F
" command! zip zip -r %c.zip %f
" command! run !! ./%f
" command! make !!make %a
" command! mkcd :mkdir %a | cd %a
" command! reload :write | restart full

" mit !! (cli) statt ! (GUI) wird eine PAUSE eingeblendet"

command new :!vim %a

" configs updaten ...
"
" command! saveconf :!!saveconfhelp.sh && rsync -auc /Users/user/Documents/devcloud /Volumes/LivedriveFS/devsave | echo "Bitte warten ..."

" command! md jupytext --to md %f
" command! py jupytext --to py %f
" command! jl jupytext --to jl %f

" command! update !!clear && git add * && git commit -am "Auto" && git push
" command! load !!clear && git pull


" ------------------------------------------------------------------------------
" File types association
" ------------------------------------------------------------------------------

" :filetype pattern1,pattern2 defaultprogram,program2
" :fileviewer pattern1,pattern2 consoleviewer
"
" The first entry is the default program to be used with a matching file.
" The other programs for the file type can be accessed via :file command.
" The command macros like %f, %F, %d, %D may be used in the commands.
" The %a macro is ignored. To use a % you must put %%.
" Spaces in an app name must be escaped, for example: QuickTime\ Player.app


" Extract zip files
filetype {*.zip},<application/zip,application/java-archive>
       \ mkdir %f:r && tar -vxf %f --directory %f:r
fileviewer {*.zip,*.jar,*.war,*.ear},
          \<application/zip,application/java-archive>
          \ tar -tf %f

" Extract tar archives
filetype {*.tar,*.tar.bz2,*.tbz2,*.tgz,*.tar.gz,*.tar.xz,*.txz,*.tar.zst,
         \*.tzst},
        \<application/x-tar>
       \ tar -vxf %f
fileviewer {*.tar,*.tar.bz2,*.tbz2,*.tgz,*.tar.gz,*.tar.xz,*.txz,*.tar.zst,
           \*.tzst},
          \<application/x-tar>
         \ tar -tf %f

" Extract .bz2 archives
filetype *.bz2 bzip2 -d %f

" Extract .gz files
filetype *.gz gunzip %f

" Extract rar files
filetype *.rar unrar x -y -c- -ad %f %s
fileviewer *.rar unrar lb %c

filetype *.zip,*.jar,*.war,*.ear
\ {View contents}
\ zip -sf %c | less,
\ {Extract here}
\ tar -xf %c,

fileviewer *.zip,*.jar,*.war,*.ear zip -sf %c, echo "No zip to preview:"


" Start-Varianten mit ! hinten am Namen "ohne warten" muessen zuerst definiert werden 
" -----------------------------------------------------------------------------------

filetype {*!.py},<.>,
       \ {RUN Python ohne Stop}
       \ clear && python %f 

filetype {*!.jl},<.>,
       \ {RUN Julia ohne Stop}
       \ clear && julia -q %f 

filetype {*.md},<.>,
       \ {MD mit vim read only }
       \ vim -M %c, 
       \ {MD mit Glow }
       \ glow -p -s light %c

" julia
filetype {*.jl},<.>,
       \ {RUN Julia}
       \ clear && julia -q %f && echo 'Press ENTER to continue ...'; read -r dummy,
       \ {RUN Julia interactiv}
       \ clear && julia -iq %f,
       \ {EDIT and RUN Julia interactiv}
       \ clear && vim %f && julia -iq %f,
       \ {START Julia (REPL only)}
       \ clear && julia -iq %f

" ipython/python (Replit/iMac24)
filetype {*.py},<.>,
       \ {RUN Python}
       \ clear && python %f && echo 'Press ENTER to continue ...'; read -r dummy

"        \ {RUN IPython (via PyPy3)}
"        \ clear && pypy3 -m IPython %f && echo 'Press ENTER to continue ...'; read -r dummy,
"        \ {RUN IPython (PyPy3) interactiv}
"        \ clear && pypy3 -m IPython -i %f,
"        \ {START IPython (PyPy3) REPL only}
"        \ clear && pypy3 -m IPython #

" filetype {*!.py},<.>,
"        \ {RUN IPython ohne Stop (via PyPy3)}
"        \ clear && pypy3 -m IPython %f # && echo 'Test (continue...)'; read -r dummy,


" ------------------------------------------------------------------------------
" Panel configuration examples
" ------------------------------------------------------------------------------

" Customize view columns a bit (enable ellipsis for truncated file names)
" set viewcolumns=-{name}..,6{}.

" Show vertical border
" set fillchars=vborder:│

" Filter-out build and temporary files
filter! {*.lo,*.o,*.d,*.class,*.pyc,*.pyo,.*~}
filter {*.nix, 9, z, *.lo,*.o,*.d,*.class,*.pyc,*.pyo,.*~}


" ------------------------------------------------------------------------------
" Various customization examples
" ------------------------------------------------------------------------------

" Use ag (the silver searcher) instead of grep
" set grepprg='ag --line-numbers %i %a %s'

" Add additional place to look for executables
" let $PATH = $HOME.'/bin/fuse:'.$PATH

" Block particular shortcut
" nnoremap <left> <nop>

" Activate screen/tmux support
" screen!


" ------------------------------------------------------------------------------
" Icon decorations example
" ------------------------------------------------------------------------------

" https://github.com/cirala/vifm_devicons
" source /Users/user/.config/vifm/favicons.vifm 
" source ~/.config/vifm/favicons.vifm 


" ------------------------------------------------------------------------------
" Sample keyboard mappings
" ------------------------------------------------------------------------------

" Start shell in current directory
" nnoremap s :shell <cr>

" Display sorting dialog
nnoremap S :sort<cr>

" Toggle visibility of preview window
nnoremap w :view<cr>
vnoremap w :view<cr>gv

" Yank current directory path into the clipboard
"""""" nnoremap yd :!printf %d | pbcopy<cr>
" Yank current file path into the clipboard (escape spaces)
"""""" nnoremap yf :!printf %f:p:gs? ?\\ ? | pbcopy<cr>

" Mappings for faster renaming (cw)
" without the file extension
nnoremap I cW<c-a>
nnoremap cc cW<c-u>
nnoremap A cW

" Open editor to edit vifmrc and apply settings after returning to vifm
nnoremap ,, :write | edit $MYVIFMRC | restart full<cr> """"""

" Toggle wrap setting on ,w key in PREVIEW
nnoremap ,w :set wrap!<cr>

" Example of standard two-panel file managers mappings (!!=Pause)
nnoremap <f3> :!!bat %f<cr> """"""
nnoremap <f4> :edit<cr>
nnoremap <f5> :copy<cr>
nnoremap <f6> :move<cr>
nnoremap <f7> :mkdir<space>
nnoremap <f8> :delete<cr>

nnoremap <silent> w : if &quickview && !layoutis('only')
                   \| view
                   \| else
                   \| if layoutis('only')
                   \| if &lines + 50 < &columns | vsplit | else | split | endif
                   \| endif
                   \| view!
                   \| execute 'qnoremap w q:view|only|qunmap w<lt>cr>'
                   \| execute 'wincmd w'
                   \| endif
                   \| <cr>


nnoremap qq ZZ
nnoremap Zz ZZ
nnoremap Zq ZQ "Quitt ohne save!

nnoremap E :edit<cr>

nnoremap o :file<cr>
nnoremap # '
nnoremap ## ''
nnoremap Hh :cd $WDIR<cr>
nnoremap HH :cd $WDIR<cr>
nnoremap Hd :his d<cr>
nnoremap HD :his d<cr>
nnoremap Hl :his c<cr>
nnoremap HL :his c<cr>
nnoremap Hc :com<cr>
nnoremap HC :com<cr>

" nnoremap ,ss :saveconf<cr>

```

## Schlusswort

Replit bietet eine vielseitige Plattform für Programmierer, insbesondere für Lernende und Experimentierende. Obwohl es einige Einschränkungen und Verbesserungsmöglichkeiten gibt, ermöglicht es dennoch einen einfachen Einstieg in die Programmierung und bietet eine gute Möglichkeit, Projekte zu verwalten und zu teilen. Durch kontinuierliche Verbesserungen und Anpassungen kann Replit seine Position als nützliches Werkzeug für Entwickler weiter ausbauen.


