import canonicalLaneMathlib.AdmissibleClass

/-!
# Self-Adjoint Operator Package
-/

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure SelfAdjointOperatorPackage (H : HilbertSpacePackage) where
  operator : H.space → H.space
  linear : Prop
  bounded : Prop
  symmetric : Prop
  denselyDefined : Prop

structure SelfAdjointOperatorEvidence {H : HilbertSpacePackage}
    (O : SelfAdjointOperatorPackage H) where
  linearClosed : O.linear
  boundedClosed : O.bounded
  symmetricClosed : O.symmetric
  denselyDefinedClosed : O.denselyDefined

def SelfAdjointOperatorClosed {H : HilbertSpacePackage}
    (O : SelfAdjointOperatorPackage H) : Prop :=
  O.linear ∧ O.bounded ∧ O.symmetric ∧ O.denselyDefined

theorem self_adjoint_operator_closed_from_evidence
    {H : HilbertSpacePackage} (O : SelfAdjointOperatorPackage H)
    (E : SelfAdjointOperatorEvidence O) : SelfAdjointOperatorClosed O := by
  exact And.intro E.linearClosed
    (And.intro E.boundedClosed
      (And.intro E.symmetricClosed E.denselyDefinedClosed))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse