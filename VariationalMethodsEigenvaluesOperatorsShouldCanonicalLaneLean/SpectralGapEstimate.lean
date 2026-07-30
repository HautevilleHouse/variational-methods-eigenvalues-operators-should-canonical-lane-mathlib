import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure SpectralGapEstimatePackage {P : VariationalEigenvaluePackage} where
  gapLowerBound : Prop
  poincareInequality : Prop
  cheegerBound : Prop
  gapStabilityUnderPerturbation : Prop

structure SpectralGapEstimateEvidence {P : VariationalEigenvaluePackage}
    (S : SpectralGapEstimatePackage P) where
  gapLowerBoundClosed : S.gapLowerBound
  poincareInequalityClosed : S.poincareInequality
  cheegerBoundClosed : S.cheegerBound
  gapStabilityUnderPerturbationClosed : S.gapStabilityUnderPerturbation

def SpectralGapEstimateClosed {P : VariationalEigenvaluePackage}
    (S : SpectralGapEstimatePackage P) : Prop :=
  S.gapLowerBound ∧ S.poincareInequality ∧ S.cheegerBound ∧ S.gapStabilityUnderPerturbation

theorem spectral_gap_estimate_closed_from_evidence {P : VariationalEigenvaluePackage}
    (S : SpectralGapEstimatePackage P) (E : SpectralGapEstimateEvidence S) :
    SpectralGapEstimateClosed S := by
  exact And.intro E.gapLowerBoundClosed
    (And.intro E.poincareInequalityClosed
      (And.intro E.cheegerBoundClosed E.gapStabilityUnderPerturbationClosed))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse