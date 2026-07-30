import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure LaplacianEigenvaluePackage {Ω : Type} [NormedAddCommGroup Ω] [InnerProductSpace ℝ Ω] [CompleteSpace Ω] where
  domain : Ω
  laplacian : (C^∞(Ω) → C^∞(Ω))
  boundaryCondition : (C^∞(Ω) → Prop)
  eigenvalues : ℕ → ℝ
  eigenfunctions : ℕ → C^∞(Ω)
  spectralGap : ℝ

structure LaplacianEigenvalueEvidence {Ω : Type} [NormedAddCommGroup Ω] [InnerProductSpace ℝ Ω] [CompleteSpace Ω]
    (L : LaplacianEigenvaluePackage Ω) where
  laplacianDefined : ∀ f : C^∞(Ω), L.laplacian f = Δ f
  boundaryConditionClosed : ∀ f : C^∞(Ω), L.boundaryCondition f ↔ f |_∂Ω = 0
  eigenvaluesAscending : ∀ n : ℕ, L.eigenvalues n ≤ L.eigenvalues (n+1)
  eigenfunctionsOrthonormal : ∀ m n : ℕ, m ≠ n → ∫_Ω (L.eigenfunctions m) * (L.eigenfunctions n) dvol = 0
  spectralGapPos : L.spectralGap > 0
  eigenvalueEquation : ∀ n : ℕ, L.laplacian (L.eigenfunctions n) = L.eigenvalues n • (L.eigenfunctions n)

def LaplacianEigenvalueClosed {Ω : Type} [NormedAddCommGroup Ω] [InnerProductSpace ℝ Ω] [CompleteSpace Ω]
    (L : LaplacianEigenvaluePackage Ω) : Prop :=
  (∀ f : C^∞(Ω), L.laplacian f = Δ f) ∧
  (∀ f : C^∞(Ω), L.boundaryCondition f ↔ f |_∂Ω = 0) ∧
  (∀ n : ℕ, L.eigenvalues n ≤ L.eigenvalues (n+1)) ∧
  (∀ m n : ℕ, m ≠ n → ∫_Ω (L.eigenfunctions m) * (L.eigenfunctions n) dvol = 0) ∧
  L.spectralGap > 0 ∧
  (∀ n : ℕ, L.laplacian (L.eigenfunctions n) = L.eigenvalues n • (L.eigenfunctions n))

theorem laplacian_eigenvalue_closed_from_evidence {Ω : Type} [NormedAddCommGroup Ω] [InnerProductSpace ℝ Ω] [CompleteSpace Ω]
    (L : LaplacianEigenvaluePackage Ω) (Ev : LaplacianEigenvalueEvidence L) : LaplacianEigenvalueClosed L :=
  And.intro Ev.laplacianDefined (And.intro Ev.boundaryConditionClosed (And.intro Ev.eigenvaluesAscending (And.intro Ev.eigenfunctionsOrthonormal (And.intro Ev.spectralGapPos Ev.eigenvalueEquation))))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse