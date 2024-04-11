
print("\033c") # cls

println(displaysize(stdout))

lines=displaysize(stdout)[1]
columes=displaysize(stdout)[2]

function ytest()
y=4712
for i in 1:5#lines
  println("... ",i," - ",lines => columes)
  y=i
end
println(y)
end
ytest()
#println(y)


for i in 1:columes
  print('0'+i%10)
end

using Crayons
i=4711
println("\033[2;2H")
println(crayon"red","Test!" )
println(i => i)
println(Crayon(reset=true))

