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

print("\033c") # cls

revprime(100)

""" from gmpy2 import is_prime

[i for i,j in (
    (i,int(str(i)[::-1])) for i in range(13,900,2) if is_prime(i) 
    ) 
 if i<j and is_prime(j) ]
"""


