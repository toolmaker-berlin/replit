print("\033c") # cls

using BenchmarkTools
BenchmarkTools.DEFAULT_PARAMETERS.samples = 10
BenchmarkTools.DEFAULT_PARAMETERS.seconds = 2

println("\nJuliabench Version 1.20\nEinen Augenblick noch ...")

"""Sieve of Eratosthenes function docstring""" 

function es(n::Int)  # accepts one integer argument

  isprime = trues(n)   # n-element vector of true-s
  isprime[1] = false   # 1 is not a prime

  for i in 2:isqrt(n)  # loop less or equal sqrt(n)
    if isprime[i]      # conditional evaluation
      for j in i^2:i:n # sequence with step i
        isprime[j] = false
      end
    end
  end

  return filter(x -> isprime[x], 1:n) # filter using an anonymous function 

end


function es10()
    for i in 1:10
        es(10^4)
    end
end


function test_threads()
    Threads.@threads for i in 1:100
        es(10^4)
    end
end

einfach=@belapsed es(10^4) # check function execution time and memory usage
sequenz=@belapsed es10()
kerne=@belapsed test_threads()

println(
        "\nM1   Einzelwertung: 4.5ms (Quark)",
" (Vergl.)\n",
"Hier Einzelwertung: ",
"$(round(einfach*1000,digits=1))ms\n",
"bei Multicorefaktor (akt.) ",
"$(round((sequenz/kerne),
digits=1)) \nmit ",
"$(Threads.nthreads()) Kernen\n")

@benchmark es(10^4) # check function execution time and memory usage

