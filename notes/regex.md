Stand 28. April 2024 

In Julia stehen dir die Funktionen des `Regex`-Moduls zur Verfügung, um reguläre Ausdrücke anzuwenden. Hier sind einige grundlegende Funktionen:

1. **`match(r, s)`**: Sucht nach dem ersten Vorkommen des regulären Ausdrucks `r` in der Zeichenkette `s`.

    ```julia
    match(r"pattern", "input string")    
    ```

2. **`occursin(r, s)`**: Überprüft, ob der reguläre Ausdruck `r` in der Zeichenkette `s` vorkommt.

   ```julia
   cursin(r"pattern", "input string")
   ```
   
3. **```eachmatch(r, s)```**: Gibt eine Schleife über alle Vorkommen des regulären Ausdrucks `r` in der Zeichenkette `s` zurück.

   ```julia    
   for match in eachmatch(r"pattern", "input string")        
   # Verarbeite jedes Vorkommen    
   end    
   ```
   
4. **```replace(r, s, repl)```**: Ersetzt alle Vorkommen des regulären Ausdrucks `r` in der Zeichenkette `s` durch den Ersatztext `repl`.    

   ```julia    
   replace(r"pattern", "input string", "replacement")    
   ```
   
5. **```split(r, s)```**: Teilt die Zeichenkette `s` anhand des regulären Ausdrucks `r`.
        
   ```julia    
   split(r"pattern", "input string")    
   ```

Diese Funktionen bieten eine solide Grundlage für die Anwendung von regulären Ausdrücken in Julia. Beachte, dass Julia PCRE (Perl Compatible Regular Expressions) verwendet.
        
```julia
findall(r"[0-9]+","aaaa1aaaa22aaaa333")
SubString.(s, findall(r"[0-9]+",s))
# findfirst gibt es auch

# So then with a list comprehension you could do this e.g.

[x.offset for x in eachmatch(r"[0-9]","aaaa1aaaa2aaaa3")]

# or 
thismap(x->getfield(x,:offset), eachmatch(r"[0-9]","aaaa1aaaa2aaaa3"))

# or even this...
getfield.(collect(eachmatch(r"[0-9]","aaaa1aaaa2aaaa3")), [:offset])

# All returning:
typeof(Regex("a"))
```
Nachschlagen bei:

https://danielfett.de/2006/03/20/regulaere-ausdruecke-tutorial/

https://www.wpfox.de/coding/einfuehrung-in-regular-expressions/

https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck

https://www.massiveart.com/blog/regex-zeichenfolgen-die-das-entwickler-leben-erleichtern

https://ahkde.github.io/docs/v1/misc/RegEx-QuickRef.htm

https://regexlearn.com/de/learn

Testen interaktiv

https://regexr.com/

https://regex-generator.olafneumann.org

https://regex101.com/




-——




Ein Regulärer Ausdruck (engl. regular expression, Abk. RegExp oder Regex) ist eine Zeichenkette, die der Beschreibung von Mengen beziehungsweise Untermengen von Zeichenketten mit Hilfe bestimmter syntaktischer Regeln dient. Reguläre Ausdrücke finden vor allem in der Softwareentwicklung Verwendung; für fast alle Programmiersprachen existieren Implementierungen.

Reguläre Ausdrücke stellen erstens eine Art Filterkriterium für Texte dar, indem der jeweilige reguläre Ausdruck in Form eines Musters mit dem Text abgeglichen wird. So ist es beispielsweise möglich, alle Wörter, die mit S beginnen und mit D enden, zu suchen, ohne die zwischenliegenden Buchstaben explizit vorgeben zu müssen.

Ein weiteres Beispiel für den Einsatz als Filter ist die Möglichkeit, komplizierte Textersetzungen durchzuführen, indem man die zu suchenden Zeichenketten durch reguläre Ausdrücke beschreibt.

Zweitens lassen sich aus regulären Ausdrücken, als eine Art Schablone, auch Mengen von Wörtern erzeugen, ohne jedes Wort einzeln angeben zu müssen. So lässt sich beispielsweise ein Ausdruck angeben, der alle denkbaren Zeichenkombinationen (Wörter) erzeugt, die mit S beginnen und mit D enden. [vgl. de.wikipedia.org]

Für die Erstellung von regulären Ausdrücken gelten die folgenden Regeln.
 
Besondere Zeichen
z	Ein beliebiges Zeichen z
\\	Der Gegenschräger (Backslash)
\0nnn	Zeichen mit oktaldezimalem Wert 0nnn
\xnnn	Zeichen mit hexadezimalem Wert 0nnn
\t	Tabulator
\n	Zeilenumbruch (Newline)
\r	Wagenrücklauf (Carriage Return)
\f	Zeichenvorschub (Form Feed)
\a	Piepton (Beep)
\e	Escape
\cz	Kontrollzeichen korrespondierend zu z
 
Vordefinierte Zeichenklassen
.	Jedes Zeichen (Einstellbar ob auch Umbrüche enthalten sind)
\d	Beliebiges Ziffernzeichen; identisch mit [0-9]
\D	Alle Zeichen außer Ziffern; identisch mit [^0-9]
\s	Leerraumzeichen (White Space); identisch mit [ \t\n\x0B\f\r]
\S	Alle Zeichen außer Leerraum; identisch mit [^\s]
\w	Jedes alphanummerisches Zeichen; identisch mit [a-zA-Z_0-9]
\W	Alle Zeichen außer Jedes alphanummerische; identisch mit [^\w]
 
Eigene Zeichenklassen
[abc]	a, b oder c, (Einfache Klasse)
[^abc]	Alles außer a, b oder c (Negierung)
[a-z]	a bis z oder A bis Z (einfacher Zeichenbereich)
[a-m[n-p]]	a bis m oder n bis p; identisch mit [a-dm-p] (Vereinigung)
[a-z&&[egf]]	e, g oder f (Untermenge)
[a-z&&[^bc]]	a bis z, ohne b und ohne c (Zeichenbereich mit Auschluss)
 
Grenzbezüge
^	Start einer Zeile oder Beginn des Textes
$	Zeilenende oder Ende des Textes
\b	Wortgrenze
\B	Alles außer eine Wortgrenze
\A	Beginn des Textes
\G	The end of the previous match
\Z	Ende des Textes oder des Textabschlusses
\z	Ende des Textes
 
Quantitäten
X?	X genau einmal oder überhaupt nicht
X*	X 0 Mal bis viele
X+	X 1 Mal bis viele
X{n}	X genau n Mal
X{n,}	X mindestens n Mal bis viele
X{n,m}	X n bis m Mal
 
Quantitäten (nicht gefräßig, so wenig wie möglich)
X*?	X 0 Mal bis so wenig wie möglich
X+?	X 1 mal bis so wenig wie möglich
X{n,}?	X mindestens n Mal bis so wenig wie möglich
X{n,m}?	X mindestens n Mal bis höchsten m Mal
 
Quantitäten (gefräßig, so viel wie möglich)
X*+	X 0 Mal bis so viel wie möglich
X++	X 1 Mal bis so viel wie möglich
X{n,}+	X mindestens n Mal bis so viel wie möglich
X{n,m}+	X mindestens n und maximal m Mal
 
Aneinanderreihung und Gruppierung
XY	X gefolgt von Y
X|Y	Entweder X oder Y
(X)	X als Gruppe mit späterer Bezugsmöglichkeit $n
(?:X)	X als Gruppe ohne späterer Bezugsmöglichkeit
© 2017 Andreas Göbel	Impressum - Datenschutz/Cookies