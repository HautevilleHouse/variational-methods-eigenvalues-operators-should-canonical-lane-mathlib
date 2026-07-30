import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure CalderonOperatorEstimate where
  domain : Type u
  operator : Type v
  LpBoundedness : Prop
  spectralRadiusBound : Prop
  resolventEstimate : Prop

structure CalderonEstimateEvidence (E : CalderonOperatorEstimate) where
  LpBoundednessClosed : E.LpBoundedness
  spectralRadiusBoundClosed : E.spectralRadiusBound
  resolventEstimateClosed : E.resolventEstimate

def CalderonEstimateClosed (E : CalderonOperatorEstimate) : Prop :=
  E.LpBoundedness ∧ E.spectralRadiusBound ∧ E.resolventEstimate

theorem calderon_estimate_closed_from_evidence (E : CalderonOperatorEstimate)
    (Ev : CalderonEstimateEvidence E) : CalderonEstimateClosed E := by
  exact And.intro Ev.LpBoundednessClosed (And.intro Ev.spectralRadiusBoundClosed Ev.resolventEstimateClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse