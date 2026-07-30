import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure SpectralTheorem where
  selfAdjointOperator : Type u
  hilbertSpace : Type v
  spectralMeasure : Type w
  spectralResolution : Prop
  functionalCalculus : Prop
  spectralDecomposition : Prop

structure SpectralTheoremEvidence (S : SpectralTheorem) where
  spectralResolutionClosed : S.spectralResolution
  functionalCalculusClosed : S.functionalCalculus
  spectralDecompositionClosed : S.spectralDecomposition

def SpectralTheoremClosed (S : SpectralTheorem) : Prop :=
  S.spectralResolution ∧ S.functionalCalculus ∧ S.spectralDecomposition

theorem spectral_theorem_closed_from_evidence (S : SpectralTheorem)
    (Ev : SpectralTheoremEvidence S) : SpectralTheoremClosed S := by
  exact And.intro Ev.spectralResolutionClosed (And.intro Ev.functionalCalculusClosed Ev.spectralDecompositionClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse