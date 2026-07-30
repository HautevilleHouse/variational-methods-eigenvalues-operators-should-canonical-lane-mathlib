import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure CrouzeixPalenciaConjecture where
  matrixAlgebra : Type u
  numericalRange : Type v
  spectralSet : Type w
  numericalRadiusSpectralRadiusRatioBound : Prop
  optimalConstant : Prop

structure CrouzeixPalenciaEvidence (C : CrouzeixPalenciaConjecture) where
  numericalRadiusSpectralRadiusRatioBoundClosed : C.numericalRadiusSpectralRadiusRatioBound
  optimalConstantClosed : C.optimalConstant

def CrouzeixPalenciaClosed (C : CrouzeixPalenciaConjecture) : Prop :=
  C.numericalRadiusSpectralRadiusRatioBound ∧ C.optimalConstant

theorem crouzeix_palencia_closed_from_evidence (C : CrouzeixPalenciaConjecture)
    (Ev : CrouzeixPalenciaEvidence C) : CrouzeixPalenciaClosed C := by
  exact And.intro Ev.numericalRadiusSpectralRadiusRatioBoundClosed Ev.optimalConstantClosed

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse