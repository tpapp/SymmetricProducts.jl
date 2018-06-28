using SymmetricProducts
using Test

using LinearAlgebra: Diagonal, Hermitian, Symmetric

function test_symprod(A, ::Type{T}) where T
    AA′ = symprod(A)
    @test AA′ == A*A'
    @test AA′ isa T
end

reals(dims...) = collect(reshape(range(1.0; length = prod(dims)), dims))

cplxs(dims...) =
    collect(reshape([Complex(Float64(i), i^2) for i in 1:prod(dims)], dims))

test_symprod(reals(3,3), Symmetric{Float64})
test_symprod(reals(3,3)', Symmetric{Float64})
test_symprod(reals(3), Symmetric{Float64})
test_symprod(Diagonal(reals(3)), Diagonal{Float64})
test_symprod(Diagonal(reals(3))', Diagonal{Float64})
test_symprod(reals(3)', Float64)

test_symprod(cplxs(3,3), Hermitian{Complex{Float64}})
test_symprod(cplxs(3,3)', Hermitian{Complex{Float64}})
test_symprod(cplxs(3), Hermitian{Complex{Float64}})
test_symprod(Diagonal(cplxs(3)), Diagonal{Float64})
test_symprod(Diagonal(cplxs(3))', Diagonal{Float64})
test_symprod(cplxs(3)', Float64)
