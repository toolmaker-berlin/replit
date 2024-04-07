function fib(n)
    x,y = (0,1)
    for i = 1:n x,y = (y, x+y) end
    x
end

print("\033c")

println("Input eine Zahl:")

user_input = "99" # readline()
number = parse(Int, user_input)
println("Du hast die Zahl eingegeben: $number")
@time fib(200)
println("fertig!")
# geht aber dann keine julia shell exit(0)
for i in 1:2 #  

  println(fib(50+i))
end

# print("\033c")

try
  using Crayons
  
catch
  script = "source " * pwd() * "/zjulia"
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"

  # ln -s $(pwd)/.julia/ ~/.julia
  run(`sh -c $script`;wait=true)
  # sleep(1)
end

using OhMyREPL
using Crayons
using BenchmarkTools

# ... Hier dann weiterer Code (oder Shell verwenden)
# ...
# ...
println("Fertig")
# exit(0)

