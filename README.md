# SymmetricProducts.jl

<!-- Tidyverse lifecycle badges, see https://www.tidyverse.org/lifecycle/ Uncomment or delete as needed. -->
![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![build](https://github.com/tpapp/SymmetricProducts.jl/workflows/CI/badge.svg)](https://github.com/tpapp/SymmetricProducts.jl/actions?query=workflow%3ACI)
<!-- Coverage badge on codecov.io, which is used by default. -->
[![codecov.io](http://codecov.io/github/tpapp/SymmetricProducts.jl/coverage.svg?branch=master)](http://codecov.io/github/tpapp/SymmetricProducts.jl?branch=master)

Wrap a matrix multiplied by its transpose in the narrowest type.

## Installation

This package is not (yet) registered, and **requires Julia v1.0**. Install with
```julia
pkg> add https://github.com/tpapp/SymmetricProducts.jl
```

## Usage

A single constant `SELF`, which acts as a placeholder for the other argument in binary operations with adjoints, eg

```julia
SELF'*A
```
produces `Symmetric(A'*A)` when `A` as `Real` elements.
