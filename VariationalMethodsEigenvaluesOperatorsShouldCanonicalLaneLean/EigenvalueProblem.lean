import canonicalLaneMathlib.AdmissibleClass

/-!
# Eigenvalue Problem Package
-/

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure EigenvalueProblemPackage {H : HilbertSpacePackage}
    {O : SelfAdjointOperatorPackage H} where
  variationalCharacterization : Prop
  minMaxPrinciple : Prop
  spectralGapEstimate : Prop
  eigenfunctionRegularity : Prop

structure EigenvalueProblemEvidence {H : HilbertSpacePackage}
    {O : SelfAdjointOperatorPackage H}
    (P : EigenvalueProblemPackage H O) where
  variationalCharacterizationClosed : P.variationalCharacterization
  minMaxPrincipleClosed : P.minMaxPrinciple
  spectralGapEstimateClosed : P.spectralGapEstimate
  eigenfunctionRegularityClosed : P.eigenfunctionRegularity

def EigenvalueProblemClosed {H : HilbertSpacePackage}
    {O : SelfAdjointOperatorPackage H}
    (P : EigenvalueProblemPackage H O) : Prop :=
  P.variationalCharacterization ∧ P.minMaxPrinciple ∧
  P.spectralGapEstimate ∧ P.eigenfunctionRegularity

theorem eigenvalue_problem_closed_from_evidence
    {H : HilbertSpacePackage} {O : SelfAdjointOperatorPackage H}
    (P : EigenvalueProblemPackage H O) (E : EigenvalueProblemEvidence P) :
    EigenvalueProblemClosed P := by
  exact And.intro E.variationalCharacterizationClosed
    (And.intro E.minMaxPrincipleClosed
      (And.intro E.spectralGapEstimateClosed E.eigenfunctionRegularityClosed))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse