import Pkg

"""
# Gewinne ermitteln auf allen 5 Linien - addiert zurückgeben
Beispiel: **gewinn(1,1,1)**
"""
function gewinn(pos1::Integer,pos2::Integer,pos3::Integer)
    punktsumme::Int64=0
    punkte::Int64=0


    bild1 = [10, 2, 2, 2, 2, 8, 5, 7, 5, 9, 4, 4, 4, 6, 3, 3, 7, 3, 6, 1, 1, 1, 1, 1]
    bild2 = [10, 4, 4, 4, 8, 7, 5, 5, 6, 6, 9, 2, 2, 2, 2, 2, 8, 1, 1, 1, 1, 3, 3, 3]
    bild3 = [10, 7, 2, 2, 4, 2, 2, 9, 4, 4, 1, 1, 8, 3, 3, 1, 1, 1, 9, 3, 3, 5, 5, 6]

    pos1=pos1+24; pos2=pos2+24; pos3=pos3+24

    line11 = bild1[(pos1%24)+1]
    line12 = bild2[(pos2%24)+1]
    line13 = bild3[(pos3%24)+1]

    line21 = bild1[((pos1 - 1) % 24)+1]
    line22 = bild2[(pos2 - 1) % 24+1]
    line23 = bild3[(pos3 - 1) % 24+1]

    line31 = bild1[(pos1 + 1) % 24+1]
    line32 = bild2[(pos2 + 1) % 24+1]
    line33 = bild3[(pos3 + 1) % 24+1]

    line41 = bild1[(pos1 - 1) % 24+1]
    line42 = bild2[(pos2 + 0) % 24+1]
    line43 = bild3[(pos3 + 1) % 24+1]

    line51 = bild1[(pos1 + 1) % 24+1]
    line52 = bild2[(pos2 + 0) % 24+1]
    line53 = bild3[(pos3 - 1) % 24+1]

    if line11 == line12 == line13
        punkte = bild1[(pos1%24)+1]
        punktsumme += punkte
    end

    if line21 == line22 == line23
        punkte = bild1[(pos1 - 1) % 24+1]
        punktsumme += punkte
    end

    if line31 == line32 == line33
        punkte = bild1[(pos1 + 1) % 24+1]
        punktsumme += punkte
    end

    if line41 == line42 == line43
        punkte = bild1[(pos1 - 1) % 24+1]
        punktsumme += punkte
    end

    if line51 == line52 == line53
        punkte = bild1[(pos1 + 1) % 24+1]
        punktsumme += punkte
    end

    return punktsumme
end

function testbild()
    x=0
    for i=0:23
        for j=0:23
            for k=0:23
                x+=gewinn(i,j,k)
            end
        end
    end
    return x
end

#@info "Hello world!"

function xxx()
    println("Harald's Config...")
    Pkg.status()
end

macro qq()
    exit()
end

macro ll()
    quote
        @edit xxx()
        include("startjulia.jl")
    end
end

using Debugger
using BenchmarkTools

xxx()


