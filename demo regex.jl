function input(prompt::AbstractString="")::String
    print(prompt)
    return chomp(readline())
end

x=input("Suchstring:")
# x=parse(Int,input("Zahlen:"))



y=(match(r""*x,"Harald Slibar 4711"))
println(y)
println(y.match.offset)
#println(y.match.match_offsets)
println(y)
# Laut ok einsetzen geht copy/paste
#
#=
#  Notes on Regular expressions in Julia:
#    Sources:
#              Regular Expressions Cookbook, Jan Goyvaerts & Steven Levithan.
#                        https://www.regular-expressions.info/wordboundaries.html
#                                  https://www.regular-expressions.info/lookaround.html
#                                            http://www.rexegg.com/regex-disambiguation.html
#                                                      Julialang Gitter Chat.
#                                                      =#
#
#
#                                                      #=
#                                                        Aside: Different capture modes 
#                                                        =#
#
#                                                        # Too Greedy! Avoid using "." when ever possible and (.*?) is pretty lethal
#                                                        match(r"First Name: (.*?), Last Name: (.*?)", "First Name: Jimmy, Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy, Last Name: ", 1="Jimmy", 2="")
#
#                                                        # Better ways to go ...
#                                                        match(r"First Name: (?P<first>\w+), Last Name: (?P<last>\w+)", "First Name: Jimmy, Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy, Last Name: Hendrix", first="Jimmy", last="Hendrix")
#
#                                                        match(r"First Name: (.*), Last Name: (.*)", "First Name: Jimmy, Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy, Last Name: Hendrix", 1="Jimmy", 2="Hendrix")
#
#                                                        match(r"First Name: (.*?), Last Name: (.*?)$", "First Name: Jimmy, Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy, Last Name: Hendrix", 1="Jimmy", 2="Hendrix")
#
#                                                        match(r"First Name: (\w*), Last Name: (\w*)", "First Name: Jimmy, Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy, Last Name: Hendrix", 1="Jimmy", 2="Hendrix”)
#
#                                                        match(r"First Name: (\w+), Last Name: (\w+)", "First Name: Jimmy, Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy, Last Name: Hendrix", 1="Jimmy", 2="Hendrix")
#
#                                                        match(r"First Name: (.+), Last Name: (.+)", "First Name: Jimmy J., Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy J., Last Name: Hendrix", 1="Jimmy J.", 2="Hendrix")
#
#                                                        match(r"First Name: ([A-z]+), Last Name: ([A-z]+)", "First Name: Jimmy, Last Name: Hendrix")
#                                                        # RegexMatch("First Name: Jimmy, Last Name: Hendrix", 1="Jimmy", 2="Hendrix")
#
#                                                        #\d  any character that matches \p{Nd} (decimal digit)
#                                                        #\s  any character that matches \p{Z} or \h or \v
#                                                        #\w  any character that matches \p{L} or \p{N}, plus underscore
#
#                                                        # Regex characters that must be escaped:
#                                                        # Source: Regular Expressions Cookbook, by Jan Goyvarets & Steven Levithan
#                                                        #   "\.", "\^", "\$", "\(", "\)", "\{", "\[", "\]", "\+", "\*", "\?", "\|" 
#
#                                                        # Only the opening curly brace needs to be escaped:
#                                                        match(r"\{USD(\d+)\.(\d+)}", "Put your money in the brakets {USD59.00}")
#                                                        # RegexMatch("(USD59.00)", 1="59", 2="00")
#
#
#                                                        #=
#                                                          Word boundaries, reference:
#                                                            https://www.regular-expressions.info/wordboundaries.html
#
#                                                              These boundaries are zero-length matches, meaning that they
#                                                                do not consume a character in the string but only assert
#                                                                  what match is possible.
#
#                                                                    "\b" matches word boundaries, "\B" matches non-word boundaries
#                                                                    =#
#
#                                                                    match(r"(\bis\b)", "This island is beautiful")
#                                                                    # RegexMatch("is", 1="is")
#                                                                    match(r"(\bis\b)", "This island is beautiful")[1]
#                                                                    # "is"
#
#                                                                    #=
#                                                                      POSIX start and end word boundaries: [[:<:]] matches start and [[:>:]] matches the end
#                                                                      =#
#                                                                      match(r"[[:<:]]largest[[:>:]]", "London is the largest city in the UK")
#                                                                      # RegexMatch("largest")
#
#                                                                      # The capture version
#                                                                      match(r"([[:<:]]largest[[:>:]])", "London is the largest city in the UK")
#                                                                      # RegexMatch("largest", 1="largest")
#
#
#                                                                      #=
#                                                                        Look ahead and look behind, also zero-length:
#                                                                          https://www.regular-expressions.info/lookaround.html
#
#                                                                            For more examples and details see:
#                                                                              http://www.rexegg.com/regex-disambiguation.html
#                                                                              =#
#
#                                                                              # Look ahead
#                                                                              # Match 'q' where 'q' follows 'u'
#                                                                              match(r"q(?=u)", "quit")
#                                                                              # RegexMatch("q")
#
#                                                                              # Match the capture version
#                                                                              match(r"(q)(?=u)", "quit")
#                                                                              # RegexMatch("q", 1="q")
#
#                                                                              # FAIL!:
#                                                                              match(r"q(?=u)i", "quit") == nothing
#                                                                              # true
#
#                                                                              # SUCCESS!
#                                                                              match(r"q(?=ui)", "quit") == nothing
#                                                                              # RegexMatch("q")
#
#                                                                              # Or wildcard (unnecessary)
#                                                                              match(r"q(?=u.)", "quit") == nothing
#
#
#                                                                              # It will match the 'q' at the end of 
#                                                                              # 'Iraq' because it is not followed by 'u'.
#                                                                              match(r"(q)(?!u)", "Iraq")
#                                                                              # RegexMatch("q", 1="q")
#
#                                                                              # Negative look ahead
#                                                                              # Match 'q' where 'q' is not followed by an 'a'
#                                                                              match(r"q(?!a)", "quack")
#                                                                              # RegexMatch("q")
#
#                                                                              # Match the capture version
#                                                                              match(r"(q)(?!a)", "quack")
#                                                                              # RegexMatch("q", 1="q")
#
#                                                                              # Positive and negative look behinds
#
#                                                                              # Negative look behind
#                                                                              # Matches 'b' that is not preceded by 'a'
#                                                                              match(r"(?<!a)b", "kreb")
#                                                                              # match(r"(?<!a)b", "stab")
#
#                                                                              match(r"(?<!a)b", "stab") == nothing
#                                                                              # true
#                                                                              # Capture
#                                                                              match(r"(?<!a)(b)", "kreb")
#                                                                              # RegexMatch("b", 1="b")
#
#                                                                              # Positive look behind
#                                                                              # Matches 'b' that is preceded by 'a'
#                                                                              match(r"(?<=a)b", "stab")
#                                                                              # RegexMatch("b")
#
#                                                                              # Capture
#                                                                              match(r"(?<=a)(b)", "stab")
#                                                                              # RegexMatch("b", 1="b")
#
#                                                                              match(r"(?<=a)b", "thingamabob")
#                                                                              # RegexMatch("b")
#
#                                                                              # Match a word not ending with an 's'
#                                                                              match(r"\b\w+(?<!s)\b", "hello fellas")
#                                                                              # RegexMatch("hello")
#
#                                                                              # Robust with apostrophes, not the same as
#                                                                              match(r"\b\w+(?<!s)\b", "hello's fellas")
#                                                                              # RegexMatch("hello")
#                                                                              match(r"\b\w*[^s]\b", "hello's fellas")
#                                                                              # RegexMatch("hello'")
#
#
#                                                                              # Block Escape
#                                                                              # An entire block can be escaped by using "\Q...\E"
#                                                                              #    as below. Note how in the actual string you still
#                                                                              #    have to escape the dollar.
#                                                                              match(r"\Q().[]^${\E", "Some Funky characters: ().[]^\${")
#
#
#                                                                              #=
#                                                                                Use (?i) to make match case insensitive
#                                                                                =#
#                                                                                match(r"(?i)uppercase", "This is not UPPERCASE")
#                                                                                # RegexMatch("UPPERCASE")
#
#                                                                                # Alternative capture forms
#                                                                                match(r"((?i)uppercase)", "This is not UPPERCASE")
#                                                                                # RegexMatch("UPPERCASE", 1="UPPERCASE")
#
#                                                                                match(r"(?i)(uppercase)", "This is not UPPERCASE")
#                                                                                # RegexMatch("UPPERCASE", 1="UPPERCASE")
#
#                                                                                # Mixing case sensitivity
#                                                                                match(r"sensitive(?i)caseless(?-i)sensitive", "sensitiveCASELESSsensitive")
#
#                                                                                # Mixing case sensitivity
#                                                                                match(r"sensitive(?i)caseless(?-i)sensitive", "SENSITIVEcaselessSENSITIVE") == nothing
#
#
#
#                                                                                # Match one of many characters
#                                                                                match(r"c[ae]l[ae]nd[ae]r", "calender")
#                                                                                # RegexMatch("calender")
#
#                                                                                # Negates character class if placed immediately 
#                                                                                #    after the opening bracket
#                                                                                match(r"s[^ae]t", "sat set sit")
#                                                                                # RegexMatch("sit")
#
#                                                                                #=
#                                                                                  Another example:
#                                                                                    Note the hypen creates a range between the characters, and the preceeding 
#                                                                                      caret negates all the matches to the character in that range
#                                                                                      =#
#                                                                                      match(r"[^a-z]1", "a1 01")
#                                                                                      # RegexMatch("01")
#
#                                                                                      #=
#                                                                                        Other examples of defining ranges with "-":
#                                                                                          a to F and digits upper and lower case [a-fA-F\d], equivalent using case insensitivity (?)[A-F0-9], 
#                                                                                            negation (?)[^A-F0-9], 
#                                                                                            =#
#
#
#                                                                                            # Captured example
#                                                                                            match(r"(s[^ae]t)", "sat set sit")
#                                                                                            # RegexMatch("sit", 1="sit")
#
#
#                                                                                            # Matching digits using "\d", "\d+" matches more than one digit:
#                                                                                            match(r"\d+", "Agent007")
#                                                                                            # RegexMatch("007")
#
#                                                                                            # Matching a character that is not a digit with "\D" and matching
#                                                                                            #  multiple non-digit characters "\D+"
#                                                                                            match(r"\D+", "Agent007")
#                                                                                            # RegexMatch("Agent")
#
#                                                                                            # [^\d] is equivalent to [\D]
#                                                                                            match(r"[^\d]", "A7")
#                                                                                            # RegexMatch("A")
#
#                                                                                            # Matching white space characters (spaces, tabs, and line breaks) "\s+"
#                                                                                            replace("This   is    an    odd    sentence!", r"\s+" => " ")
#                                                                                            # "This is an odd sentence!"
#
#                                                                                            # Matching non-whitespace characters "\S+"
#                                                                                            match(r"(\S+)", "     something     ")
#                                                                                            # RegexMatch("something", 1="something")
#
#                                                                                            # Matches for words "\w" which matches characters
#                                                                                            #   [a-zA-Z0-9_] and "\W" which negates the match
#
#                                                                                            # Retains the word
#                                                                                            match(r"\w+", "@\$%&*!keep|@#*£")
#                                                                                            # RegexMatch("keep")
#
#                                                                                            # Excludes the word
#                                                                                            match(r"\W+", "@\$%&*!keep|@#*£")
#                                                                                            # RegexMatch("@\$%&*!")
#
#                                                                                            # Match any character using "." (except line breaks "\n")
#                                                                                            match(r"s.t", "the cat sat on the mat")
#                                                                                            # RegexMatch("sat")
#
#                                                                                            # Dots do not match newline characters by default
#                                                                                            match(r".", "\n")
#                                                                                            # But matching new line character can be turned on 
#                                                                                            match(r"(?s).", "\n")
#
#                                                                                            # Simple date matcher. The dot in [] matches actual dots not any character
#                                                                                            # could also use "[/\.\-]"
#                                                                                            match(r"\d\d[/.\-]\d\d[/.\-]\d\d", "16-02-18")
#                                                                                            # RegexMatch("16-02-18")
#
#                                                                                            #=
#                                                                                              Match start and end of the string.
#                                                                                                Again, these are zero-length matches
#                                                                                                =#
#
#                                                                                                # Caret "^" match at start of the line
#                                                                                                match(r"^\w+", "This is a test")
#                                                                                                # RegexMatch("This")
#
#                                                                                                # "\A" match at start of the line
#                                                                                                match(r"\A\w+", "This is a test")
#                                                                                                # RegexMatch("This")
#
#                                                                                                # Dollar match at end of the line
#                                                                                                match(r"\w+$", "This is a test")
#                                                                                                # RegexMatch("test")
#
#                                                                                                # "\Z" or "\z" also match at end of the line
#                                                                                                match(r"\w+\Z", "This is a test")
#                                                                                                # RegexMatch("test")
#                                                                                                match(r"\w+\z", "This is a test")
#                                                                                                # RegexMatch("test")
#
#                                                                                                # This is interesting: ".+$" matches the last line
#                                                                                                match(r".+$", "This is a test\n that you will fail\n")
#                                                                                                # RegexMatch(" that you will fail")
#
#
#                                                                                                #=
#                                                                                                  Matching one of several alternatives using pipe "|" separation:
#                                                                                                  =#
#
#                                                                                                  match(r"\$\d+\.\d+|£\d+\.\d+", "\$55.60")
#                                                                                                  # RegexMatch("\$55.60")
#
#                                                                                                  # In this example we use \b to prevent "Jane" from matching "Janet"
#                                                                                                  match(r"\bJane\b|\bJanet\b|Mary", "The winner of the series is ... Janet")
#                                                                                                  # RegexMatch("Janet")
#
#
#
#                                                                                                  # Group and capture parts of the match
#
#                                                                                                  # Capture version
#                                                                                                  match(r"\b(Jane|Janet|Mary)\b", "The winner of the series is ... Janet")
#                                                                                                  # RegexMatch("Janet", 1="Janet")
#
#                                                                                                  match(r"\b(\d\d\d\d)-(\d\d)-(\d\d)", "The date today is 2018-02-16")
#                                                                                                  # RegexMatch("2018-02-16", 1="2018", 2="02", 3="16")
#
#
#                                                                                                  # Non-capturing groups "(?:regexp)"
#
#                                                                                                  # Very useful example ...
#                                                                                                  # Matching possibly missing entities:
#                                                                                                  # Matching digits this case "03h 41m 55s", but the catch is any of the terms 
#                                                                                                  #    could be missing for example the string could be "03h 4s" or "33m"
#
#                                                                                                  match(r"(?:(\d+)h)?\b\s?(?:(\d+)m)?\b\s?(?:(\d+)s)?", "03h 55m")
#                                                                                                  # RegexMatch("03h 55m", 1="03", 2="55", 3=nothing)
#
#                                                                                                  # Combine non capturing with case insensitivity and alternative matches
#                                                                                                  match(r"\b(?i:jane|janet|mary)\b", "The winner of the series is ... Janet")
#                                                                                                  # RegexMatch("Janet")
#
#
#                                                                                                  # Match the previously matched text again using "\1"
#                                                                                                  # In the case below the previously matched text is indicated
#                                                                                                  # by (\d\d)
#                                                                                                  match(r"\b\d\d(\d\d)-\1-\1\b", "2008-08-08")
#                                                                                                  # RegexMatch("2008-08-08", 1="08")
#
#
#                                                                                                  # Named captures:
#                                                                                                  match(r"\b(?<year>\d\d\d\d)-(?<month>\d\d)-(?<day>\d\d)\b", "2018-02-17")
#                                                                                                  # RegexMatch("2018-02-17", year="2018", month="02", day="17")
#
#                                                                                                  # Alternative 1
#                                                                                                  match(r"\b(?'year'\d\d\d\d)-(?'month'\d\d)-(?'day'\d\d)\b", "2018-02-17")
#                                                                                                  # RegexMatch("2018-02-17", year="2018", month="02", day="17")
#
#                                                                                                  # Alternative 2
#                                                                                                  match(r"\b(?P<year>\d\d\d\d)-(?P<month>\d\d)-(?P<day>\d\d)\b", "2018-02-17")
#                                                                                                  # RegexMatch("2018-02-17", year="2018", month="02", day="17")
#
#
#                                                                                                  # Named back references with "\k"
#                                                                                                  match(r"\b\d\d(?<myRef>\d\d)-\k<myRef>-\k<myRef>\b", "2007-07-07")
#                                                                                                  # RegexMatch("2007-07-07", myRef="07")
#
#                                                                                                  # Alternative 1
#                                                                                                  match(r"\b\d\d(?'myRef'\d\d)-\k'myRef'-\k'myRef'\b", "2007-07-07")
#                                                                                                  # RegexMatch("2007-07-07", myRef="07")
#
#                                                                                                  # Alternative 2
#                                                                                                  match(r"\b\d\d(?P<myRef>\d\d)-(?P=myRef)-(?P=myRef)\b", "2007-07-07")
#                                                                                                  # RegexMatch("2007-07-07", myRef="07")
#
#                                                                                                  # Greedy Repetitions
#
#                                                                                                  # Repeat part of a regex a certain number of times using "{}":
#                                                                                                  match(r"\d{3}\.\d{2}", "\$451.34")
#
#                                                                                                  # Repeat the part of a match between "n" and "m" times "{n,m}".
#                                                                                                  #   obviously {n,n}=={n}
#                                                                                                  match(r"a[r]{2,7}gh", "Sometimes I get get so angry, arrrrgh")
#                                                                                                  # RegexMatch("arrrrgh")
#
#                                                                                                  #=
#                                                                                                    Equivalencies in consecutive matches:
#
#                                                                                                      "\d{1,}" is for one or more consecutive matches of a digit equivalent to \d+
#                                                                                                        "\d{0,}" is for zero or more consecutive matches of a digit equivalent to \d*
#                                                                                                          "h{0,1}" is for zero or more matches of "h" equivalent to "h?"
#                                                                                                          =#
#
#
#                                                                                                          # Repeated group matches
#                                                                                                          match(r"(?:abc){3}", "abcabcabc")
#                                                                                                          # RegexMatch("abcabcabc")
#
#                                                                                                          # This means match any character "." zero or more times "*" and that matched text,
#                                                                                                          # should occur either zero or one time "?".
#                                                                                                          match(r"<p>.*?</p>", "<p>There are times when I consider myself lucky to be able to write code.</p><p>Some other times it is so frustrating.</p>")
#                                                                                                          # RegexMatch("<p>There are times when I consider myself lucky to be able to write code.</p>")
#
#                                                                                                          # This is the greedy version, there is no "?" modifer limiting the match:
#                                                                                                          match(r"<p>.*</p>", "<p>There are times when I consider myself lucky to be able to write code.</p><p>Some other times it is so frustrating.</p>")
#                                                                                                          # RegexMatch("<p>There are times when I consider myself lucky to be able to write code.</p><p>Some other times it is so frustrating.</p>")
#
#
#                                                                                                          # Adding comments tp a regex using (?#Comment)
#                                                                                                          match(r"(?#Year)\d{4}(?#Separator)-(?#Month)\d{2}-(?#Day)\d{2}", "2018-02-17")
#                                                                                                          # RegexMatch("2018-02-17")
#
#
#                                                                                            "}}")
#

