#module TestModul

println("\nDas Problem mit Modulo ...")
println(((23-24)%24)) # Mod ist in meinem Sinn ja falsch
println(mod(-1,24))   # So ist richtig(er)
println(rem(-1,24))   # Falsch wie %

println("... modifiziert:")
import Base.:rem
# !!!! rem(x::Int,y::Int)=mod(x,y) 
# (NUR) mit Int klappt es
println(((23-24)%24)) # Mod ist jetzt richtig
println(rem(-1,24))   # So ist es jetzt richtig?

include("demo TestModul.jl") # Achte auf die Filenamens Konvention 
using Main.TestModul
println("\n",tt(-10))



