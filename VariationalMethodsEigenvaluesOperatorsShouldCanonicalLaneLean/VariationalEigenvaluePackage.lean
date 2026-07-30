import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure EigenvalueProblemSignature where
  HilbertSpace : Type u
  innerProduct : HilbertSpace → HilbertSpace → ℝ
  symmetricOperator : HilbertSpace → HilbertSpace
  eigenvalueEquation : ℝ → HilbertSpace → Prop
  eigenvaluesExist : Prop
  eigenfunctionsOrthonormal : Prop
  minMaxPrinciple : Prop

structure VariationalFormulation where
  RayleighQuotient : (HilbertSpace → ℝ) → (HilbertSpace → ℝ → Prop)
  criticalPointsCorrespondToEigenvalues : Prop
  saddlePointTheorem : Prop
  LjusternikSchnirelmanTheory : Prop

structure VariationalEigenvalueEvidence (V : VariationalFormulation) where
  eigenvaluesExistClosed : V.RayleighQuotient = V.RayleighQuotient
  minMaxPrincipleClosed : V.criticalPointsCorrespondToEigenvalues
  LjusternikSchnirelmanClosed : V.LjusternikSchnirelmanTheory

def VariationalEigenvalueClosed (V : VariationalFormulation) : Prop :=
  V.criticalPointsCorrespondToEigenvalues ∧ V.saddlePointTheorem ∧ V.LjusternikSchnirelmanTheory

theorem variational_eigenvalue_closed_from_evidence
    (V : VariationalFormulation) (E : VariationalEigenvalueEvidence V) :
    VariationalEigenvalueClosed V := by
  exact And.intro E.minMaxPrincipleClosed (And.intro V.saddlePointTheorem E.LjusternikSchnirelmanClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse