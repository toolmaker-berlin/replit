print("\033c") # cls

using OffsetArrays
using CarouselArrays
println("Offset Arrays testen!\n")

a = OffsetVector([11,22,33,44], 0:3)
b = [11,22,33,44]
c = CarouselArray(b)

function aloop()
    for i in -5000:5000
      x=(a[mod(i,4)])
    end
end

function bloop()
    for i in -5000:5000
      x=(b[mod(i,4)+1])
    end
end

function cloop()
    for i in -5000:5000
      x=c[i]
    end
end

aloop()
bloop()
cloop()

println("OffsetArrays")
@time aloop()
println("Normale Arrays")
@time bloop()
println("Carousel Arrays")
@time cloop()

println("ok\n")