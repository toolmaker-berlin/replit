# Delegates in Julia
function makeFun(x::Float64)
  return y::Float64 -> y^2 + x^2
end

ff = makeFun(4.0)
# (generic function with 1 method)

ff(5.0)
# 41.0
