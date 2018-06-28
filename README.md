# SymmetricProducts

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
[![Build Status](https://travis-ci.org/tpapp/SymmetricProducts.jl.svg?branch=master)](https://travis-ci.org/tpapp/SymmetricProducts.jl)
[![Coverage Status](https://coveralls.io/repos/tpapp/SymmetricProducts.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/tpapp/SymmetricProducts.jl?branch=master)
[![codecov.io](http://codecov.io/github/tpapp/SymmetricProducts.jl/coverage.svg?branch=master)](http://codecov.io/github/tpapp/SymmetricProducts.jl?branch=master)

Wrap a matrix multiplied by its transpose in the narrowest type.

## Installation

This package is not (yet) registered, and **requires Julia v0.7**. Install with
```julia
pkg> add https://github.com/tpapp/SymmetricProducts.jl
```

## Usage

A single function `symprod` is exported. `symprod(A)` calculates `A*A'`, wrapping in the narrowest type.

```julia
julia> using SymmetricProducts

julia> symprod([1 2; 3 4])
2×2 LinearAlgebra.Symmetric{Int64,Array{Int64,2}}:
  5  11
 11  25

julia> symprod([1.0+2.0im 0; 3.0 4.0])
2×2 Hermitian{Complex{Float64},Array{Complex{Float64},2}}:
 5.0+0.0im   3.0+6.0im
 3.0-6.0im  25.0+0.0im

julia> symprod([1, 2])
2×2 LinearAlgebra.Symmetric{Int64,Array{Int64,2}}:
 1  2
 2  4

julia> symprod([1, 2]')
5

julia> symprod(Diagonal([1, 2]))
2×2 Diagonal{Int64,Array{Int64,1}}:
 1  ⋅
 ⋅  4

julia> symprod(Diagonal([1+2im, 2])')
2×2 Diagonal{Int64,Array{Int64,1}}:
 5  ⋅
 ⋅  4
```
