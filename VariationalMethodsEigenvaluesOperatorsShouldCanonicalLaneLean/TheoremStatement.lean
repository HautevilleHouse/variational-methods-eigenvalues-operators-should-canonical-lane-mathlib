import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure VariationalAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  eigenvalueProblem : Prop
  operator : Prop
  variationalPrinciple : Prop
  conclusion : eigenvalueProblem ∧ operator ∧ variationalPrinciple

def VariationalWitnessClosed (O : VariationalAdmittedObject) : Prop :=
  O.eigenvalueProblem ∧ O.operator ∧ O.variationalPrinciple

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse