#module TestModul
print("\033c") # cls
println("Das Problem mit Modulo ...")
println("Fehler  ",((23-24)%24)) # Mod ist in meinem Sinn ja falsch
println("Richtig ",mod(-1,24))   # So ist richtig(er)
println("Fehler  ",rem(-1,24))   # Falsch wie %

println("... BASE modifiziert:")
import Base.:rem
# !!!! 
rem(x::Int,y::Int)=mod(x,y) 
# (NUR) mit Int klappt es
println(((23-24)%24)) # Mod ist jetzt richtig
println(rem(-1,24))   # So ist es jetzt richtig?

println("... Aber nach Import?")
include("testmodul.jl") # Achte auf die Filenamens Konvention 
using Main.TestModul
println("\n",tt(-1))
println("... Modifikation bleibt (wenn erfolgt)!")



