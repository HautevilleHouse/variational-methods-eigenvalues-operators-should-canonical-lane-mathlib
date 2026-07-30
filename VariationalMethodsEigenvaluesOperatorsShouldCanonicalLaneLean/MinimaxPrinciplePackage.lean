import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure MinimaxPrinciplePackage {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H] where
  operator : H →ₗ[ℝ] H
  symmetric : Prop
  RayleighQuotient : H \ {0} → ℝ
  eigenvalues : ℕ → ℝ
  minimaxCharacterization : ℕ → Prop

structure MinimaxPrincipleEvidence {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (M : MinimaxPrinciplePackage H) where
  symmetricClosed : M.symmetric
  rayleighQuotientDefined : ∀ x : H \ {0}, M.RayleighQuotient x = ⟪M.operator x, x⟫ / ⟪x, x⟫
  eigenvaluesAscending : ∀ n : ℕ, M.eigenvalues n ≤ M.eigenvalues (n+1)
  minimaxClosed : ∀ n : ℕ, M.minimaxCharacterization n
  equalityHolds : ∀ n : ℕ, M.eigenvalues n = min_{V : Subspace H, dim V = n+1} max_{x ∈ V \ {0}} M.RayleighQuotient x

def MinimaxPrincipleClosed {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (M : MinimaxPrinciplePackage H) : Prop :=
  M.symmetric ∧
  (∀ x : H \ {0}, M.RayleighQuotient x = ⟪M.operator x, x⟫ / ⟪x, x⟫) ∧
  (∀ n : ℕ, M.eigenvalues n ≤ M.eigenvalues (n+1)) ∧
  (∀ n : ℕ, M.minimaxCharacterization n) ∧
  (∀ n : ℕ, M.eigenvalues n = min_{V : Subspace H, dim V = n+1} max_{x ∈ V \ {0}} M.RayleighQuotient x)

theorem minimax_principle_closed_from_evidence {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (M : MinimaxPrinciplePackage H) (Ev : MinimaxPrincipleEvidence M) : MinimaxPrincipleClosed M :=
  And.intro Ev.symmetricClosed (And.intro Ev.rayleighQuotientDefined (And.intro Ev.eigenvaluesAscending (And.intro Ev.minimaxClosed Ev.equalityHolds)))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse