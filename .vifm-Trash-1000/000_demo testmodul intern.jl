module TestModul
function tt(x::Int) 
  return x%20 #(mod(x,24))
end 
export tt
end

using .TestModul
println(tt(10))

# TODO so geht es nicht in der REPL weil das Modul jedesmal neu aufgerufen wird