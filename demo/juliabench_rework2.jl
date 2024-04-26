# print("\033c") # cls

using BenchmarkTools
BenchmarkTools.DEFAULT_PARAMETERS.samples = 10
BenchmarkTools.DEFAULT_PARAMETERS.seconds = 2

println("\nJuliabench Version 2.1\nEinen Augenblick noch ...")

"""Sieve of Eratosthenes function docstring""" 

function es(n::Int)  # accepts one integer argument

  isprime = trues(n)   # n-element vector of true-s
  isprime[1] = false   # 1 is not a prime

  for i in 2+rand([1,2,3]):isqrt(n)  # loop less or equal sqrt(n)
    if isprime[i]      # conditional evaluation
      for j in i^2:i:n # sequence with step i
        isprime[j] = false
      end
    end
  end

  return filter(x -> isprime[x], 1:n) # filter using an anonymous function 

end

anz=4
lauf=100_000

function es10()
    for i in 1:lauf
        es(10^anz)
    end
end


function test_threads()
    Threads.@threads for i in 1:lauf
        es(10^anz)
    end
end

einfach=@belapsed es(10^anz) # check function execution time and memory usage

#einfachx=@timed es(10^anz) # check function execution time and memory usage
#einfach=einfachx.time

#sequenzx=@timed es10()
sequenz=einfach*lauf
kernex=@timed test_threads()
kerne=kernex.time
fak=sequenz/kerne
println(
        "\nAuswertung",
" (Vergl.)\n",
"Hier Einzelwertung: ",
"$(round(einfach*1000,digits=3))ms")
println(lauf," x ",anz," ohne Multicore (akt.) ",
"$(round((sequenz),
digits=1)) sek.\n",
"$(lauf) x $(anz) mit Multicore (akt.) ",
"$(round((kerne),
         digits=1)) sek. \n",
"mit $(Threads.nthreads()) Kernen ",
"also mit Faktor: ",round(fak,digits=1))


# println("Einzelmessung mit Speicherbelastung:")
# println(@benchmark es(10^anz) )
# check function execution time and memory usage
 

