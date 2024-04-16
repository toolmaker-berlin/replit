print("\033c") # cls

import Base.:+
import Base.:*

println(raw"... jetzt wie in Python:")

+(x::String,y::String)=x*y
println("abc"+"123")

*(x::String,y::Integer)=x^y
println("123 "*2)
