function input(prompt::AbstractString="")::String
    print(prompt)
    return chomp(readline())
end


s="Harald π Slibar 4711"
println("\033c  Suche in: ",s)

x=input("Suchstring: ")
if x==""
  x="π"
end

y=(match(r""*x,s))

if y != nothing
  println(y.match)
  println(y.offset)
println(y.match.offset)
else
  println("nicht gefunden")
end
