module Unitful

import Base: ==, <, <=, +, -, *, /, //, ^, isequal
import Base: show, convert
import Base: abs, abs2, angle, float, fma, muladd, inv, sqrt, cbrt
import Base: min, max, floor, ceil, real, imag, conj
import Base: complex, widen, reim # handled in complex.jl
import Base: exp, exp10, exp2, expm1, log, log10, log1p, log2
import Base: sin, cos, tan, asin, acos, atan, sinh, cosh, tanh, asinh, acosh, atanh,
             sinpi, cospi, sinc, cosc, cis
import Base: eps, mod, rem, div, fld, cld, divrem, trunc, round, sign, signbit
import Base: isless, isapprox, isinteger, isreal, isinf, isfinite, isnan
import Base: copysign, flipsign
import Base: prevfloat, nextfloat, maxintfloat, rat, step
import Base: length, float, last, one, oneunit, zero, range
import Base: getindex, eltype, step, last, first, frexp
import Base: Integer, Rational, typemin, typemax
import Base: steprange_last, unsigned
import Base: sleep
@static if VERSION ≥ v"1.7.0-DEV.119"
    import Base: isunordered
end

import Dates
import LinearAlgebra: Diagonal, Bidiagonal, Tridiagonal, SymTridiagonal
import LinearAlgebra: istril, istriu, norm
import Random

export logunit, unit, absoluteunit, dimension, uconvert, ustrip, upreferred
export @dimension, @derived_dimension, @refunit, @unit, @affineunit, @u_str
export Quantity, DimensionlessQuantity, NoUnits, NoDims

export uconvertp, uconvertrp, reflevel, linear
export @logscale, @logunit, @dB, @B, @cNp, @Np
export Level, Gain
export uparse

const unitmodules = Vector{Module}()

function _basefactors(m::Module)
    # A hidden symbol which will be automatically attached to any module
    # defining units, allowing `Unitful.register()` to merge in the units from
    # that module.
    basefactors_name = Symbol("#Unitful_basefactors")
    if isdefined(m, basefactors_name)
        getproperty(m, basefactors_name)
    else
        Core.eval(m, :(const $basefactors_name = Dict{Symbol,Tuple{Float64,Rational{Int}}}()))
    end
end

const basefactors = _basefactors(Unitful)

include("types.jl")
const promotion = Dict{Symbol,FreeUnits}()

include("user.jl")
include("utils.jl")
include("dimensions.jl")
include("units.jl")
include("quantities.jl")
include("display.jl")
include("promotion.jl")
include("conversion.jl")
include("range.jl")
include("fastmath.jl")
include("logarithm.jl")
include("complex.jl")
include("pkgdefaults.jl")
include("dates.jl")

if !isdefined(Base, :get_extension)
    include("../ext/ConstructionBaseUnitfulExt.jl")
    include("../ext/InverseFunctionsUnitfulExt.jl")
end

end
