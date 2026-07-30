import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure LaxMilgramTheorem where
  hilbertSpace : Type u
  bilinearForm : Type v
  coercivity : Prop
  boundedness : Prop
  existenceSolution : Prop
  uniquenessSolution : Prop

structure LaxMilgramEvidence (L : LaxMilgramTheorem) where
  coercivityClosed : L.coercivity
  boundednessClosed : L.boundedness
  existenceSolutionClosed : L.existenceSolution
  uniquenessSolutionClosed : L.uniquenessSolution

def LaxMilgramClosed (L : LaxMilgramTheorem) : Prop :=
  L.coercivity ∧ L.boundedness ∧ L.existenceSolution ∧ L.uniquenessSolution

theorem lax_milgram_closed_from_evidence (L : LaxMilgramTheorem)
    (Ev : LaxMilgramEvidence L) : LaxMilgramClosed L := by
  exact And.intro Ev.coercivityClosed (And.intro Ev.boundednessClosed (And.intro Ev.existenceSolutionClosed Ev.uniquenessSolutionClosed))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse