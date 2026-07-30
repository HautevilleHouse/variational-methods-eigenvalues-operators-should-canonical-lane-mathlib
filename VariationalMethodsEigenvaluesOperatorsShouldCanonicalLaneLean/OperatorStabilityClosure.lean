import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure OperatorPerturbationStability where
  selfAdjointOperator : Type u → Type v
  spectrumStableUnderCompactPerturbation : Prop
  eigenvalueContinuity : Prop
  spectralGapPreserved : Prop

structure SpectralConvergence where
  operatorSequence : ℕ → (Type u → Type v)
  strongResolventConvergence : Prop
  spectralMeasureConverges : Prop
  eigenvalueLimitPoints : Prop

structure OperatorEvidence (S : OperatorPerturbationStability) (C : SpectralConvergence) where
  spectrumStableClosed : S.spectrumStableUnderCompactPerturbation
  spectralConvergenceClosed : C.strongResolventConvergence ∧ C.spectralMeasureConverges

def OperatorClosure (S : OperatorPerturbationStability) (C : SpectralConvergence) : Prop :=
  S.spectrumStableUnderCompactPerturbation ∧ S.eigenvalueContinuity ∧
  C.strongResolventConvergence ∧ C.eigenvalueLimitPoints

theorem operator_closure_from_evidence
    (S : OperatorPerturbationStability) (C : SpectralConvergence)
    (E : OperatorEvidence S C) : OperatorClosure S C := by
  exact And.intro E.spectrumStableClosed (And.intro S.eigenvalueContinuity
    (And.intro E.spectralConvergenceClosed.1 C.eigenvalueLimitPoints))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse