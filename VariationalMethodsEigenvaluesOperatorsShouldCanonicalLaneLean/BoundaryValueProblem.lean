import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure BoundaryValueProblemPackage {P : VariationalEigenvaluePackage} where
  weakFormulation : Prop
  dirichletEigenvalues : Prop
  neumannEigenvalues : Prop
  regularity : Prop

structure BoundaryValueProblemEvidence {P : VariationalEigenvaluePackage}
    (B : BoundaryValueProblemPackage P) where
  weakFormulationClosed : B.weakFormulation
  dirichletEigenvaluesClosed : B.dirichletEigenvalues
  neumannEigenvaluesClosed : B.neumannEigenvalues
  regularityClosed : B.regularity

def BoundaryValueProblemClosed {P : VariationalEigenvaluePackage}
    (B : BoundaryValueProblemPackage P) : Prop :=
  B.weakFormulation ∧ B.dirichletEigenvalues ∧ B.neumannEigenvalues ∧ B.regularity

theorem boundary_value_problem_closed_from_evidence {P : VariationalEigenvaluePackage}
    (B : BoundaryValueProblemPackage P) (E : BoundaryValueProblemEvidence B) :
    BoundaryValueProblemClosed B := by
  exact And.intro E.weakFormulationClosed
    (And.intro E.dirichletEigenvaluesClosed
      (And.intro E.neumannEigenvaluesClosed E.regularityClosed))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse