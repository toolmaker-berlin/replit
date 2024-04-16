Stand 13. März 2024 (dürftig)

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

