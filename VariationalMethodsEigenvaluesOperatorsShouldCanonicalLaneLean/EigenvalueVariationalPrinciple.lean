import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure EigenvalueVariationalPrinciple where
  operator : Type u
  spectrum : Type v
  minMaxFormula : Prop
  maxMinFormula : Prop
  weylAsymptotic : Prop

structure EigenvalueVariationalEvidence (E : EigenvalueVariationalPrinciple) where
  minMaxFormulaClosed : E.minMaxFormula
  maxMinFormulaClosed : E.maxMinFormula
  weylAsymptoticClosed : E.weylAsymptotic

def EigenvalueVariationalClosed (E : EigenvalueVariationalPrinciple) : Prop :=
  E.minMaxFormula ∧ E.maxMinFormula ∧ E.weylAsymptotic

theorem eigenvalue_variational_closed_from_evidence (E : EigenvalueVariationalPrinciple)
    (Ev : EigenvalueVariationalEvidence E) : EigenvalueVariationalClosed E := by
  exact And.intro Ev.minMaxFormulaClosed (And.intro Ev.maxMinFormulaClosed Ev.weylAsymptoticClosed)

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse