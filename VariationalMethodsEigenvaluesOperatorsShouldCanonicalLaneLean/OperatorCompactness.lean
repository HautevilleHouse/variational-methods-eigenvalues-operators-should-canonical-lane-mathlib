import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure OperatorCompactnessPackage {P : VariationalEigenvaluePackage} where
  resolventCompactness : Prop
  eigenfunctionCompleteness : Prop
  discreteSpectrum : Prop

structure OperatorCompactnessEvidence {P : VariationalEigenvaluePackage}
    (C : OperatorCompactnessPackage P) where
  resolventCompactnessClosed : C.resolventCompactness
  eigenfunctionCompletenessClosed : C.eigenfunctionCompleteness
  discreteSpectrumClosed : C.discreteSpectrum

def OperatorCompactnessClosed {P : VariationalEigenvaluePackage}
    (C : OperatorCompactnessPackage P) : Prop :=
  C.resolventCompactness ∧ C.eigenfunctionCompleteness ∧ C.discreteSpectrum

theorem operator_compactness_closed_from_evidence {P : VariationalEigenvaluePackage}
    (C : OperatorCompactnessPackage P) (E : OperatorCompactnessEvidence C) :
    OperatorCompactnessClosed C := by
  exact And.intro E.resolventCompactnessClosed
    (And.intro E.eigenfunctionCompletenessClosed E.discreteSpectrumClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse