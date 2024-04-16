# Julia by Example

# Introductory Examples

## Contents

* [Introductory Examples](#Introductory-Examples)

## Overview

We’re now ready to start learning the Julia language itself

### Level

Our approach is aimed at those who already have at least some knowledge of programming — perhaps experience with Python, MATLAB, Fortran, C or similar

In particular, we assume you have some familiarity with fundamental programming concepts such as

* variables
* arrays or vectors
* loops
* conditionals (if/else)

### Approach

In this lecture we will write and then pick apart small Julia programs

At this stage the objective is to introduce you to basic syntax and data structures

Deeper concepts—how things work—will be covered in later lectures

Since we are looking for simplicity the examples are a little contrived

In this lecture, we will often start with a direct MATLAB/FORTRAN approach which often is **poor coding style** in Julia, but then move towards more **elegant code** which is tightly connected to the mathematics

### Set Up

We assume that you’ve worked your way through [our getting started lecture](https://lectures.quantecon.org/getting_started.html) already

In particular, the easiest way to install and precompile all the Julia packages used in QuantEcon notes is to type `] add InstantiateFromURL` and then work in a Jupyter notebook, as described [here](https://lectures.quantecon.org/getting_started.html)

### Other References

The definitive reference is [Julia’s own documentation](https://docs.julialang.org/en/v1/)

The manual is thoughtfully written but is also quite dense (and somewhat evangelical)

The presentation in this and our remaining lectures is more of a tutorial style based around examples

## Example: Plotting a White Noise Process

To begin, let’s suppose that we want to simulate and plot the white noise process $ \\epsilon_0, \\epsilon_1, \\ldots, \\epsilon_T $, where each draw $ \\epsilon_t $ is independent standard normal

### Introduction to Packages

The first step is to activate a project environment, which is encapsulated by `Project.toml` and `Manifest.toml` files

There are three ways to install packages and versions (where the first two methods are discouraged, since they may lead to package versions out-of-sync with the notes)

1. `add` the packages directly into your global installation (e.g. `Pkg.add("MyPackage")` or `] add MyPackage`)
2. download an `Project.toml` and `Manifest.toml` file in the same directory as the notebook (i.e. from the `@__DIR__` argument), and then call `using Pkg; Pkg.activate(@__DIR__);`
3. use the `InstantiateFromURL` package

```julia id=329373dc-b5d0-4ee9-a60b-ccdc14b23208
#using InstantiateFromURL
#github_project("QuantEcon/quantecon-notebooks-julia", version = "0.2.0")
```

If you have never run this code on a particular computer, it is likely to take a long time as it downloads, installs, and compiles all dependent packages

This code will download and install project files from GitHub, [QuantEcon/QuantEconLecturePackages](https://github.com/QuantEcon/QuantEconLecturePackages/)

We will discuss it more in [Tools and Editors](https://lectures.quantecon.org/more_julia/tools_editors.html#tools-editors), but these files provide a listing of packages and versions used by the code

This ensures that an environment for running code is **reproducible**, so that anyone can replicate the precise set of package and versions used in construction

The careful selection of package versions is crucial for reproducibility, as otherwise your code can be broken by changes to packages out of your control

After the installation and activation, `using` provides a way to say that a particular code or notebook will use the package

```julia id=ee254118-0b86-47b6-bc4a-b78aed6e9ecd
using LinearAlgebra, Statistics
```

<a id='import'></a>

### Using Functions from a Package

Some functions are built into the base Julia, such as `randn`, which returns a single draw from a normal distibution with mean 0 and variance 1 if given no parameters

```julia id=9887fef8-bf55-430c-b329-8753e4261716
randn()
```

Other functions require importing all of the names from an external library

```julia id=fc53e82f-3dea-403a-b08e-0c7e7a4c7ce3
using Plots
gr(fmt=:png); # setting for easier display in jupyter notebooks

n = 100
ϵ = randn(n)
plot(1:n, ϵ)
```

![result][nextjournal#output#fc53e82f-3dea-403a-b08e-0c7e7a4c7ce3#result]

Let’s break this down and see how it works

The effect of the statement `using Plots` is to make all the names exported by the `Plots` module available

Because we used `Pkg.activate` previously, it will use whatever version of `Plots.jl` that was specified in the `Project.toml` and `Manifest.toml` files

The other packages `LinearAlgebra` and `Statistics` are base Julia libraries, but require an explicit using

The arguments to `plot` are the numbers `1,2, ..., n` for the x-axis, a vector `ϵ` for the y-axis, and (optional) settings

The function `randn(n)` returns a column vector `n` random draws from a normal distribution with mean 0 and variance 1

### Arrays

As a language intended for mathematical and scientific computing, Julia has strong support for using unicode characters

In the above case, the `ϵ` and many other symbols can be typed in most Julia editor by providing the LaTeX and `<TAB>`, i.e. `\epsilon<TAB>`

The return type is one of the most fundamental Julia data types: an array

```julia id=7a4186bd-44dc-4995-a633-109f1caf311b
typeof(ϵ)
```

```julia id=7fc1df70-3bfc-495a-bcae-71cdeaf85ef1
ϵ[1:5]
```

The information from `typeof()` tells us that `ϵ` is an array of 64 bit floating point values, of dimension 1

In Julia, one-dimensional arrays are interpreted as column vectors for purposes of linear algebra

The `ϵ[1:5]` returns an array of the first 5 elements of `ϵ`

Notice from the above that

* array indices start at 1 (like MATLAB and Fortran, but unlike Python and C)
* array elements are referenced using square brackets (unlike MATLAB and Fortran)

To get **help and examples** in Jupyter or other julia editor, use the `?` before a function name or syntax

`?typeof

search: typeof typejoin TypeError

Get the concrete type of x.

Examples

julia> a = 1//2;

julia> typeof(a)
Rational{Int64}

julia> M = [1 2; 3.5 4];

julia> typeof(M)
Array{Float64,2}
`

### For Loops

Although there’s no need in terms of what we wanted to achieve with our program, for the sake of learning syntax let’s rewrite our program to use a `for` loop for generating the data

**Note**

Starting with the most direct version, and pretending we are in a world where `randn` can only return a single value

```julia id=6576f483-07a5-47f4-b2f2-8f853faa5f36
# poor style
n = 100
ϵ = zeros(n)
for i in 1:n
    ϵ[i] = randn()
end
```

Here we first declared `ϵ` to be a vector of `n` numbers, initialized by the floating point `0.0`

The `for` loop then populates this array by successive calls to `randn()`

Like all code blocks in Julia, the end of the `for` loop code block (which is just one line here) is indicated by the keyword `end`

The word `in` from the `for` loop can be replaced by either `∈` or `=`

The index variable is looped over for all integers from `1:n` – but this does not actually create a vector of those indices

Instead, it creates an **iterator** that is looped over – in this case the **range** of integers from `1` to `n`

While this example successfully fills in `ϵ` with the correct values, it is very indirect as the connection between the index `i` and the `ϵ` vector is unclear

To fix this, use `eachindex`

```julia id=19911720-d595-494d-b1cb-30a026870e07
# better style
n = 100
ϵ = zeros(n)
for i in eachindex(ϵ)
    ϵ[i] = randn()
end
```

Here, `eachindex(ϵ)` returns an iterator of indices which can be used to access `ϵ`

While iterators are memory efficient because the elements are generated on the fly rather than stored in memory, the main benefit is (1) it can lead to code which is clearer and less prone to typos; and (2) it allows the compiler flexibility to creatively generate fast code

In Julia you can also loop directly over arrays themselves, like so

```julia id=2cb36cae-6372-4f7a-8106-e1000dbd21c1
ϵ_sum = 0.0 # careful to use 0.0 here, instead of 0
m = 5
for ϵ_val in ϵ[1:m]
    ϵ_sum = ϵ_sum + ϵ_val
end
ϵ_mean = ϵ_sum / m
```

where `ϵ[1:m]` returns the elements of the vector at indices `1` to `m`

Of course, in Julia there are built in functions to perform this calculation which we can compare against

```julia id=fd479ccb-b5a0-4d42-8190-c584295586e0
ϵ_mean ≈ mean(ϵ[1:m])
ϵ_mean ≈ sum(ϵ[1:m]) / m
```

In these examples, note the use of `≈` to test equality, rather than `==`, which is appropriate for integers and other types

Approximately equal, typed with `\approx<TAB>`, is the appropriate way to compare any floating point numbers due to the standard issues of [floating point math](https://floating-point-gui.de/)

<a id='user-defined-functions'></a>

### User-Defined Functions

For the sake of the exercise, let’s go back to the `for` loop but restructure our program so that generation of random variables takes place within a user-defined function

To make things more interesting, instead of directly plotting the draws from the distribution, let’s plot the squares of these draws

```julia id=e4722e71-df08-4c48-bada-2b5f11bf26c4
# poor style
function generatedata(n)
    ϵ = zeros(n)
    for i in eachindex(ϵ)
        ϵ[i] = (randn())^2 # squaring the result
    end
    return ϵ
end

data = generatedata(10)
plot(data)
```

![result][nextjournal#output#e4722e71-df08-4c48-bada-2b5f11bf26c4#result]

Here

* `function` is a Julia keyword that indicates the start of a function definition
* `generatedata` is an arbitrary name for the function
* `return` is a keyword indicating the return value, as is often unnecessary

Let us make this example slightly better by “remembering” that `randn` can return a vectors

```julia id=d4d4988c-de1f-4d4f-a51d-1636e3177dba
# still poor style
function generatedata(n)
    ϵ = randn(n) # use built in function

    for i in eachindex(ϵ)
        ϵ[i] = ϵ[i]^2 # squaring the result
    end

    return ϵ
end
data = generatedata(5)
```

While better, the looping over the `i` index to square the results is difficult to read

Instead of looping, we can **broadcast** the `^2` square function over a vector using a `.`

To be clear, unlike Python, R, and MATLAB (to a lesser extent), the reason to drop the `for` is **not** for performance reasons, but rather because of code clarity

Loops of this sort are at least as efficient as vectorized approach in compiled languages like Julia, so use a for loop if you think it makes the code more clear

```julia id=f822c364-e3f8-4643-b3b6-28d5ad980d04
# better style
function generatedata(n)
    ϵ = randn(n) # use built in function
    return ϵ.^2
 end
data = generatedata(5)
```

We can even drop the `function` if we define it on a single line

```julia id=9b145b3c-f641-46ea-a986-83e379036d6f
# good style
generatedata(n) = randn(n).^2
data = generatedata(5)
```

Finally, we can broadcast any function, where squaring is only a special case

```julia id=7badb605-f5db-467e-bbb4-3086f0498b91
# good style
f(x) = x^2 # simple square function
generatedata(n) = f.(randn(n)) # uses broadcast for some function `f`
data = generatedata(5)
```

As a final – abstract – approach, we can make the `generatedata` function able to generically apply to a function

```julia id=42fb1aa7-5fcc-400c-9aa2-7971b0f4d95e
generatedata(n, gen) = gen.(randn(n)) # uses broadcast for some function `gen`

f(x) = x^2 # simple square function
data = generatedata(5, f) # applies f
```

Whether this example is better or worse than the previous version depends on how it is used

High degrees of abstraction and generality, e.g. passing in a function `f` in this case, can make code either clearer or more confusing, but Julia enables you to use these techniques **with no performance overhead**

For this particular case, the clearest and most general solution is probably the simplest

```julia id=ccaea091-cd09-4d7b-bd36-20ca0ff907e5
# direct solution with broadcasting, and small user-defined function
n = 100
f(x) = x^2

x = randn(n)
plot(f.(x), label="x^2")
plot!(x, label="x") # layer on the same plot
```

![result][nextjournal#output#ccaea091-cd09-4d7b-bd36-20ca0ff907e5#result]

While broadcasting above superficially looks like vectorizing functions in MATLAB, or Python ufuncs, it is much richer and built on core foundations of the language

The other additional function `plot!` adds a graph to the existing plot

This follows a general convention in Julia, where a function that modifies the arguments or a global state has a `!` at the end of its name

#### A Slightly More Useful Function

Let’s make a slightly more useful function

This function will be passed in a choice of probability distribution and respond by plotting a histogram of observations

In doing so we’ll make use of the `Distributions` package, which we assume was instantiated above with the project

Here’s the code

```julia id=2ec40988-6752-42d4-b71d-eaf319738265
using Distributions

function plothistogram(distribution, n)
    ϵ = rand(distribution, n)  # n draws from distribution
    histogram(ϵ)
end

lp = Laplace()
plothistogram(lp, 500)
```

Let’s have a casual discussion of how all this works while leaving technical details for later in the lectures

First, `lp = Laplace()` creates an instance of a data type defined in the `Distributions` module that represents the Laplace distribution

The name `lp` is bound to this value

When we make the function call `plothistogram(lp, 500)` the code in the body of the function `plothistogram` is run with

* the name `distribution` bound to the same value as `lp`
* the name `n` bound to the integer `500`

#### A Mystery

Now consider the function call `rand(distribution, n)`

This looks like something of a mystery

The function `rand()` is defined in the base library such that `rand(n)` returns `n` uniform random variables on $ \[0, 1) $

```julia id=d3b86791-e495-4580-b653-4525a50a44fd
rand(3)
```

On the other hand, `distribution` points to a data type representing the Laplace distribution that has been defined in a third party package

So how can it be that `rand()` is able to take this kind of value as an argument and return the output that we want?

The answer in a nutshell is **multiple dispatch**, which Julia uses to implement **generic programming**

This refers to the idea that functions in Julia can have different behavior depending on the particular arguments that they’re passed

Hence in Julia we can take an existing function and give it a new behavior by defining how it acts on a new type of value

The compiler knows which function definition to apply to in a given setting by looking at the types of the values the function is called on

In Julia these alternative versions of a function are called **methods**

## Example: Variations on Fixed Points

Take a mapping $ f : X \\to X $ for some set $ X $

If there exists an $ x^\* \\in X $ such that $ f(x^*) = x^* $, then $ x^\* $: is called a “fixed point” of $ f $

For our second example, we will start with a simple example of determining fixed points of a function

The goal is to start with code in a MATLAB style, and move towards a more **Julian** style with high mathematical clarity

### Fixed Point Maps

Consider the simple equation, where the scalars $ p,\\beta $ are given, and  $ v $ is the scalar we wish to solve for

$$
v = p + \beta v
$$
Of course, in this simple example, with parameter restrictions this can be solved as $ v = p/(1 - \\beta) $

Rearrange the equation in terms of a map $ f(x) : \\mathbb R \\to \\mathbb R $

<a id='equation-fixed-point-map'></a>

$$
v = f(v) \tag{1}
$$
where

$$
f(v) := p + \beta v
$$
Therefore, a fixed point $ v^\* $ of $ f(\\cdot) $ is a solution to the above problem

### While Loops

One approach to finding a fixed point of [(1)](#equation-fixed-point-map) is to start with an initial value, and iterate the map

<a id='equation-fixed-point-naive'></a>

$$
v^{n+1} = f(v^n) \tag{2}
$$
For this exact `f` function,  we can see the convergence to $ v = p/(1-\\beta) $ when $ |\\beta| < 1 $ by iterating backwards and taking $ n\\to\\infty $

$$
v^{n+1} = p + \beta v^n = p + \beta p + \beta^2 v^{n-1} = p \sum_{i=0}^{n-1} \beta^i + \beta^n v_0
$$
To implement the iteration in [(2)](#equation-fixed-point-naive), we start by solving this problem with a `while` loop

The syntax for the while loop contains no surprises, and looks nearly identical to a MATLAB implementation

```julia id=fe2ba4c9-6987-43aa-8a56-dbcb57b1ca85
# poor style
p = 1.0 # note 1.0 rather than 1
β = 0.9
maxiter = 1000
tolerance = 1.0E-7
v_iv = 0.8 # initial condition

# setup the algorithm
v_old = v_iv
normdiff = Inf
iter = 1
while normdiff > tolerance && iter <= maxiter
    v_new = p + β * v_old # the f(v) map
    normdiff = norm(v_new - v_old)

    # replace and continue
    v_old = v_new
    iter = iter + 1
end
println("Fixed point = $v_old, and |f(x) - x| = $normdiff in $iter iterations")
```

The `while` loop, like the `for` loop should only be used directly in Jupyter or the inside of a function

Here, we have used the `norm` function (from the `LinearAlgebra` base library) to compare the values

The other new function is the `println` with the string interpolation, which splices the value of an expression or variable prefixed by `\$` into a string

An alternative approach is to use a `for` loop, and check for convergence in each iteration

```julia id=03ec923c-439f-4b15-8d65-3c11bfd9a6f0
# setup the algorithm
v_old = v_iv
normdiff = Inf
iter = 1
for i in 1:maxiter
    v_new = p + β * v_old # the f(v) map
    normdiff = norm(v_new - v_old)
    if normdiff < tolerance # check convergence
        iter = i
        break # converged, exit loop
    end
    # replace and continue
    v_old = v_new
end
println("Fixed point = $v_old, and |f(x) - x| = $normdiff in $iter iterations")
```

The new feature there is `break` , which leaves a `for` or `while` loop

### Using a Function

The first problem with this setup is that it depends on being sequentially run – which can be easily remedied with a function

```julia id=29ea9f10-804e-4e6e-ba6a-84464dacef5d
# better, but still poor style
function v_fp(β, ρ, v_iv, tolerance, maxiter)
    # setup the algorithm
    v_old = v_iv
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        v_new = p + β * v_old # the f(v) map
        normdiff = norm(v_new - v_old)

        # replace and continue
        v_old = v_new
        iter = iter + 1
    end
    return (v_old, normdiff, iter) # returns a tuple
end

# some values
p = 1.0 # note 1.0 rather than 1
β = 0.9
maxiter = 1000
tolerance = 1.0E-7
v_initial = 0.8 # initial condition

v_star, normdiff, iter = v_fp(β, p, v_initial, tolerance, maxiter)
println("Fixed point = $v_star, and |f(x) - x| = $normdiff in $iter iterations")
```

While better, there could still be improvements

### Passing a Function

The chief issue is that the algorithm (finding a fixed point) is reusable and generic, while the function we calculate `p + β * v` is specific to our problem

A key feature of languages like Julia, is the ability to efficiently handle functions passed to other functions

```julia id=e636dbba-2b5c-4e21-9676-02a109f20c55
# better style
function fixedpointmap(f, iv, tolerance, maxiter)
    # setup the algorithm
    x_old = iv
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        x_new = f(x_old) # use the passed in map
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    return (x_old, normdiff, iter)
end

# define a map and parameters
p = 1.0
β = 0.9
f(v) = p + β * v # note that p and β are used in the function!

maxiter = 1000
tolerance = 1.0E-7
v_initial = 0.8 # initial condition

v_star, normdiff, iter = fixedpointmap(f, v_initial, tolerance, maxiter)
println("Fixed point = $v_star, and |f(x) - x| = $normdiff in $iter iterations")
```

Much closer, but there are still hidden bugs if the user orders the settings or returns types wrong

### Named Arguments and Return Values

To enable this, Julia has two features:  named function parameters, and named tuples

```julia id=4da7f95a-b9a1-460d-87be-99b59c2315a6
# good style
function fixedpointmap(f; iv, tolerance=1E-7, maxiter=1000)
    # setup the algorithm
    x_old = iv
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        x_new = f(x_old) # use the passed in map
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    return (value = x_old, normdiff=normdiff, iter=iter) # A named tuple
end

# define a map and parameters
p = 1.0
β = 0.9
f(v) = p + β * v # note that p and β are used in the function!

sol = fixedpointmap(f, iv=0.8, tolerance=1.0E-8) # don't need to pass
println("Fixed point = $(sol.value), and |f(x) - x| = $(sol.normdiff) in $(sol.iter)"*
        " iterations")
```

In this example, all function parameters after the `;` in the list, must be called by name

Furthermore, a default value may be enabled – so the named parameter `iv` is required while `tolerance` and `maxiter` have default values

The return type of the function also has named fields, `value, normdiff,` and `iter` – all accessed intuitively using `.`

To show the flexibilty of this code, we can use it to find a fixed point of the non-linear logistic equation, $ x = f(x) $ where $ f(x) := r x (1-x) $

```julia id=8852efc4-916e-4394-acdc-b6bd65ac5a3c
r = 2.0
f(x) = r * x * (1 - x)

sol = fixedpointmap(f, iv=0.8)
println("Fixed point = $(sol.value), and |f(x) - x| = $(sol.normdiff) in $(sol.iter) iterations")
```

### Using a Package

But best of all is to avoid writing code altogether

```julia id=1aa782df-b390-4795-9f3b-61296a05a701
# best style
using NLsolve

p = 1.0
β = 0.9
f(v) = p .+ β * v # broadcast the +
sol = fixedpoint(f, [0.8])
println("Fixed point = $(sol.zero), and |f(x) - x| = $(norm(f(sol.zero) - sol.zero)) in " *
        "$(sol.iterations) iterations")
```

The `fixedpoint` function from the `NLsolve.jl` library implements the simple fixed point iteration scheme above

Since the `NLsolve` library only accepts vector based inputs, we needed to make the `f(v)` function broadcast on the `+` sign, and pass in the initial condition as a vector of length 1 with `[0.8]`

While a key benefit of using a package is that the code is clearer, and the implementation is tested, by using an orthogonal library we also enable performance improvements

```julia id=fcc54b16-5f87-49b7-bf3b-d1e15881d09f
# best style
p = 1.0
β = 0.9
iv = [0.8]
sol = fixedpoint(v -> p .+ β * v, iv)
println("Fixed point = $(sol.zero), and |f(x) - x| = $(norm(f(sol.zero) - sol.zero)) in " *
        "$(sol.iterations) iterations")
```

Note that this completes in `3` iterations vs `177` for the naive fixed point iteration algorithm

Since Anderson iteration is doing more calculations in an iteration,  whether it is faster or not would depend on the complexity of the `f` function

But this demonstrates the value of keeping the math separate from the algorithm, since by decoupling the mathematical definition of the fixed point from the implementation in [(2)](#equation-fixed-point-naive), we were able to exploit new algorithms for finding a fixed point

The only other change in this function is the move from directly defining `f(v)` and using an **anonymous** function

Similar to anonymous functions in MATLAB, and lambda functions in Python, Julia enables the creation of small functions without any names

The code `v -> p .+ β * v` defines a function of a dummy argument, `v` with the same body as our `f(x)`

### Composing Packages

A key benefit of using Julia is that you can compose various packages, types, and techniques, without making changes to your underlying source

As an example, consider if we want to solve the model with a higher-precision, as floating points cannot be distinguished beyond the machine epsilon for that type (recall that computers approximate real numbers to the nearest binary  of a given precision; the *machine epsilon* is the smallest nonzero magnitude)

In Julia, this number can be calculated as

```julia id=fe8de70d-aeea-4e5c-9f4d-8df749b7f691
eps()
```

For many cases, this is sufficient precision – but consider that in iterative algorithms applied millions of times, those small differences can add up

The only change we will need to our model in order to use a different floating point type is to call the function with an arbitrary precision floating point, `BigFloat`, for the initial value

```julia id=76edc574-1b5f-4f74-9873-53dd5b5c41ef
# use arbitrary precision floating points
p = 1.0
β = 0.9
iv = [BigFloat(0.8)] # higher precision

# otherwise identical
sol = fixedpoint(v -> p .+ β * v, iv)
println("Fixed point = $(sol.zero), and |f(x) - x| = $(norm(f(sol.zero) - sol.zero)) in " *
        "$(sol.iterations) iterations")
```

Here, the literal `BigFloat(0.8)` takes the number `0.8` and changes it to an arbitrary precision number

The result is that the residual is now **exactly** `0.0` since it is able to use arbitrary precision in the calculations, and the solution has a finite-precision solution with those parameters

### Multivariate Fixed Point Maps

The above example can be extended to multivariate maps without any modifications to the fixed point iteration code

Using our own, homegrown iteration and simply passing in a bivariate map:

```julia id=15e1c38b-26a0-405d-b7fc-38861a4c7a6b
p = [1.0, 2.0]
β = 0.9
iv = [0.8, 2.0]
f(v) = p .+ β * v # note that p and β are used in the function!

sol = fixedpointmap(f, iv = iv, tolerance = 1.0E-8)
println("Fixed point = $(sol.value), and |f(x) - x| = $(sol.normdiff) in $(sol.iter)"*
"iterations")
```

This also works without any modifications with the `fixedpoint` library function

```julia id=009b15e0-f15e-4a2b-a06b-512d7bc6b1a0
using NLsolve

p = [1.0, 2.0, 0.1]
β = 0.9
iv =[0.8, 2.0, 51.0]
f(v) = p .+ β * v

sol = fixedpoint(v -> p .+ β * v, iv)
println("Fixed point = $(sol.zero), and |f(x) - x| = $(norm(f(sol.zero) - sol.zero)) in " *
        "$(sol.iterations) iterations")
```

Finally, to demonstrate the importance of composing different libraries, use a `StaticArrays.jl` type, which provides an efficient implementation for small arrays and matrices

```julia id=d6d8d20f-9331-4b28-9179-6226b9ad3460
using NLsolve, StaticArrays
p = @SVector [1.0, 2.0, 0.1]
β = 0.9
iv = @SVector  [0.8, 2.0, 51.0]
f(v) = p .+ β * v

sol = fixedpoint(v -> p .+ β * v, iv)
println("Fixed point = $(sol.zero), and |f(x) - x| = $(norm(f(sol.zero) - sol.zero)) in " *
        "$(sol.iterations) iterations")
```

The `@SVector` in front of the `[1.0, 2.0, 0.1]` is a macro for turning a vector literal into a static vector

All macros in Julia are prefixed by `@` in the name, and manipulate the code prior to compilation

We will see a variety of macros, and discuss the “metaprogramming” behind them in a later lecture

## Exercises

<a id='jbe-ex1'></a>

### Exercise 1

Recall that $ n! $ is read as “$ n $ factorial” and defined as

$$
 n! = n \times (n - 1) \times \cdots \times 2 \times 1 $

In Julia you can compute this value with `factorial(n)`

Write your own version of this function, called `factorial2`, using a `for` loop


<a id='jbe-ex2'></a>
$$
### Exercise 2

The [binomial random variable](https://en.wikipedia.org/wiki/Binomial_distribution) $ Y \\sim Bin(n, p) $ represents

* number of successes in $ n $ binary trials
* each trial succeeds with probability $ p $

Using only `rand()` from the set of Julia’s built-in random number generators (not the `Distributions` package), write a function `binomial_rv` such that `binomial_rv(n, p)` generates one draw of $ Y $

Hint: If $ U $ is uniform on $ (0, 1) $ and $ p \\in (0,1) $, then the expression `U < p` evaluates to `true` with probability $ p $

<a id='jbe-ex3'></a>

### Exercise 3

Compute an approximation to $ \\pi $ using Monte Carlo

For random number generation use only `rand()`

Your hints are as follows:

* If $ U $ is a bivariate uniform random variable on the unit square $ (0, 1)^2 $, then the probability that $ U $ lies in a subset $ B $ of $ (0,1)^2 $ is equal to the area of $ B $
* If $ U_1,\\ldots,U_n $ are iid copies of $ U $, then, as $ n $ gets larger, the fraction that falls in $ B $ converges to the probability of landing in $ B $
* For a circle, area = π \* $ radius^2 $

<a id='jbe-ex4'></a>

### Exercise 4

Write a program that prints one realization of the following random device:

* Flip an unbiased coin 10 times
* If 3 consecutive heads occur one or more times within this sequence, pay one dollar
* If not, pay nothing

Once again use only `rand()` as your random number generator

<a id='jbe-ex5'></a>

### Exercise 5

Simulate and plot the correlated time series

$$
x_{t+1} = \alpha \, x_t + \epsilon_{t+1}
\quad \text{where} \quad
x_0 = 0
\quad \text{and} \quad t = 0,\ldots,n
$$
The sequence of shocks $ {\\epsilon_t} $ is assumed to be iid and standard normal

Set $ n = 200 $ and $ \\alpha = 0.9 $

<a id='jbe-ex6'></a>

### Exercise 6

Plot three simulated time series, one for each of the cases $ \\alpha = 0 $, $ \\alpha = 0.8 $ and $ \\alpha = 0.98 $

(The figure will illustrate how time series with the same one-step-ahead conditional volatilities, as these three processes have, can have very different unconditional volatilities)

<a id='jbe-ex7'></a>

### Exercise 7

This exercise is more challenging

Take a random walk, starting from $ x_0 = 1 $

$$
x_{t+1} = \, \alpha \, x_t + \sigma\, \epsilon_{t+1}
\quad \text{where} \quad
x_0 = 1
\quad \text{and} \quad t = 0,\ldots,t_{\max}
$$
* Furthermore, assume that the $ x_{t_{\\max}} = 0 $  (i.e. at $ t_{\\max} $, the value drops to zero, regardless of its current state)
* The sequence of shocks $ {\\epsilon_t} $ is assumed to be iid and standard normal
* For a given path $ {x_t} $ define a **first-passage time** as $ T_a = \\min{t, |, x_t \\leq a} $, where by the assumption of the process $ T_a \\leq t_{\\max} $

Start with $ \\sigma = 0.2, \\alpha = 1.0 $

1. calculate the first-passage time, $ T_0 $, for 100 simulated random walks – to a $ t_{\\max} = 200 $ and plot a histogram
2. plot the sample mean of $ T_0 $ from the simulation for $ \\alpha \\in {0.8, 1.0, 1.2} $

<a id='jbe-ex8a'></a>

### Exercise 8(a)

This exercise is more challenging

The root of a univariate function $ f(\\cdot) $ is an $ x $ such that $ f(x) = 0 $

One solution method to find local roots of smooth functions is called Newton’s method

Starting with an $ x_0 $ guess, a function $ f(\\cdot) $ and the first-derivative $ f'(\\cdot) $, the algorithm is to repeat

$$
x^{n+1} = x^n - \frac{f(x^n)}{f'(x^n)}
$$
until $ | x^{n+1} - x^n| $ is below a tolerance

1. Use a variation of the `fixedpointmap` code to implement Newton’s method, where the function would accept arguments `f, f_prime, x_0, tolerance, maxiter`
2. Test it with $ f(x) = (x-1)^3 $ and another function of your choice where you can analytically find the derivative

### Exercise 8(b)

For those impatient to use more advanced features of Julia, implement a version of Exercise 8(a) where `f_prime` is calculated with auto-differentiation

```julia id=cb40726d-b7a4-46fd-825a-6686443a732b
using ForwardDiff

# operator to get the derivative of this function using AD
D(f) = x -> ForwardDiff.derivative(f, x)

# example usage: create a function and get the derivative
f(x) = x^2
f_prime = D(f)

f(0.1), f_prime(0.1)
```

1. Using the `D(f)` operator definition above, implement a version of Newton’s method that does not require the user to provide an analytical derivative
2. Test the sorts of `f` functions which can be automatically integrated by `ForwardDff.jl`

## Solutions

### Exercise 1

```julia id=6f5b1a88-13b2-411c-9b6e-038cd1b0b0c3
function factorial2(n)
    k = 1
    for i in 1:n
        k *= i  # or k = k * i
    end
    return k
end

factorial2(4)
```

```julia id=e0bf2a57-4f2b-4114-a35e-da05e74e6e8a
factorial2(4) == factorial(4) # built-in function
```

### Exercise 2

```julia id=d9e33d81-2463-4a03-872c-ee529516becb
function binomial_rv(n, p)
    count = 0
    U = rand(n)
    for i in 1:n
        if U[i] < p
            count += 1 # or count = count + 1
        end
    end
    return count
end

for j in 1:25
    b = binomial_rv(10, 0.5)
    print("$b, ")
end
```

### Exercise 3

Consider a circle with diameter 1 embedded in a unit square

Let $ A $ be its area and let $ r = 1/2 $ be its radius

If we know $ \\pi $ then we can compute $ A $ via

$ A = \\pi r^2 $

But the point here is to compute $ \\pi $, which we can do by

$$
 \pi = A / r^2 $

Summary: If we can estimate the area of the unit circle, then dividing
by $ r^2 = (1/2)^2 = 1/4 $ gives an estimate of $ \pi $

We estimate the area by sampling bivariate uniforms and looking at the
fraction that fall into the unit circle
$$
```julia id=a0541a40-df4e-467a-8158-4f8785a79285
n = 1000000
count = 0
for i in 1:n
    u, v = rand(2)
    d = sqrt((u - 0.5)^2 + (v - 0.5)^2)  # distance from middle of square
    if d < 0.5
        count += 1
    end
end

area_estimate = count / n

print(area_estimate * 4)  # dividing by radius**2
```

### Exercise 4

```julia id=0cd9ef9f-3bf7-4b22-8cc2-7972c4988c37
payoff = 0
count = 0

print("Count = ")

for i in 1:10
    U = rand()
    if U < 0.5
        count += 1
    else
        count = 0
    end
    print(count)
    if count == 3
        payoff = 1
    end
end
println("\npayoff = $payoff")
```

We can simplify this somewhat using the **ternary operator**. Here are some examples

```julia id=957fb59f-4b5f-413e-87ec-3608f62a1ebc
a = 1  < 2 ? "foo" : "bar"
```

```julia id=b20a0adc-1264-4d87-9f5b-1c756dde4cba
a = 1 > 2 ? "foo" : "bar"
```

Using this construction:

```julia id=71a3d401-04a0-4212-9ebf-c3d476b6958d
payoff = 0.0
count = 0.0

print("Count = ")

for i in 1:10
    U = rand()
    count = U < 0.5 ? count + 1 : 0
    print(count)
    if count == 3
        payoff = 1
    end
end
println("\npayoff = $payoff")
```

### Exercise 5

Here’s one solution

```julia id=9669d4b8-eefc-4736-b972-62fdf8f9af36
using Plots
gr(fmt=:png); # setting for easier display in jupyter notebooks
α = 0.9
n = 200
x = zeros(n + 1)

for t in 1:n
    x[t+1] = α * x[t] + randn()
end
plot(x)
```

### Exercise 6

```julia id=d812afbe-6292-49c5-a0d1-e1984177cd2e
αs = [0.0, 0.8, 0.98]
n = 200
p = plot() # naming a plot to add to

for α in αs
    x = zeros(n + 1)
    x[1] = 0.0
    for t in 1:n
        x[t+1] = α * x[t] + randn()
    end
    plot!(p, x, label = "alpha = $α") # add to plot p
end
p # display plot
```

### Exercise 7: Hint

As a hint, notice the following pattern for finding the number of draws of a uniform random number until it is below a given threshold

```julia id=0a3ca5e9-1cb1-418d-963e-cacf52308e3e
function drawsuntilthreshold(threshold; maxdraws=100)
    for i in 1:maxdraws
        val = rand()
        if val < threshold # checks threshold
            return i # leaves function, returning draw number
        end
    end
    return Inf # if here, reached maxdraws
end

draws = drawsuntilthreshold(0.2, maxdraws=100)
```

Additionally, it is sometimes convenient to add to just push numbers onto an array without indexing it directly

```julia id=846bcb9b-0155-4477-8ced-1553b1c69e0b
vals = zeros(0) # empty vector

for i in 1:100
    val = rand()
    if val < 0.5
        push!(vals, val)
    end
end
println("There were $(length(vals)) below 0.5")
```

[nextjournal#output#fc53e82f-3dea-403a-b08e-0c7e7a4c7ce3#result]:
<https://nextjournal.com/data/QmVg8ig9sNhxLfGUV1fuwMcNJ1cYdEZ73iP5S67evAygLQ?content-type=image/svg%2Bxml&node-id=fc53e82f-3dea-403a-b08e-0c7e7a4c7ce3&node-kind=output>

[nextjournal#output#e4722e71-df08-4c48-bada-2b5f11bf26c4#result]:
<https://nextjournal.com/data/QmbmavUYSoRgFqQgH66R2y51UEi75VuWdiZ9Kp1dtp1wKD?content-type=image/png&node-id=e4722e71-df08-4c48-bada-2b5f11bf26c4&node-kind=output>

[nextjournal#output#ccaea091-cd09-4d7b-bd36-20ca0ff907e5#result]:
<https://nextjournal.com/data/QmY4rEbhih38W9T6SLeNFmos6jzYjrwGyQjwz48FL5vG1M?content-type=image/png&node-id=ccaea091-cd09-4d7b-bd36-20ca0ff907e5&node-kind=output>

<details id="com.nextjournal.article">
<summary>This notebook was exported from <a href="https://nextjournal.com/a/Lc8in2aaX5aZewYYxTaFK?change-id=CYEvuXrhXQrGFMzZqnA6Mu">https://nextjournal.com/a/Lc8in2aaX5aZewYYxTaFK?change-id=CYEvuXrhXQrGFMzZqnA6Mu</a></summary>

```edn nextjournal-metadata
{:article
 {:settings nil,
  :nodes
  {"009b15e0-f15e-4a2b-a06b-512d7bc6b1a0"
   {:id "009b15e0-f15e-4a2b-a06b-512d7bc6b1a0",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "03ec923c-439f-4b15-8d65-3c11bfd9a6f0"
   {:id "03ec923c-439f-4b15-8d65-3c11bfd9a6f0",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "0a3ca5e9-1cb1-418d-963e-cacf52308e3e"
   {:id "0a3ca5e9-1cb1-418d-963e-cacf52308e3e",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "0cd9ef9f-3bf7-4b22-8cc2-7972c4988c37"
   {:id "0cd9ef9f-3bf7-4b22-8cc2-7972c4988c37",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "15e1c38b-26a0-405d-b7fc-38861a4c7a6b"
   {:id "15e1c38b-26a0-405d-b7fc-38861a4c7a6b",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "19911720-d595-494d-b1cb-30a026870e07"
   {:compute-ref #uuid "ba03f2e7-31f9-4e1b-9756-6acff1053bcc",
    :exec-duration 270,
    :id "19911720-d595-494d-b1cb-30a026870e07",
    :kind "code",
    :output-log-lines {:stdout 0},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "1aa782df-b390-4795-9f3b-61296a05a701"
   {:id "1aa782df-b390-4795-9f3b-61296a05a701",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "29ea9f10-804e-4e6e-ba6a-84464dacef5d"
   {:id "29ea9f10-804e-4e6e-ba6a-84464dacef5d",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "2cb36cae-6372-4f7a-8106-e1000dbd21c1"
   {:compute-ref #uuid "3acb91c8-96ba-4685-bce2-79e8da8525bb",
    :exec-duration 760,
    :id "2cb36cae-6372-4f7a-8106-e1000dbd21c1",
    :kind "code",
    :output-log-lines {:stdout 9},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "2ec40988-6752-42d4-b71d-eaf319738265"
   {:compute-ref #uuid "25d0600d-f44f-43f2-adff-30840f112282",
    :exec-duration 975,
    :id "2ec40988-6752-42d4-b71d-eaf319738265",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "329373dc-b5d0-4ee9-a60b-ccdc14b23208"
   {:compute-ref #uuid "ef44ddae-93d0-4461-a782-f5d768c1020e",
    :exec-duration 214,
    :id "329373dc-b5d0-4ee9-a60b-ccdc14b23208",
    :kind "code",
    :output-log-lines {:stdout 0},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "42fb1aa7-5fcc-400c-9aa2-7971b0f4d95e"
   {:compute-ref #uuid "13fa2950-b427-405b-83b9-10ec533b6b8b",
    :exec-duration 380,
    :id "42fb1aa7-5fcc-400c-9aa2-7971b0f4d95e",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "4da7f95a-b9a1-460d-87be-99b59c2315a6"
   {:id "4da7f95a-b9a1-460d-87be-99b59c2315a6",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "6576f483-07a5-47f4-b2f2-8f853faa5f36"
   {:compute-ref #uuid "f2ffe52f-c26d-4e50-b44c-cc508b91e33e",
    :exec-duration 251,
    :id "6576f483-07a5-47f4-b2f2-8f853faa5f36",
    :kind "code",
    :output-log-lines {:stdout 0},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "6f5b1a88-13b2-411c-9b6e-038cd1b0b0c3"
   {:id "6f5b1a88-13b2-411c-9b6e-038cd1b0b0c3",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "71a3d401-04a0-4212-9ebf-c3d476b6958d"
   {:id "71a3d401-04a0-4212-9ebf-c3d476b6958d",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "76edc574-1b5f-4f74-9873-53dd5b5c41ef"
   {:id "76edc574-1b5f-4f74-9873-53dd5b5c41ef",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "7a4186bd-44dc-4995-a633-109f1caf311b"
   {:compute-ref #uuid "b6ab408e-5e59-45b4-9857-6309c8a1f56d",
    :exec-duration 683,
    :id "7a4186bd-44dc-4995-a633-109f1caf311b",
    :kind "code",
    :output-log-lines {:stdout 0},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "7badb605-f5db-467e-bbb4-3086f0498b91"
   {:compute-ref #uuid "6c73f100-cf50-48cb-98c9-ff08a474d961",
    :exec-duration 250,
    :id "7badb605-f5db-467e-bbb4-3086f0498b91",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "7fc1df70-3bfc-495a-bcae-71cdeaf85ef1"
   {:compute-ref #uuid "d6f281ad-da40-4ec9-a7b9-93115ee75115",
    :exec-duration 1054,
    :id "7fc1df70-3bfc-495a-bcae-71cdeaf85ef1",
    :kind "code",
    :output-log-lines {:stdout 0},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "846bcb9b-0155-4477-8ced-1553b1c69e0b"
   {:id "846bcb9b-0155-4477-8ced-1553b1c69e0b",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "8852efc4-916e-4394-acdc-b6bd65ac5a3c"
   {:id "8852efc4-916e-4394-acdc-b6bd65ac5a3c",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "957fb59f-4b5f-413e-87ec-3608f62a1ebc"
   {:id "957fb59f-4b5f-413e-87ec-3608f62a1ebc",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "9669d4b8-eefc-4736-b972-62fdf8f9af36"
   {:id "9669d4b8-eefc-4736-b972-62fdf8f9af36",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "9887fef8-bf55-430c-b329-8753e4261716"
   {:compute-ref #uuid "6291d075-c8f7-4798-aec2-11ac0d0b9b87",
    :exec-duration 1080,
    :id "9887fef8-bf55-430c-b329-8753e4261716",
    :kind "code",
    :output-log-lines {:stdout 0},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "9b145b3c-f641-46ea-a986-83e379036d6f"
   {:compute-ref #uuid "a6636216-6406-4983-bfba-5b09dc1cca8b",
    :exec-duration 101,
    :id "9b145b3c-f641-46ea-a986-83e379036d6f",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "a0541a40-df4e-467a-8158-4f8785a79285"
   {:id "a0541a40-df4e-467a-8158-4f8785a79285",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "b20a0adc-1264-4d87-9f5b-1c756dde4cba"
   {:id "b20a0adc-1264-4d87-9f5b-1c756dde4cba",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "bb41a918-d0ec-46fc-8739-0fc1f4011e28"
   {:environment
    [:environment
     {:article/nextjournal.id
      #uuid "02bcc891-c0ec-4348-a5c4-379723fc0bb3",
      :change/nextjournal.id
      #uuid "5d7123f5-c596-4e55-b01a-4bb8f3d83ea6",
      :node/id "2a19b38e-19d4-4efc-a261-4375dc68c88f"}],
    :id "bb41a918-d0ec-46fc-8739-0fc1f4011e28",
    :kind "runtime",
    :language "julia",
    :type :jupyter},
   "cb40726d-b7a4-46fd-825a-6686443a732b"
   {:id "cb40726d-b7a4-46fd-825a-6686443a732b",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "ccaea091-cd09-4d7b-bd36-20ca0ff907e5"
   {:compute-ref #uuid "d6e6d9ad-f728-4a9a-9878-50c86a57109e",
    :exec-duration 2193,
    :id "ccaea091-cd09-4d7b-bd36-20ca0ff907e5",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "d3b86791-e495-4580-b653-4525a50a44fd"
   {:id "d3b86791-e495-4580-b653-4525a50a44fd",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "d4d4988c-de1f-4d4f-a51d-1636e3177dba"
   {:compute-ref #uuid "6f2df61c-ab2f-4a9c-a27d-a3bd4ca23fa5",
    :exec-duration 48,
    :id "d4d4988c-de1f-4d4f-a51d-1636e3177dba",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "d6d8d20f-9331-4b28-9179-6226b9ad3460"
   {:id "d6d8d20f-9331-4b28-9179-6226b9ad3460",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "d812afbe-6292-49c5-a0d1-e1984177cd2e"
   {:id "d812afbe-6292-49c5-a0d1-e1984177cd2e",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "d9e33d81-2463-4a03-872c-ee529516becb"
   {:id "d9e33d81-2463-4a03-872c-ee529516becb",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "e0bf2a57-4f2b-4114-a35e-da05e74e6e8a"
   {:id "e0bf2a57-4f2b-4114-a35e-da05e74e6e8a",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "e4722e71-df08-4c48-bada-2b5f11bf26c4"
   {:compute-ref #uuid "0b8d3489-b663-4edf-8c6d-e92677e63bcc",
    :exec-duration 1251,
    :id "e4722e71-df08-4c48-bada-2b5f11bf26c4",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "e636dbba-2b5c-4e21-9676-02a109f20c55"
   {:id "e636dbba-2b5c-4e21-9676-02a109f20c55",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "ee254118-0b86-47b6-bc4a-b78aed6e9ecd"
   {:compute-ref #uuid "4c07c53f-b7be-4505-8dde-a5fab39921e4",
    :exec-duration 353,
    :id "ee254118-0b86-47b6-bc4a-b78aed6e9ecd",
    :kind "code",
    :output-log-lines {:stdout 0},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "f822c364-e3f8-4643-b3b6-28d5ad980d04"
   {:compute-ref #uuid "541203d0-9554-4181-8e1b-8539e8d25a7e",
    :exec-duration 232,
    :id "f822c364-e3f8-4643-b3b6-28d5ad980d04",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "fc53e82f-3dea-403a-b08e-0c7e7a4c7ce3"
   {:compute-ref #uuid "60fb7ce1-1706-47e2-8397-17d596d9a686",
    :exec-duration 34788,
    :id "fc53e82f-3dea-403a-b08e-0c7e7a4c7ce3",
    :kind "code",
    :output-log-lines {:stdout 7},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "fcc54b16-5f87-49b7-bf3b-d1e15881d09f"
   {:id "fcc54b16-5f87-49b7-bf3b-d1e15881d09f",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "fd479ccb-b5a0-4d42-8190-c584295586e0"
   {:compute-ref #uuid "06fadf31-8cca-488c-bc00-5496422c8059",
    :exec-duration 756,
    :id "fd479ccb-b5a0-4d42-8190-c584295586e0",
    :kind "code",
    :output-log-lines {},
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "fe2ba4c9-6987-43aa-8a56-dbcb57b1ca85"
   {:id "fe2ba4c9-6987-43aa-8a56-dbcb57b1ca85",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]},
   "fe8de70d-aeea-4e5c-9f4d-8df749b7f691"
   {:id "fe8de70d-aeea-4e5c-9f4d-8df749b7f691",
    :kind "code",
    :runtime [:runtime "bb41a918-d0ec-46fc-8739-0fc1f4011e28"]}},
  :nextjournal/id #uuid "02bcc87e-4e6d-46bd-8cb4-e95f99d4eb82",
  :article/change
  {:nextjournal/id #uuid "5d712a9b-5dcd-4123-ad21-da1349ac7e28"}}}

```
</details>
