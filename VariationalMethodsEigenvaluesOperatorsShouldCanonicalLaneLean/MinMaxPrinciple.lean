import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure MinMaxPrinciplePackage where
  operator : Type u
  eigenvalues : Type v
  rayleighQuotientBounded : Prop
  minMaxCharacterization : Prop
  courantFischer : Prop

structure MinMaxPrincipleEvidence (P : MinMaxPrinciplePackage) where
  rayleighQuotientBoundedClosed : P.rayleighQuotientBounded
  minMaxCharacterizationClosed : P.minMaxCharacterization
  courantFischerClosed : P.courantFischer

def MinMaxPrincipleClosed (P : MinMaxPrinciplePackage) : Prop :=
  P.rayleighQuotientBounded ∧ P.minMaxCharacterization ∧ P.courantFischer

theorem min_max_principle_closed_from_evidence (P : MinMaxPrinciplePackage)
    (E : MinMaxPrincipleEvidence P) : MinMaxPrincipleClosed P := by
  exact And.intro E.rayleighQuotientBoundedClosed
    (And.intro E.minMaxCharacterizationClosed E.courantFischerClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse