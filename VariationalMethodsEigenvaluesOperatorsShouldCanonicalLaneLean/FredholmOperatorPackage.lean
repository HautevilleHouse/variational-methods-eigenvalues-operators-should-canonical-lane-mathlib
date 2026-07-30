import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure FredholmOperatorPackage {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace X] [CompleteSpace Y] where
  operator : X →L[ℝ] Y
  index : ℤ
  kernel : Set X
  cokernel : Set Y
  finiteDimensionalKernel : Prop
  finiteDimensionalCokernel : Prop
  closedRange : Prop

structure FredholmOperatorEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace X] [CompleteSpace Y]
    (F : FredholmOperatorPackage X Y) where
  finiteDimensionalKernelClosed : F.finiteDimensionalKernel
  finiteDimensionalCokernelClosed : F.finiteDimensionalCokernel
  closedRangeClosed : F.closedRange
  indexFormula : F.index = (FiniteDimensional.finrank ℝ F.kernel) - (FiniteDimensional.finrank ℝ F.cokernel)
  fredholmAlternative : (F.operator.range = ⊤) ∨ (F.operator.range).compl ≠ ⊥

def FredholmOperatorClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace X] [CompleteSpace Y]
    (F : FredholmOperatorPackage X Y) : Prop :=
  F.finiteDimensionalKernel ∧ F.finiteDimensionalCokernel ∧ F.closedRange ∧
  (F.index = (FiniteDimensional.finrank ℝ F.kernel) - (FiniteDimensional.finrank ℝ F.cokernel)) ∧
  ((F.operator.range = ⊤) ∨ (F.operator.range).compl ≠ ⊥)

theorem fredholm_operator_closed_from_evidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace X] [CompleteSpace Y]
    (F : FredholmOperatorPackage X Y) (Ev : FredholmOperatorEvidence F) : FredholmOperatorClosed F :=
  And.intro Ev.finiteDimensionalKernelClosed (And.intro Ev.finiteDimensionalCokernelClosed (And.intro Ev.closedRangeClosed (And.intro Ev.indexFormula Ev.fredholmAlternative)))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse