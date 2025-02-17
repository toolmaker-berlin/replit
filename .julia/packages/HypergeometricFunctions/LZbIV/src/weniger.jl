@doc raw"""
    pFqweniger(α, β, z; kmax, γ = 2)
Compute the generalized hypergeometric function [`pFq`](@ref) by rational approximations of type (k, k) generated by a factorial Levin-type sequence transformation described in

> R. M. Slevinsky, [Fast and stable rational approximation of generalized hypergeometric functions](https://arxiv.org/abs/2307.06221), arXiv:2307.06221, 2023.
"""
pFqweniger

# ₀F₀(;z), γ = 2.
function pFqweniger(::Tuple{}, ::Tuple{}, z::T; kmax::Int = KMAX) where T
    if norm(z) < eps(real(T))
        return one(T)
    end
    μlo = one(T)
    μhi = inv(2-z)
    Rlo = one(T)
    Rhi = Rlo + 2z*μhi
    k = 1
    z2 = z*z
    while k < kmax && errcheck(Rlo, Rhi, 8eps(real(T)))
        μhi, μlo = inv(4k+2 + z2*μhi), μhi
        Rhi, Rlo = ((4k+2)*Rhi + z2*Rlo*μlo)*μhi, Rhi
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val(0), Val(0))*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Rhi) ? Rhi : Rlo
end

# ₁F₀(α;z), γ = 2.
function pFqweniger(α::Tuple{T1}, ::Tuple{}, z::T2; kmax::Int = KMAX) where {T1, T2}
    α = α[1]
    T = promote_type(T1, T2)
    absα = abs(T(α))
    if norm(z) < eps(real(T)) || norm(α) < eps(absα)
        return one(T)
    end
    μlo = α
    μhi = inv(2-(α+1)*z)
    Rlo = one(T)
    Rhi = Rlo + 2z*μhi*μlo
    if norm(α+1) < eps(absα+1)
        return Rhi
    end
    μhi *= α+1
    k = 1
    z2 = z*z
    while k < kmax && errcheck(Rlo, Rhi, 8eps(real(T)))
        μhi, μlo = inv((2k+1)*(2-z) - (k-α)*z2*μhi), μhi
        Rhi, Rlo = ((2k+1)*(2-z)*Rhi - (k-α)*z2*Rlo*μlo)*μhi, Rhi
        if norm(α+k+1) < eps(absα+k+1)
            return Rhi
        end
        μhi *= α+k+1
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val(1), Val{0}())*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Rhi) ? Rhi : Rlo
end

# ₀F₁(β;z), γ = 2.
function pFqweniger(::Tuple{}, β::Tuple{T1}, z::T2; kmax::Int = KMAX) where {T1, T2}
    β = β[1]
    T = promote_type(T1, T2)
    if norm(z) < eps(real(T))
        return one(T)
    end
    ζ = inv(z)
    Nlo = β*ζ
    Dlo = β*ζ
    Tlo = Nlo/Dlo
    b0 = T(2*(β+1))
    Nmid = (b0*ζ-1)*Nlo + b0*ζ
    Dmid = (b0*ζ-1)*Dlo
    Tmid = Nmid/Dmid
    k = 1
    #a1 = T(-4)
    b0 = T(6*(β+2))
    b1 = T(-6*β)
    t0 = b0*ζ+3
    t1 = b1*ζ+4
    Nhi = t0*Nmid + t1*Nlo + b1*ζ
    Dhi = t0*Dmid + t1*Dlo
    #Nhi = -Nmid - a1*(Nmid+Nlo) + ζ*(b0*Nmid + b1*Nlo) + b1*ζ
    #Dhi = -Dmid - a1*(Dmid+Dlo) + ζ*(b0*Dmid + b1*Dlo)
    Thi = Nhi/Dhi
    k = 2
    while k < 4 || (k < kmax && errcheck(Tmid, Thi, 8eps(real(T))))
        #a1 = T(-4k)/T(2k-1)
        a2 = T(2k+1)/T(2k-1)
        b0 = T(4k+2)*T(β+k+1)
        b1 = T(4k+2)*T(k-β-1)
        t0 = b0*ζ+a2
        t1 = b1*ζ+1
        Nhi, Nmid, Nlo = t0*Nhi + t1*Nmid - a2*Nlo, Nhi, Nmid
        Dhi, Dmid, Dlo = t0*Dhi + t1*Dmid - a2*Dlo, Dhi, Dmid
        #Nhi, Nmid, Nlo = -Nhi - a1*(Nhi+Nmid) - a2*(Nmid+Nlo) + ζ*(b0*Nhi + b1*Nmid), Nhi, Nmid
        #Dhi, Dmid, Dlo = -Dhi - a1*(Dhi+Dmid) - a2*(Dmid+Dlo) + ζ*(b0*Dhi + b1*Dmid), Dhi, Dmid
        Thi, Tmid, Tlo = Nhi/Dhi, Thi, Tmid
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val{0}(), Val(1))*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Thi) ? Thi : isfinite(Tmid) ? Tmid : Tlo
end

# ₂F₀(α,β;z), γ = 2.
function pFqweniger(α::Tuple{T1, T1}, ::Tuple{}, z::T2; kmax::Int = KMAX) where {T1, T2}
    (α, β) = α
    T = promote_type(T1, T2)
    absα = abs(T(α))
    absβ = abs(T(β))
    if norm(z) < eps(real(T)) || norm(α*β) < eps(absα*absβ)
        return one(T)
    end
    μlo = T(α*β)
    Rlo = one(T)
    a0 = T((α+1)*(β+1))
    μmid = inv(2-a0*z)
    Rmid = Rlo + 2z*μmid*μlo
    if norm(a0) < eps((absα+1)*(absβ+1))
        return Rmid
    end
    μmid *= a0
    k = 1
    a0 = T((α+2)*(β+2))
    t0 = 6-(6-3*α*β)*z
    t1 = 6-2*T(2*α*β+α+β-1)*z
    μhi = inv(t0 - t1*z*μmid)
    Rhi = (t0*Rmid - (t1*Rlo + 6*z*μlo)*z*μmid)*μhi
    if norm(a0) < eps((absα+2)*(absβ+2))
        return Rhi
    end
    μhi *= a0
    k = 2
    z2 = z*z
    while k < 3 || (k < kmax && errcheck(Rmid, Rhi, 8eps(real(T))))
        a0 = T((α+k+1)*(β+k+1))
        t0 = (4k+2)-T((k*(α+β+3k)-(α+1)*(β+1)))*T(2k+1)/T(2k-1)*z
        t1 = (4k+2)+T(k*(3k-α-β)-(α+1)*(β+1))*z
        a2 = T((α+1-k)*(β+1-k))*T(2k+1)/T(2k-1)*z2
        μhi, μmid, μlo = inv(t0 - (t1 + a2*μmid)*z*μhi), μhi, μmid
        Rhi, Rmid, Rlo = (t0*Rhi - (t1*Rmid + a2*Rlo*μlo)*z*μmid)*μhi, Rhi, Rmid
        if norm(a0) < eps((absα+k+1)*(absβ+k+1))
            return Rhi
        end
        μhi *= a0
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val(2), Val{0}())*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Rhi) ? Rhi : isfinite(Rmid) ? Rmid : Rlo
end

# ₁F₁(α,β;z), γ = 2.
function pFqweniger(α::Tuple{T1}, β::Tuple{T2}, z::T3; kmax::Int = KMAX) where {T1, T2, T3}
    α = α[1]
    β = β[1]
    T = promote_type(T1, T2, T3)
    absα = abs(T(α))
    if norm(z) < eps(real(T)) || norm(α) < eps(absα)
        return one(T)
    end
    ζ = inv(z)
    Nlo = β*ζ/α
    Dlo = β*ζ/α
    Tlo = Nlo/Dlo
    a0 = T(α+1)
    b0 = T(2*(β+1))
    Nmid = (b0*ζ-a0)*Nlo + b0*ζ
    Dmid = (b0*ζ-a0)*Dlo
    Tmid = Nmid/Dmid
    if norm(a0) < eps(absα+1)
        return Tmid
    end
    Nmid /= a0
    Dmid /= a0
    k = 1
    a0 = T(α+2)
    #a1 = -T(4α+2)
    b0 = T(6*(β+2))
    b1 = T(-6*β)
    t0 = b0*ζ+3α
    t1 = b1*ζ+4α+2
    Nhi = t0*Nmid + t1*Nlo + b1*ζ
    Dhi = t0*Dmid + t1*Dlo
    #Nhi = -a0*Nmid - a1*(Nmid+Nlo) + ζ*(b0*Nmid + b1*Nlo) + b1*ζ
    #Dhi = -a0*Dmid - a1*(Dmid+Dlo) + ζ*(b0*Dmid + b1*Dlo)
    Thi = Nhi/Dhi
    if norm(a0) < eps(absα+2)
        return Thi
    end
    Nhi /= a0
    Dhi /= a0
    k = 2
    while k < 5 || (k < kmax && errcheck(Tmid, Thi, 8eps(real(T))))
        a0 = T(α+k+1)
        #a1 = -T(2α+1)*T(2k)/T(2k-1)
        a2 = T(α+1-k)*T(2k+1)/T(2k-1)
        b0 = T(4k+2)*T(β+k+1)
        b1 = T(4k+2)*T(k-β-1)
        t0 = b0*ζ+a2
        t1 = b1*ζ+a0
        Nhi, Nmid, Nlo = t0*Nhi + t1*Nmid - a2*Nlo, Nhi, Nmid
        Dhi, Dmid, Dlo = t0*Dhi + t1*Dmid - a2*Dlo, Dhi, Dmid
        #Nhi, Nmid, Nlo = -a0*Nhi - a1*(Nhi+Nmid) - a2*(Nmid+Nlo) + ζ*(b0*Nhi + b1*Nmid), Nhi, Nmid
        #Dhi, Dmid, Dlo = -a0*Dhi - a1*(Dhi+Dmid) - a2*(Dmid+Dlo) + ζ*(b0*Dhi + b1*Dmid), Dhi, Dmid
        Thi, Tmid, Tlo = Nhi/Dhi, Thi, Tmid
        if norm(a0) < eps(absα+k+1)
            return Thi
        end
        Nhi /= a0
        Dhi /= a0
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val(1), Val(1))*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Thi) ? Thi : isfinite(Tmid) ? Tmid : Tlo
end

# ₀F₂(α,β;z), algorithm γ = 2.
function pFqweniger(α::Tuple{}, β::Tuple{T1, T1}, z::T2; kmax::Int = KMAX) where {T1, T2}
    (α, β) = β
    T = promote_type(T1, T2)
    if norm(z) < eps(real(T))
        return one(T)
    end
    ζ = inv(z)
    Nlo = α*β*ζ
    Dlo = α*β*ζ
    Tlo = Nlo/Dlo
    a0 = T(1)
    b0 = 2*T(α+1)*T(β+1)
    Nmid2 = (b0*ζ-a0)*Nlo + b0*ζ
    Dmid2 = (b0*ζ-a0)*Dlo
    Tmid2 = Nmid2/Dmid2
    k = 1
    b0 = 6*T(α+2)*T(β+2)
    b1 = 6*T(α+β+3)
    t0 = b0*ζ
    t1 = b1*ζ+1
    Nmid1 = t0*Nmid2 + t1*Nlo + b1*ζ
    Dmid1 = t0*Dmid2 + t1*Dlo
    Tmid1 = Nmid1/Dmid1
    k = 2
    a2 = T(5)/T(3)
    b0 = 10*T(α+3)*T(β+3)
    b1 = -10*(T(α-1)*β-T(α+11))
    b2 = T(40)
    t0 = b0*ζ+T(5)/T(3)
    t1 = b1*ζ+1
    t2 = b2*ζ-a2
    Nhi = t0*Nmid1 + t1*Nmid2 + t2*Nlo + b2*ζ
    Dhi = t0*Dmid1 + t1*Dmid2 + t2*Dlo
    Thi = Nhi/Dhi
    k = 3
    while k < 6 || (k < kmax && errcheck(Tmid1, Thi, 8eps(real(T))))
        a3 = -k*T(2k+1)/T((k-1)*(2k-3))
        b0 = T(4k+2)*T(α+k+1)*T(β+k+1)
        b1 = (T(k*(k-1))-T(α+1)*T(β+1))*T(2k-1)*T(4k+2)/T(k-1)
        b2 = T(k-α-2)*T(k-β-2)*T(4k+2)*k/T(k-1)
        t0 = b0*ζ+T(2k+1)/T(k-1)
        t1 = b1*ζ-3*T(2k-1)/T((k-1)*(2k-3))
        t2 = b2*ζ-T(2k+1)/T(k-1)
        Nhi, Nmid1, Nmid2, Nlo = t0*Nhi + t1*Nmid1 + t2*Nmid2 - a3*Nlo, Nhi, Nmid1, Nmid2
        Dhi, Dmid1, Dmid2, Dlo = t0*Dhi + t1*Dmid1 + t2*Dmid2 - a3*Dlo, Dhi, Dmid1, Dmid2
        Thi, Tmid1, Tmid2, Tlo = Nhi/Dhi, Thi, Tmid1, Tmid2
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val{0}(), Val(2))*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Thi) ? Thi : isfinite(Tmid1) ? Tmid1 : isfinite(Tmid2) ? Tmid2 : Tlo
end

# ₂F₁(α,β,γ;z), algorithm γ = 2.
function pFqweniger(α::Tuple{T1, T1}, β::Tuple{T2}, z::T3; kmax::Int = KMAX) where {T1, T2, T3}
    γ = β[1]
    (α, β) = α
    T = promote_type(T1, T2, T3)
    absα = abs(T(α))
    absβ = abs(T(β))
    if norm(z) < eps(real(T)) || norm(α*β) < eps(absα*absβ)
        return one(T)
    end
    μlo = T(α*β)/T(γ)
    Rlo = one(T)
    a0 = T((α+1)*(β+1))
    b0 = T(2*(γ+1))
    μmid = inv(b0-a0*z)
    Rmid = Rlo + b0*z*μmid*μlo
    if norm(a0) < eps((absα+1)*(absβ+1))
        return Rmid
    end
    μmid *= a0
    k = 1
    a0 = T((α+2)*(β+2))
    b0 = T(6*(γ+2))
    b1 = T(-6*γ)
    t0 = b0-(6-3*α*β)*z
    t1 = b1+2*T(2*α*β+α+β-1)*z
    μhi = inv(t0 + t1*z*μmid)
    Rhi = (t0*Rmid + (t1*Rlo + b1*z*μlo)*z*μmid)*μhi
    if norm(a0) < eps((absα+2)*(absβ+2))
        return Rhi
    end
    μhi *= a0
    k = 2
    z2 = z*z
    while k < 5 || (k < kmax && errcheck(Rmid, Rhi, 8eps(real(T))))
        a0 = T((α+k+1)*(β+k+1))
        a2 = T((α+1-k)*(β+1-k))*T(2k+1)/T(2k-1)*z2
        b0 = T(4k+2)*T(γ+k+1)
        b1 = T(4k+2)*T(k-γ-1)
        t0 = b0-T((k*(α+β+3k)-(α+1)*(β+1)))*T(2k+1)/T(2k-1)*z
        t1 = b1-T(k*(3k-α-β)-(α+1)*(β+1))*z
        μhi, μmid, μlo = inv(t0 + (t1 - a2*μmid)*z*μhi), μhi, μmid
        Rhi, Rmid, Rlo = (t0*Rhi + (t1*Rmid - a2*Rlo*μlo)*z*μmid)*μhi, Rhi, Rmid
        if norm(a0) < eps((absα+k+1)*(absβ+k+1))
            return Rhi
        end
        μhi *= a0
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val(2), Val(1))*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Rhi) ? Rhi : isfinite(Rmid) ? Rmid : Rlo
end

# ₃F₂(α,β,γ,δ,λ;z), algorithm γ = 2.
function pFqweniger(α::Tuple{T1, T1, T1}, β::Tuple{T2, T2}, z::T3; kmax::Int = KMAX) where {T1, T2, T3}
    (δ, λ) = β
    (α, β, γ) = α
    T = promote_type(T1, T2, T3)
    absα = abs(T(α))
    absβ = abs(T(β))
    absγ = abs(T(γ))
    if norm(z) < eps(real(T)) || norm(α*β*γ) < eps(absα*absβ*absγ)
        return one(T)
    end
    μlo = T(α*β*γ)/T(δ*λ)
    Rlo = one(T)
    a0 = T(α+1)*T(β+1)*T(γ+1)
    b0 = 2*T(δ+1)*T(λ+1)
    μmid2 = inv(b0-a0*z)
    Rmid2 = Rlo + b0*z*μmid2*μlo
    if norm(a0) < eps((absα+1)*(absβ+1)*(absγ+1))
        return Rmid2
    end
    μmid2 *= a0
    k = 1
    a0 = T(α+2)*T(β+2)*T(γ+2)
    a1 = (T(1-β)*γ+β+5)*α+T(5+β)*γ+5*T(β)+13
    b0 = 6*T(δ+2)*T(λ+2)
    b1 = 6*T(δ+λ+3)
    t0 = b0-3*(T(β+γ+3)*α+T(β+3)*γ+3*T(β)+7)*z
    t1 = b1-a1*z
    μmid1 = inv(t0 + t1*z*μmid2)
    Rmid1 = (t0*Rmid2 + (t1*Rlo + b1*z*μlo)*z*μmid2)*μmid1
    if norm(a0) < eps((absα+2)*(absβ+2)*(absγ+2))
        return Rmid1
    end
    μmid1 *= a0
    k = 2
    a0 = T(α+3)*T(β+3)*T(γ+3)
    a2 = 5*(T(γ-1)*T(β-1)*α+T(1-β)*γ+T(β)+23)/3
    b0 = 10*T(δ+3)*T(λ+3)
    b1 = -10*(T(δ-1)*λ-T(δ+11))
    b2 = T(40)
    t0 = b0+5*((T(β-1)*γ-T(β+11))*α-T(β+11)*γ-11*T(β)-49)/3*z
    t1 = b1+((T(3+β)*γ+T(3*β-11))*α+T(3*β-11)*γ-11*T(β)-93)*z
    t2 = b2-a2*z
    μhi = inv(t0 + (t1 + t2*z*μmid2)*z*μmid1)
    Rhi = (t0*Rmid1 + (t1*Rmid2 + (t2*Rlo + b2*z*μlo)*z*μmid2)*z*μmid1)*μhi
    if norm(a0) < eps((absα+3)*(absβ+3)*(absγ+3))
        return Rhi
    end
    μhi *= a0
    k = 3
    z2 = z*z
    while k < 6 || (k < kmax && errcheck(Rmid1, Rhi, 8eps(real(T))))
        a0 = T(α+k+1)*T(β+k+1)*T(γ+k+1)
        a3 = T(k-α-2)*T(k-β-2)*T(k-γ-2)*k*T(2k+1)/T((k-1)*(2k-3))*z2
        b0 = T(4k+2)*T(δ+k+1)*T(λ+k+1)
        b1 = (T(k*(k-1))-T(δ+1)*T(λ+1))*T(2k-1)*T(4k+2)/T(k-1)
        b2 = T(k-δ-2)*T(k-λ-2)*T(4k+2)*k/T(k-1)
        t0 = b0-((T(2k+α+β+γ)*k-T(α+β+γ+2))*k-T(γ+1)*T(α+1)*T(β+1))*T(2k+1)/T(k-1)*z
        t1 = b1-(((T(6k-12)*k+(T(-2β-2γ-3)*α+T(-2β-3)*γ-3β-2))*k+(T(2β+2γ+3)*α+T(2β+3)*γ+3β+8))*k+3*T(γ+1)*T(α+1)*T(β+1))*T(2k-1)/T((k-1)*(2k-3))*z
        t2 = b2-((T(2k-α-β-γ-6)*k+T(α+β+γ+4))*k+T(γ+1)*T(α+1)*T(β+1))*T(2k+1)/T(k-1)*z
        μhi, μmid1, μmid2, μlo = inv(t0 + (t1 + (t2 - a3*μmid2)*z*μmid1)*z*μhi), μhi, μmid1, μmid2
        Rhi, Rmid1, Rmid2, Rlo = (t0*Rhi + (t1*Rmid1 + (t2*Rmid2 - a3*Rlo*μlo)*z*μmid2)*z*μmid1)*μhi, Rhi, Rmid1, Rmid2
        if norm(a0) < eps((absα+k+1)*(absβ+k+1)*(absγ+k+1))
            return Rhi
        end
        μhi *= a0
        k += 1
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val(3), Val(2))*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(Rhi) ? Rhi : isfinite(Rmid1) ? Rmid1 : isfinite(Rmid2) ? Rmid2 : Rlo
end

# ₘFₙ(α;β;z)
function pFqweniger(α::AbstractVector{T1}, β::AbstractVector{T2}, z::T3, args...; kwds...) where {T1, T2, T3}
    pFqweniger(Tuple(α), Tuple(β), z, args...; kwds...)
end
function pFqweniger(α::NTuple{p, Any}, β::NTuple{q, Any}, z, args...; kwds...) where {p, q}
    T1 = isempty(α) ? Any : mapreduce(typeof, promote_type, α)
    T2 = isempty(β) ? Any : mapreduce(typeof, promote_type, β)
    pFqweniger(T1.(α), T2.(β), z, args...; kwds...)
end
function pFqweniger(α::NTuple{p, T1}, β::NTuple{q, T2}, z::T3; kmax::Int = KMAX, γ::T4 = 2) where {p, q, T1, T2, T3, T4}
    T = promote_type(eltype(α), eltype(β), T3, T4)
    absα = abs.(T.(α))
    if norm(z) < eps(real(T)) || norm(prod(α)) < eps(real(T)(prod(absα)))
        return one(T)
    end
    γ = T(γ)
    ζ = inv(z)
    r = max(p, q+1)
    N = zeros(T, r+3)
    D = zeros(T, r+3)
    R = zeros(T, r+3)
    N[r+3] = prod(β)*ζ/prod(α)/(γ-1)
    D[r+3] = prod(β)*ζ/prod(α)/(γ-1)
    R[r+3] = N[r+3]/D[r+3]
    err = real(T)(1)
    @inbounds for j in 1:p
        err *= absα[j]+1
    end
    P̂ = zeros(T, r+2)
    t = T(1)
    @inbounds for j in 1:p
        t *= α[j]+1
    end
    P̂[1] = t
    Q = zeros(T, r+1)
    t = T(2)
    @inbounds for j in 1:q
        t *= β[j]+1
    end
    Q[1] = t
    P̂R = γ+2
    QR = T(1)
    k = 0
    @inbounds while k ≤ r+2 || (k < kmax && errcheck(R[r+2], R[r+3], 8eps(real(T))))
        for j in 1:r+2
            N[j] = N[j+1]
            D[j] = D[j+1]
            R[j] = R[j+1]
        end
        t1 = zero(T)
        for j in 0:r
            t1 += Q[j+1]*(γ+2k-2j-1)*N[r-j+2]
        end
        if k ≤ r
            for j in 0:k
                t2 = one(T)
                for i in 1:q
                    t2 *= β[i]+j+1
                end
                t2 *= j+2
                t1 += binomial(k, j)*(-one(T))^(k-j)*t2
            end
        end
        t2 = zero(T)
        t2 += P̂[1]*(γ+k-1)*N[r+2]
        for j in 1:r+1
            t2 += P̂[j+1]*(N[r-j+3]+(γ+k-j-1)*N[r-j+2])
        end
        N[r+3] = ζ*t1-t2
        t1 = zero(T)
        for j in 0:r
            t1 += Q[j+1]*(γ+2k-2j-1)*D[r-j+2]
        end
        t2 = zero(T)
        t2 += P̂[1]*(γ+k-1)*D[r+2]
        for j in 1:r+1
            t2 += P̂[j+1]*(D[r-j+3]+(γ+k-j-1)*D[r-j+2])
        end
        D[r+3] = ζ*t1-t2
        R[r+3] = N[r+3]/D[r+3]
        if norm(P̂[1]) < eps(err)
            return R[r+3]
        end
        N[r+3] /= P̂[1]
        D[r+3] /= P̂[1]
        k += 1
        err = real(T)(1)
        for j in 1:p
            err *= absα[j]+k+1
        end
        if k ≤ r+1
            t2 = T(1)
            for j in 1:p
                t2 *= α[j]+k+1
            end
            t2 /= P̂R
            P̂R *= ((γ+2k+1)*(γ+2k+2))/(γ+k+1)
            t1 = k*((γ+2k)*t2 - P̂[1])
            for j in 2:k
                s = ((k-j+1)*((γ+2k-j+1)*t1+k*P̂[j-1]) - k*P̂[j])/j
                P̂[j-1] = t2
                t2 = t1
                t1 = s
            end
            P̂[k] = t2
            P̂[k+1] = t1
            t2 = T(k+2)
            for j in 1:q
                t2 *= β[j]+k+1
            end
            QR *= ((γ+2k-2)*(γ+2k-1))/(γ+k-1)
            t2 /= QR
            t1 = k*((γ+2k-1)*t2 - Q[1])
            for j in 2:min(k, r)
                s = ((k-j+1)*((γ+2k-j)*t1+k*Q[j-1]) - k*Q[j])/j
                Q[j-1] = t2
                t2 = t1
                t1 = s
            end
            Q[min(k, r)] = t2
            Q[min(k, r)+1] = t1
        else
            t2 = γ+k
            for j in 1:p
                t2 *= α[j]+k+1
            end
            t2 /= P̂R
            P̂R *= ((γ+2k+1)*(γ+2k+2))/((γ+2k-r-1)*(γ+2k-r))
            t1 = k*((γ+2k)*t2 - (γ+2k-1-r-2)*P̂[1])
            for j in 2:r+1
                s = ((k-j+1)*((γ+2k-j+1)*t1-(r-j+3)*k*P̂[j-1]) - (γ+2k-j-r-2)*k*P̂[j])/j
                P̂[j-1] = t2
                t2 = t1
                t1 = s
            end
            P̂[r+1] = t2
            P̂[r+2] = t1
            t2 = T(k+2)
            for j in 1:q
                t2 *= β[j]+k+1
            end
            QR *= ((γ+2k-2)*(γ+2k-1))/((γ+2k-r-3)*(γ+2k-r-2))
            t2 /= QR
            t1 = k*((γ+2k-1)*t2 - (γ+2k-1-r-2)*Q[1])
            for j in 2:r
                s = ((k-j+1)*((γ+2k-j)*t1-(r-j+2)*k*Q[j-1]) - (γ+2k-j-r-2)*k*Q[j])/j
                Q[j-1] = t2
                t2 = t1
                t1 = s
            end
            Q[r] = t2
            Q[r+1] = t1
        end
    end
    k < kmax || @warn "Rational approximation to "*pFq2string(Val(p), Val(q))*" reached the maximum type of ("*string(kmax, ", ", kmax)*")."
    return isfinite(R[r+3]) ? R[r+3] : R[r+2]
end
