print("\033c") # cls

# # Meine ersten Julia Experimente
# ## Meine Glücksscheine mit 30 Stellen nur Int64/Int128
# Dieser Versuch ist ca. 10x schneller als Python das immer mit BigInt's rechnet!

#using BenchmarkTools
function gscheine2(Stellen)
    # Stellen=30
    alt = [(1),1,1,1,1,1,1,1,1,1] 
    # println(typeof(alt))
    for N in 2:(floor(Int,Stellen / 2)) # range(2, Stellen // 2 + 1)
        #println(N)
        neu = [(1)]
        for i in 1:9 #i in range(9): also 0-8
            append!(neu,(neu[i]+alt[i+1])) # neu.append(neu[i] + alt[i + 1])
        end
        #println(neu)
        if N > 2
            for i in 0:((N-2)*5)-1  # for i in range((N - 2) * 5):
                # println(alt)
                t = (alt[(i + 10 +1)] - alt[i+1]) # t = alt[i + 10] - alt[i]
                if t >= 0
                    append!(neu,((neu[i+9+1]+t)))   #neu.append(neu[i + 9] + t)
                end
            end
        end                
        alt = vcat(neu,reverse(neu[1:(floor(Int,N * 9 / 2))])) #alt = neu + neu[N * 9 // 2 - 1 :: -1]
    end
    # println(alt)
    return sum(map(x -> (x^2),alt)) # sum(map(lambda x: x ** 2, alt))
end


# @benchmark gscheine2()


# ### Die Glücksscheine in Python

# def gscheine(Stellen):
#     alt = [1] * 10
#     for N in range(2, Stellen // 2 + 1):
#         neu = [1]
#         for i in range(9):
#             neu.append(neu[i] + alt[i + 1])
#         if N > 2:
#             for i in range((N - 2) * 5):
#                 t = alt[i + 10] - alt[i]
#                 if t >= 0:
#                     neu.append(neu[i + 9] + t)
#         alt = neu + neu[N * 9 // 2 - 1 :: -1]
#     return sum(map(lambda x: x ** 2, alt))
#
# gscheine(10)

# ## Meine Glücksscheine mit 1000 Stellen mit BigInt
# Interessant ist, das bei 30 Stellen BigInt genauso schnell ist wie Int64/Int128. Bei mehr wird dann BigInt verwendet das mit Python gleichauf liegt.

# +
# Das ist jetzt die große Version optimiert
using BenchmarkTools

function gscheine1(Stellen)
    alt = fill(BigInt(1),10)
    for N in 2:(floor(Int,Stellen / 2))
        neu = [BigInt(1)]
        for i in 1:9
            append!(neu,BigInt(neu[i]+alt[i+1]))
        end
        if N > 2
            for i in 1:((N-2)*5)
                t = BigInt(alt[(i + 10)] - alt[i])
                if t >= 0
                    append!(neu,(neu[i+9]+t))
                end
            end
        end                
        alt = vcat(neu,reverse(neu[1:(floor(Int,N * 9 / 2))]))
    end
    return sum(map(x -> BigInt(x^2),alt))
end

println("30/1000 Stellen mit BIG")
@time gscheine1(30)
@time gscheine1(1000)
println("30/---- Stellen mit INT")
@time gscheine2(30)

