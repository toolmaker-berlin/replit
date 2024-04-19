Stand 13. März 2024

# Grundlagen VIFM

```
ZZ Zz ZQ Zq   Ende
SPACE         Toggle Pane
              Mit Tab/S-Tab & Spc
C-o c-i.      Pane history vor/zu

s             shell
,c            Edit config
              ("""""",EOF)
za            Dotfiles Toggle
c-l ^L        Redraw
c-c <esc>     Reset ua
              selected/marks
(n)f Buchst.  goto (nxt/back ;,)
{()}          Blättern ...

e             explore file (q) (v vim)
E             edit via vim
i             forces open (1st)
o             open (Menue)
<enter>       open current
              file(s)
C-g           Fileinfo

Hh HH         cd ~  (selbst def.)
Hc HC         his c (selbst def.)
Hd HD         his d (selbst def.)

C-o           Go back history
ga (gA)       dir size (force)

(n)dd         Delete
p             Einsetzen (Sift-P)
P             move (y/yy) (p)
(n)yy s-C     Copy
3y oder y3j/k yank

s-A s-i cW cw Rename
c-a c-x       inc/Deck Filename
:empty        Trash
v av gs gv    (CR/ESC) visual
t             Tag file

cl            chg. Link
cp            chg. Atrb.

u             undo
C-r           redo (undo undo)
.             Repeat (:cmd)

m Buchstabe   Mark setzen
' Buchstabe   gehe zu Mark (#)
m 0           gehe zu home
m d           gehe zu dev/doc
' '           Toggle letztes
              Verzeichnis (##)
:marks        Edit/Goto (dd ...)
:delm!        Reset marks
:delm Buchst. Clr mark

:chmod ...
:(v)split
:view :only.  (TAB S-TAB <Baum!>)
w (q/:on)     MACRO View one Pane
c-w s v o     Split VSplit Only
c-w x z =     tauschen
c-w w         next pane (or spc)
? exit 1/2:1/2 (+-)
```

# Vergleichen

```
:help (dann ? und q bzw. :q usw.)
:DIFF (selected all Pane)
:compare (2 Pane, back mit <- ?)
Bei compare 2x Pane kann man fast alles machen e E d ...
```

# Register

```
"a oder "A (mit append)
ZB "Xd3j... "Xp
```

# Selectors

```
a all S reverse selected
s selected
ds da d3j dS...
```

# MD-Mode

```
:!bat C-X c/d Paste File/Dir <cr>
C-x C-x       dito inaktiv pane 
:inv s        Invert Selected
:d3           3 Files
:3d           3. File
:set nu nonu  rnu nornu
:2,3d         Bereich
:c-g oder q:  cmd Editor (Liste)
```

# Configuration

```
set runexec
set norunexec
```

# Filetype & Definitionen

```
jl    ua julia -iq %f
py    ua pypy3 -m IPython -i %f

:new text.txt (selbstdefiniert)
w (q/:on)     MACRO View one Pane
              Mit Tab/S-Tab & Spc
```

# Colorscheme

```
dwmlight (BESTES)
papercolor-light ok
molokai (monokai viewer)
monocrome
gruvbox OK
```

# View Mode (Best 2 Panes) vs 'e'

```
Spc f b ... e  E ... z/w g/G
/ und ? n N    Suchen
:view (q)
:only
w (q/:on)      MACRO View one Pane
               Mit Tab/S-Tab & Spc

Viewconfig
:qmap :qnoremap :qunmap
```

# Cmd's

```
:apropos grep man pages ...
:auto command ...
:bmark(s) (tags) ... & :bmgo tag
:delbmarks ...
:cd (home)
:c(hange) ... (Dialog)
:com ... USER defined commands
:compare ...
:display ... (Register)
:dirs ... <cr>
:filter ... genial inkl. :invert
:finde ... (besser verstehen)
:grep ... (besser verstehen)
:his d c s f b fi(alter) <cr>
:ls (multiplexer)
:lstrash
:move ...
:mkdir ...
:nohlsearch :noh[lsearch] clr sel
:only
:plugins
:put/pushd/popd/ ...
:pwd
:exit :q :qa :qa! ...
:redraw :reset :restart ...
:regedit ...
:rename
:restore (trash)
:link und :alink
:screen! (config) :ls mit tmux
:select ...
:session
:set(g/l) (all) ...
:sh(ell)
:sort ...
:stop :source
:(v)split
:substitute ...
:sync ... (pane)
:tabnew ... :tabclose :tabonly
:trash :tr :Touch ...
:tree!
:undolist ...
:let :unlet
:unselect
:version
:view
:w(qa!) :w(rite)
:x
:yank ..
:cm :dm :vm ...
:stop (c-z) geht wie?
```

# The ranges (set nu)

```
2,3 - from second to third
%   - the entire directory
.   - the current position
$   - the end of the filelist
't  - the mark position t

Examples:
:%delete   alle files im dir
:2,4delete Position 2 bis 4
:.,$delete Position bis ende
```

# Spezial (Extras)

```
:com lsl !!ls -l %a definiert lsl
:irgendwas & (Background)
:jobs
```

# Pattern (glob/mine/regex)

```
[!]{comma-separated-name-globs}
[!]{{comma-separated-path-globs}}
[!]/name-regular-expression/
[iI][!]//path-regular-exp.//
[iI][!]<comma-separated-mime-type-globs>

undecorated-pattern
fileviewer *.zip,*.jar zip -sf %c
```

# set option (setlocal, setglobal)
```
... offen
```

# Mapings

```
... offen
```


# Expressions/Funktions

```
... offen
```

# VIFM mit Vim

```
:term ++close vifm --select %:p
oder
Plug 'vifm/vifm.vim' für :vifm
Achtung buffer: ls b+num bd etc.
https://github.com/vifm/vifm.vim
```

# Achtung

```
*.py, *.pyexe, *.jl, *.jlexe und *.md
haben spezial Menüs 
bzw. 
spezielle RUN und Edit Funktionen.
```

# Offen (80/20 erfüllt, ~config)

- CLI Tools chk.
- Und ggf. nnn skripte chk
- Dann PDF HTML und ~~Md viewer (vim)~~
- REST HowTo (zip/7zip, tmux, ftp)
- fd find & autojunp integrieren!

Beispiel:
```
filetype *.html,*.htm
\ {View in lynx}
\ lynx funktioniert via brew
```


