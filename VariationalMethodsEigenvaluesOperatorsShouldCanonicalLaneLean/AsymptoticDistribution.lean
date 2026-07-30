import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure AsymptoticDistributionPackage {P : VariationalEigenvaluePackage} where
  weylLaw : Prop
  eigenvalueCounting : Prop
  spectralFunctionAsymptotics : Prop

structure AsymptoticDistributionEvidence {P : VariationalEigenvaluePackage}
    (A : AsymptoticDistributionPackage P) where
  weylLawClosed : A.weylLaw
  eigenvalueCountingClosed : A.eigenvalueCounting
  spectralFunctionAsymptoticsClosed : A.spectralFunctionAsymptotics

def AsymptoticDistributionClosed {P : VariationalEigenvaluePackage}
    (A : AsymptoticDistributionPackage P) : Prop :=
  A.weylLaw ∧ A.eigenvalueCounting ∧ A.spectralFunctionAsymptotics

theorem asymptotic_distribution_closed_from_evidence {P : VariationalEigenvaluePackage}
    (A : AsymptoticDistributionPackage P) (E : AsymptoticDistributionEvidence A) :
    AsymptoticDistributionClosed A := by
  exact And.intro E.weylLawClosed
    (And.intro E.eigenvalueCountingClosed E.spectralFunctionAsymptoticsClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse