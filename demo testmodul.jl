module TestModul
function tt(x::Int) 
  return x%24 #(mod(x,24))
end 
export tt
end

# using .TestModul
# println(tt(1))

