import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure AdaptiveRefinementCriteriaPackage {M : MeshElementQualityPackage} where
  errorEstimator : Type u
  refinementIndicator : Type v
  markingStrategy : Type w
  dofConstraint : Type x
  errorEstimatorReliable : Prop
  refinementIndicatorLocalized : Prop
  markingStrategyOptimal : Prop
  dofConstraintSatisfied : Prop

structure AdaptiveRefinementCriteriaEvidence {M : MeshElementQualityPackage}
    (A : AdaptiveRefinementCriteriaPackage M) where
  errorEstimatorReliableClosed : A.errorEstimatorReliable
  refinementIndicatorLocalizedClosed : A.refinementIndicatorLocalized
  markingStrategyOptimalClosed : A.markingStrategyOptimal
  dofConstraintSatisfiedClosed : A.dofConstraintSatisfied

def AdaptiveRefinementCriteriaClosed {M : MeshElementQualityPackage}
    (A : AdaptiveRefinementCriteriaPackage M) : Prop :=
  A.errorEstimatorReliable ∧ A.refinementIndicatorLocalized ∧
  A.markingStrategyOptimal ∧ A.dofConstraintSatisfied

theorem adaptive_refinement_criteria_closed_from_evidence
    {M : MeshElementQualityPackage} (A : AdaptiveRefinementCriteriaPackage M)
    (E : AdaptiveRefinementCriteriaEvidence A) : AdaptiveRefinementCriteriaClosed A := by
  exact And.intro E.errorEstimatorReliableClosed
    (And.intro E.refinementIndicatorLocalizedClosed
      (And.intro E.markingStrategyOptimalClosed E.dofConstraintSatisfiedClosed))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse