import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure AdaptiveAlgorithmPackage where
  solveEstimateMarkRefineLoop : Prop
  convergenceRate : Prop
  optimalComplexity : Prop
  stoppingCriterion : Prop

structure AdaptiveAlgorithmEvidence (A : AdaptiveAlgorithmPackage) where
  solveEstimateMarkRefineLoopClosed : A.solveEstimateMarkRefineLoop
  convergenceRateClosed : A.convergenceRate
  optimalComplexityClosed : A.optimalComplexity
  stoppingCriterionClosed : A.stoppingCriterion

def AdaptiveAlgorithmClosed (A : AdaptiveAlgorithmPackage) : Prop :=
  A.solveEstimateMarkRefineLoop ∧ A.convergenceRate ∧ A.optimalComplexity ∧ A.stoppingCriterion

theorem adaptive_algorithm_closed_from_evidence (A : AdaptiveAlgorithmPackage) (E : AdaptiveAlgorithmEvidence A) :
    AdaptiveAlgorithmClosed A := by
  exact And.intro E.solveEstimateMarkRefineLoopClosed
    (And.intro E.convergenceRateClosed
      (And.intro E.optimalComplexityClosed E.stoppingCriterionClosed))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse