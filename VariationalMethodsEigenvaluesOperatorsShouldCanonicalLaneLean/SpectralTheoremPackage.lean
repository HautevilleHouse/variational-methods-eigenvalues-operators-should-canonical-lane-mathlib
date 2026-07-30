import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure SpectralTheoremPackage {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H] where
  operator : H →ₗ[ℝ] H
  symmetric : Prop
  compact : Prop
  eigenvalues : Set ℝ
  eigenfunctions : ℝ → Set H
  spectrum : Set ℝ

structure SpectralTheoremEvidence {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (S : SpectralTheoremPackage H) where
  symmetricClosed : S.symmetric
  compactClosed : S.compact
  eigenvaluesNonempty : S.eigenvalues.Nonempty
  eigenfunctionsOrthonormal : ∀ λ ∈ S.eigenvalues, (S.eigenfunctions λ).Pairwise fun u v => ⟪u, v⟫ = 0
  spectralDecompositionClosed : ∀ x : H, x = ∑' λ ∈ S.eigenvalues, (∑ u ∈ S.eigenfunctions λ, ⟪x, u⟫ • u)

def SpectralTheoremClosed {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (S : SpectralTheoremPackage H) : Prop :=
  S.symmetric ∧ S.compact ∧ S.eigenvalues.Nonempty ∧
  (∀ λ ∈ S.eigenvalues, (S.eigenfunctions λ).Pairwise fun u v => ⟪u, v⟫ = 0) ∧
  (∀ x : H, x = ∑' λ ∈ S.eigenvalues, (∑ u ∈ S.eigenfunctions λ, ⟪x, u⟫ • u))

theorem spectral_theorem_closed_from_evidence {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    (S : SpectralTheoremPackage H) (Ev : SpectralTheoremEvidence S) : SpectralTheoremClosed S :=
  And.intro Ev.symmetricClosed (And.intro Ev.compactClosed (And.intro Ev.eigenvaluesNonempty (And.intro Ev.eigenfunctionsOrthonormal Ev.spectralDecompositionClosed)))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse