"""
Wie geht das mit den DOC-Strings?
"""
function vtest()
    vv=[1:2,4:5,10:13,10:11]
    for i in vv, x in i
        println("$i\t= \t$x"," = Wert ")
        
    end
end

println("\nHi, lieber Horst ....\n")
vtest()
println("Weiteres ausgeben: \$... $(47+11)!")

println("Fertig!")
