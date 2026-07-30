import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean

structure EulerLagrangePackage {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  functional : X → ℝ
  derivative : X → (X →L[ℝ] ℝ)
  criticalPoints : Set X
  eulerLagrangeEquation : X → Prop
  boundaryTerms : X → Prop

structure EulerLagrangeEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (E : EulerLagrangePackage X) where
  functionalSmooth : Smooth ℝ E.functional
  derivativeCorrect : ∀ x : X, hasDerivAt E.functional (E.derivative x) x
  eulerLagrangeClosed : ∀ x : X, x ∈ E.criticalPoints → E.eulerLagrangeEquation x
  boundaryTermsClosed : ∀ x : X, E.eulerLagrangeEquation x → E.boundaryTerms x

def EulerLagrangeClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (E : EulerLagrangePackage X) : Prop :=
  Smooth ℝ E.functional ∧
  (∀ x : X, hasDerivAt E.functional (E.derivative x) x) ∧
  (∀ x : X, x ∈ E.criticalPoints → E.eulerLagrangeEquation x) ∧
  (∀ x : X, E.eulerLagrangeEquation x → E.boundaryTerms x)

theorem euler_lagrange_closed_from_evidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (E : EulerLagrangePackage X) (Ev : EulerLagrangeEvidence E) : EulerLagrangeClosed E :=
  And.intro Ev.functionalSmooth (And.intro Ev.derivativeCorrect (And.intro Ev.eulerLagrangeClosed Ev.boundaryTermsClosed))

end VariationalMethodsEigenvaluesOperatorsShouldCanonicalLaneLean
end HautevilleHouse