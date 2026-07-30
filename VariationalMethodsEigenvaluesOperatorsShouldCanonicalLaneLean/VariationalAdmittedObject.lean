import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure VariationalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure VariationalAdmittedObject where
  space : VariationalSpace
  operatorDefined : Prop
  spectralGap : Prop
  selfAdjoint : Prop
  compactResolvent : Prop
  conclusion : operatorDefined ∧ spectralGap ∧ selfAdjoint ∧ compactResolvent

def VariationalWitnessClosed (O : VariationalAdmittedObject) : Prop :=
  O.operatorDefined ∧ O.spectralGap ∧ O.selfAdjoint ∧ O.compactResolvent

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse