import canonicalLaneMathlib.AdmissibleClass

/-!
# Hilbert Space Package
-/

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure HilbertSpacePackage where
  space : Type u
  innerProduct : space → space → ℝ
  normDefined : Prop
  completeness : Prop
  separable : Prop

structure HilbertSpaceEvidence (H : HilbertSpacePackage) where
  normDefinedClosed : H.normDefined
  completenessClosed : H.completeness
  separableClosed : H.separable

def HilbertSpaceClosed (H : HilbertSpacePackage) : Prop :=
  H.normDefined ∧ H.completeness ∧ H.separable

theorem hilbert_space_closed_from_evidence
    (H : HilbertSpacePackage) (E : HilbertSpaceEvidence H) :
    HilbertSpaceClosed H := by
  exact And.intro E.normDefinedClosed
    (And.intro E.completenessClosed E.separableClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse