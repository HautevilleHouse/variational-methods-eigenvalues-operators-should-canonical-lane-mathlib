import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure VariationalEigenvalueClosurePackage where
  eulerLagrange : ∀ {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X], EulerLagrangePackage X
  spectralTheorem : ∀ {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H], SpectralTheoremPackage H
  minimaxPrinciple : ∀ {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H], MinimaxPrinciplePackage H
  sturmLiouville : ∀ {a b : ℝ} (h : a < b), SturmLiouvillePackage h
  laplacianEigenvalue : ∀ {Ω : Type} [NormedAddCommGroup Ω] [InnerProductSpace ℝ Ω] [CompleteSpace Ω], LaplacianEigenvaluePackage Ω
  fredholmOperator : ∀ {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace X] [CompleteSpace Y], FredholmOperatorPackage X Y
  allClosed : Prop

structure VariationalEigenvalueClosureEvidence (V : VariationalEigenvalueClosurePackage) where
  eulerLagrangeClosed : ∀ {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X], EulerLagrangeClosed (V.eulerLagrange (X := X))
  spectralTheoremClosed : ∀ {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H], SpectralTheoremClosed (V.spectralTheorem (H := H))
  minimaxPrincipleClosed : ∀ {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H], MinimaxPrincipleClosed (V.minimaxPrinciple (H := H))
  sturmLiouvilleClosed : ∀ {a b : ℝ} (h : a < b), SturmLiouvilleClosed (V.sturmLiouville h)
  laplacianEigenvalueClosed : ∀ {Ω : Type} [NormedAddCommGroup Ω] [InnerProductSpace ℝ Ω] [CompleteSpace Ω], LaplacianEigenvalueClosed (V.laplacianEigenvalue (Ω := Ω))
  fredholmOperatorClosed : ∀ {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace X] [CompleteSpace Y], FredholmOperatorClosed (V.fredholmOperator (X := X) (Y := Y))

def VariationalEigenvalueClosureClosed (V : VariationalEigenvalueClosurePackage) : Prop :=
  (∀ {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X], EulerLagrangeClosed (V.eulerLagrange (X := X))) ∧
  (∀ {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H], SpectralTheoremClosed (V.spectralTheorem (H := H))) ∧
  (∀ {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H], MinimaxPrincipleClosed (V.minimaxPrinciple (H := H))) ∧
  (∀ {a b : ℝ} (h : a < b), SturmLiouvilleClosed (V.sturmLiouville h)) ∧
  (∀ {Ω : Type} [NormedAddCommGroup Ω] [InnerProductSpace ℝ Ω] [CompleteSpace Ω], LaplacianEigenvalueClosed (V.laplacianEigenvalue (Ω := Ω))) ∧
  (∀ {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace X] [CompleteSpace Y], FredholmOperatorClosed (V.fredholmOperator (X := X) (Y := Y)))

theorem variational_eigenvalue_closure_closed_from_evidence (V : VariationalEigenvalueClosurePackage) (Ev : VariationalEigenvalueClosureEvidence V) : VariationalEigenvalueClosureClosed V :=
  And.intro Ev.eulerLagrangeClosed (And.intro Ev.spectralTheoremClosed (And.intro Ev.minimaxPrincipleClosed (And.intro Ev.sturmLiouvilleClosed (And.intro Ev.laplacianEigenvalueClosed Ev.fredholmOperatorClosed))))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse