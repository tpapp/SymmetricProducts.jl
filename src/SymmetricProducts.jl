module SymmetricProducts

using LinearAlgebra: Adjoint, Diagonal, Hermitian, Symmetric

export symprod

"""
    symprod(A)

Calculates `A*A'`, wrapping the result in the narrowest type.
"""
symprod(A::AbstractMatrix{<: Real}) = Symmetric(A*A')

symprod(A::AbstractMatrix{<: Complex}) = Hermitian(A*A')

symprod(v::AbstractVector{<: Real}) = Symmetric(v*v')

symprod(v::AbstractVector{<: Complex}) = Hermitian(v*v')

symprod(D::Diagonal) = Diagonal(abs2.(parent(D)))

symprod(D::Adjoint{<: Diagonal}) = symprod(parent(D))

symprod(v::Adjoint{T, Vector{T}}) where T = sum(abs2, v)

end # module
