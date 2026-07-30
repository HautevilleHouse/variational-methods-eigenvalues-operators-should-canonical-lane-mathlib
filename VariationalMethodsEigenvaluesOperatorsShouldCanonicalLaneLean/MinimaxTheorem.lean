import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure MinimaxTheoremPackage {P : VariationalEigenvaluePackage} where
  rayleighMinimax : Prop
  courantFischer : Prop
  dimensionDependence : Prop

structure MinimaxTheoremEvidence {P : VariationalEigenvaluePackage}
    (M : MinimaxTheoremPackage P) where
  rayleighMinimaxClosed : M.rayleighMinimax
  courantFischerClosed : M.courantFischer
  dimensionDependenceClosed : M.dimensionDependence

def MinimaxTheoremClosed {P : VariationalEigenvaluePackage}
    (M : MinimaxTheoremPackage P) : Prop :=
  M.rayleighMinimax ∧ M.courantFischer ∧ M.dimensionDependence

theorem minimax_theorem_closed_from_evidence {P : VariationalEigenvaluePackage}
    (M : MinimaxTheoremPackage P) (E : MinimaxTheoremEvidence M) :
    MinimaxTheoremClosed M := by
  exact And.intro E.rayleighMinimaxClosed
    (And.intro E.courantFischerClosed E.dimensionDependenceClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse