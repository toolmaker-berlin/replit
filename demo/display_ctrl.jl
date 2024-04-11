print("\033c") # cls

println(displaysize(stdout))

lines=displaysize(stdout)[1]
columes=displaysize(stdout)[2]

for i in 1:lines
  println("... ",i)
end

for i in 1:columes
  print('0'+i%10)
end

using Crayons
println("\033[2;2H")
println(crayon"red","Test!" )
println(Crayon(reset=true))

