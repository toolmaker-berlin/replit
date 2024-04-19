print("\033c") # cls

#rnd test

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

println("1000 Ziehungen")
@time bench3(1000)

