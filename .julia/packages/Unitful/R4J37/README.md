[![CI](https://github.com/PainterQubits/Unitful.jl/workflows/CI/badge.svg)](https://github.com/PainterQubits/Unitful.jl/actions?query=workflow%3ACI)
[![Coverage Status](https://coveralls.io/repos/github/PainterQubits/Unitful.jl/badge.svg?branch=master)](https://coveralls.io/github/PainterQubits/Unitful.jl?branch=master)
[![codecov.io](https://codecov.io/github/PainterQubits/Unitful.jl/coverage.svg?branch=master)](https://codecov.io/github/PainterQubits/Unitful.jl?branch=master)



# Unitful.jl

Unitful is a Julia package for physical units. We want to support not only
SI units but also any other unit system. We also want to minimize or in some
cases eliminate the run-time penalty of units. There should be facilities
for dimensional analysis. All of this should integrate easily with the usual
mathematical operations and collections that are found in Julia base.

### Documentation: [![](https://img.shields.io/badge/docs-stable-blue.svg)](https://PainterQubits.github.io/Unitful.jl/stable) [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://PainterQubits.github.io/Unitful.jl/dev)


## Other packages in the Unitful family

### Units packages

- [UnitfulUS.jl](https://github.com/PainterQubits/UnitfulUS.jl): U.S. customary units. Serves as an example for how to implement a units
  package.
- [UnitfulAstro.jl](https://github.com/mweastwood/UnitfulAstro.jl): Astronomical units.
- [UnitfulAngles.jl](https://github.com/yakir12/UnitfulAngles.jl): More angular units, additional trigonometric functionalities, and clock-angle conversion.
- [UnitfulAtomic.jl](https://github.com/sostock/UnitfulAtomic.jl): Easy conversion from and to atomic units.
- [PowerSystemsUnits.jl](https://github.com/invenia/PowerSystemsUnits.jl): Common units for dealing with power systems.
- [UnitfulMoles.jl](https://github.com/rafaqz/UnitfulMoles.jl) for defining mol units of chemical elements and compounds.

### Feature additions

- [UnitfulIntegration.jl](https://github.com/PainterQubits/UnitfulIntegration.jl): Enables use of Unitful quantities with [QuadGK.jl](https://github.com/JuliaMath/QuadGK.jl). PRs for other integration packages are welcome.
- [UnitfulEquivalences.jl](https://github.com/sostock/UnitfulEquivalences.jl): Enables conversion between equivalent quantities of different dimensions, e.g. between energy and wavelength of a photon.
- [UnitfulLatexify.jl](https://github.com/gustaphe/UnitfulLatexify.jl): Pretty print units and quantities in LaTeX format.
- [UnitfulBuckinghamPi.jl](https://github.com/rmsrosa/UnitfulBuckinghamPi.jl): Solves for the adimensional Pi groups in a list of Unitful parameters, according to the Buckingham-Pi Theorem.
- [NaturallyUnitful.jl](https://github.com/MasonProtter/NaturallyUnitful.jl): Convert to and from natural units in physics.
- [UnitfulChainRules.jl](https://github.com/SBuercklin/UnitfulChainRules.jl): Enables use of Unitful quantities with [ChainRules.jl](https://github.com/JuliaDiff/ChainRules.jl)-compatible autodifferentiation systems
- [DimensionfulAngles.jl](https://github.com/cmichelenstrofer/DimensionfulAngles.jl): Adds angle as a dimension. This allows dispatching on angles and derived quantities.
- [UnitfulRecipes.jl](https://github.com/jw3126/UnitfulRecipes.jl) (deprecated): Adds automatic labels and supports plot axes with units for [Plots.jl](https://github.com/JuliaPlots/Plots.jl). (UnitfulRecipes.jl is now included in Plots.jl.) 

## Related packages

Unitful was inspired by:

- [SIUnits.jl](https://github.com/keno/SIUnits.jl)
- [EngUnits.jl](https://github.com/dhoegh/EngUnits.jl)
- [Units.jl](https://github.com/timholy/Units.jl)
