import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure FriedrichsExtension where
  symmetricOperator : Type u
  domain : Type v
  closure : Type w
  selfAdjointExtension : Prop
  uniqueness : Prop
  formDomain : Prop

structure FriedrichsExtensionEvidence (F : FriedrichsExtension) where
  selfAdjointExtensionClosed : F.selfAdjointExtension
  uniquenessClosed : F.uniqueness
  formDomainClosed : F.formDomain

def FriedrichsExtensionClosed (F : FriedrichsExtension) : Prop :=
  F.selfAdjointExtension ∧ F.uniqueness ∧ F.formDomain

theorem friedrichs_extension_closed_from_evidence (F : FriedrichsExtension)
    (Ev : FriedrichsExtensionEvidence F) : FriedrichsExtensionClosed F := by
  exact And.intro Ev.selfAdjointExtensionClosed (And.intro Ev.uniquenessClosed Ev.formDomainClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse