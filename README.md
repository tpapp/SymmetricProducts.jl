# SymmetricProducts.jl

![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
[![build](https://github.com/tpapp/SymmetricProducts.jl/workflows/CI/badge.svg)](https://github.com/tpapp/SymmetricProducts.jl/actions?query=workflow%3ACI)
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
