"""
Multiply a matrix with its own adjoint, obtaining a symmetric/hermitian result where
relevant.

The only exported symbol is [`SELF`](@ref), use eg `SELF' * A`.
"""
module SymmetricProducts

using LinearAlgebra: Diagonal, Hermitian, Symmetric

import Base: show
import LinearAlgebra: adjoint, *

export SELF

struct Self end

"""
A placeholder for the other argument in a binary operation.

Only a few methods are supported, typically for the adjoint `SELF'`, where the
result is special.

# Examples

`SELF'*A` is equivalent to `A'*A`, except for producing a symmetric matrix.
"""
const SELF = Self()

show(io::IO, ::Self) = print(io, "SELF")

struct SelfAdjoint end

show(io::IO, ::SelfAdjoint) = print(io, "SELF'")

adjoint(::Self) = SelfAdjoint()

# matrices (general)

*(A::AbstractMatrix{<: Real}, ::SelfAdjoint) = Symmetric(A*A')

*(::SelfAdjoint, A::AbstractMatrix{<: Real}) = Symmetric(A'*A)

*(A::AbstractMatrix{<: Complex}, ::SelfAdjoint) = Hermitian(A*A')

*(::SelfAdjoint, A::AbstractMatrix{<: Complex}) = Hermitian(A'*A)

# matrices (special)

*(D::Diagonal, ::SelfAdjoint) = Diagonal(abs2.(parent(D)))

*(::SelfAdjoint, D::Diagonal) = D*SELF'

# vectors

*(v::AbstractVector{<: Real}, ::SelfAdjoint) = Symmetric(v*v')

*(v::AbstractVector{<: Complex}, ::SelfAdjoint) = Hermitian(v*v')

*(::SelfAdjoint, v::AbstractVector) = sum(abs2, v)

end # module
