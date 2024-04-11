import Pkg
using OhMyREPL

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

function bench2()
    x::Int128=0
    for i::Int128 in 1:1000000000
        for j::Int128 in 1:1000000
            for k::Int128 in 1:1000000
                x=x+10 
                #println(x," ",i," ",j," ",k," ")
            end
        end
    end
    return x
end
bench2()
#@info "Hello world!"
function test()
       x=0
       for a in 1:1000
       for b in 1:1000
       for c in 1:1000
       x+=0.1
       end
       end
       end
       print(x)
end

function test2()
x::Int32 = 5
for i in 1:10
    x-=1
    x%=255
    #println(x)
end
end


function xxx()
    println("Harald's Config...")
    colorscheme!("Monokai16")
    OhMyREPL.input_prompt!(">", :magenta)
    # Pkg.status()
end

macro qq()
    exit()
end

macro ll()
    quote
        @edit xxx()
        include("startmyjulia.jl")
    end
end

using Debugger
using BenchmarkTools
using OhMyREPL

#include("startjulia.jl")


global  GenA = 3
global  GenB = 5
global  GenT = [0, 0, 0, 0]
global  CGenT = [0, 0, 0, 0]
global  Gindex = 0
global  CGindex = 0
global  pos = 0
global  zzahl = 22 #?


function ran(maxi::Integer)
    
global  GenA
global  GenB
global  GenT
global  CGenT
global  Gindex
global  CGindex
global  pos
global  zzahl

    if (GenA == 0 
        || GenA > 0xffffd 
        || GenB == 0 
        || GenB > 0xffffb)

        GenA = 3
        GenB = 5
        GenT = [0, 0, 0, 0]
        CGenT = [0, 0, 0, 0]
        Gindex = 0
        CGindex = 0
        pos = 0
        zzahl = 22 #?
    end

    CGindex = Gindex
    CGenT   = copy(GenT)

    maske   = 0x1f
    # if maxi == 24 else 0xf
    # while (maske < maxi):
    #   maske=maske*2+1

    while true
        pos += 1
        GenA = GenA * 2 % 0xffffd
        GenB = GenB * 3 % 0xffffb

        if maxi == 16
            return
        end
        
        zzahl = (GenA + GenB + GenT[Gindex+1]) & maske

        if (zzahl < maxi)  #prüfen !!!!!!!!!!!!! Continue ????
            Gindex = (Gindex + 1) & 3

            if (Gindex == 0)
                GenT[1] = (GenT[1] + 1)

                if (GenT[1] > 255)
                    GenT[1] = 0
                    GenT[2] = (GenT[2] + 1)

                    if (GenT[2] > 255)
                        GenT[2] = 0
                        GenT[3] = (GenT[3] + 1)
                    
                        if (GenT[3] > 255)
                            GenT[3] = 0
                            GenT[4] = (GenT[4] + 1)
                        end  
                    end
                end
            end
        return zzahl,GenA,GenB
        end
    end
end

function bench3(n)
    for i in 1:n
        global x,GA,GB=ran(24)
        #println(x," ",GA," ",GB)
    end
end



using Primes

function revprime(n)
for i in 13:2:n
    j=parse(Int64,reverse(string(i)))
    #println(i," ",j)
    if isprime(i) && isprime(j) &&  i<j && i!=j
        println(i)
    end
end
end

;
