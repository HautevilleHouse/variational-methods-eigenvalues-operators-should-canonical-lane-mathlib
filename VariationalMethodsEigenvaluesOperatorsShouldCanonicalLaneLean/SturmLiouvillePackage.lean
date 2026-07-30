import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure SturmLiouvillePackage {a b : ℝ} (h : a < b) where
  p : ℝ → ℝ
  q : ℝ → ℝ
  w : ℝ → ℝ
  operator : C^∞([a,b]) → C^∞([a,b])
  boundaryConditions : (C^∞([a,b]) → Prop) × (C^∞([a,b]) → Prop)
  eigenvalues : ℕ → ℝ
  eigenfunctions : ℕ → C^∞([a,b])

structure SturmLiouvilleEvidence {a b : ℝ} {h : a < b} (S : SturmLiouvillePackage h) where
  operatorFormula : ∀ f : C^∞([a,b]), S.operator f = - (S.p • derivative f)' + S.q • f
  posWeight : ∀ x ∈ Set.Ioo a b, S.w x > 0
  posP : ∀ x ∈ Set.Ioo a b, S.p x > 0
  boundaryConditionsSatisfied : ∀ n : ℕ, (S.boundaryConditions.1 (S.eigenfunctions n)) ∧ (S.boundaryConditions.2 (S.eigenfunctions n))
  eigenvalueEquation : ∀ n : ℕ, S.operator (S.eigenfunctions n) = S.eigenvalues n • (S.w • S.eigenfunctions n)

def SturmLiouvilleClosed {a b : ℝ} {h : a < b} (S : SturmLiouvillePackage h) : Prop :=
  (∀ f : C^∞([a,b]), S.operator f = - (S.p • derivative f)' + S.q • f) ∧
  (∀ x ∈ Set.Ioo a b, S.w x > 0) ∧ (∀ x ∈ Set.Ioo a b, S.p x > 0) ∧
  (∀ n : ℕ, (S.boundaryConditions.1 (S.eigenfunctions n)) ∧ (S.boundaryConditions.2 (S.eigenfunctions n))) ∧
  (∀ n : ℕ, S.operator (S.eigenfunctions n) = S.eigenvalues n • (S.w • S.eigenfunctions n))

theorem sturm_liouville_closed_from_evidence {a b : ℝ} {h : a < b} (S : SturmLiouvillePackage h) (Ev : SturmLiouvilleEvidence S) : SturmLiouvilleClosed S :=
  And.intro Ev.operatorFormula (And.intro Ev.posWeight (And.intro Ev.posP (And.intro Ev.boundaryConditionsSatisfied Ev.eigenvalueEquation)))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse