import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure RefinementCriterionPackage where
  errorEstimator : Prop
  refinementIndicator : Prop
  markingStrategy : Prop
  refinementRule : Prop
  stabilizationGuarantee : Prop
  errorEstimatorClosed : errorEstimator
  refinementIndicatorClosed : refinementIndicator
  markingStrategyClosed : markingStrategy
  refinementRuleClosed : refinementRule
  stabilizationGuaranteeClosed : stabilizationGuarantee

structure RefinementCriterionEvidence (R : RefinementCriterionPackage) where
  errorEstimatorClosed : R.errorEstimator
  refinementIndicatorClosed : R.refinementIndicator
  markingStrategyClosed : R.markingStrategy
  refinementRuleClosed : R.refinementRule
  stabilizationGuaranteeClosed : R.stabilizationGuarantee

def RefinementCriterionClosed (R : RefinementCriterionPackage) : Prop :=
  R.errorEstimator ∧ R.refinementIndicator ∧ R.markingStrategy ∧ R.refinementRule ∧ R.stabilizationGuarantee

theorem refinement_criterion_closed_from_evidence
    (R : RefinementCriterionPackage) (E : RefinementCriterionEvidence R) :
    RefinementCriterionClosed R := by
  exact And.intro E.errorEstimatorClosed
    (And.intro E.refinementIndicatorClosed
      (And.intro E.markingStrategyClosed
        (And.intro E.refinementRuleClosed E.stabilizationGuaranteeClosed)))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse