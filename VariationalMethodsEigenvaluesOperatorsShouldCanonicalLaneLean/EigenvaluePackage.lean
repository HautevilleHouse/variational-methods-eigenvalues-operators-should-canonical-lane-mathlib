import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure EigenvaluePackage where
  operator : Type u
  eigenvalue : Type v
  eigenfunction : Type w
  selfAdjoint : Prop
  discreteSpectrum : Prop
  variationalCharacterization : Prop
  rayleighQuotient : Prop

structure EigenvalueEvidence (P : EigenvaluePackage) where
  selfAdjointClosed : P.selfAdjoint
  discreteSpectrumClosed : P.discreteSpectrum
  variationalCharacterizationClosed : P.variationalCharacterization
  rayleighQuotientClosed : P.rayleighQuotient

def EigenvaluePackageClosed (P : EigenvaluePackage) : Prop :=
  P.selfAdjoint ∧ P.discreteSpectrum ∧ P.variationalCharacterization ∧ P.rayleighQuotient

theorem eigenvalue_package_closed_from_evidence (P : EigenvaluePackage)
    (E : EigenvalueEvidence P) : EigenvaluePackageClosed P := by
  exact And.intro E.selfAdjointClosed
    (And.intro E.discreteSpectrumClosed
      (And.intro E.variationalCharacterizationClosed E.rayleighQuotientClosed))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse