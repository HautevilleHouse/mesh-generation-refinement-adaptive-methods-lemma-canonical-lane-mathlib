import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure AdaptivePackage {M : MeshAdmittedObject} {Q : ElementQualityPackage M}
    {R : RefinementPackage Q} where
  errorEstimator : Prop
  markingStrategy : Prop
  refinementCriterion : Prop
  convergenceProof : Prop
  optimalComplexity : Prop

structure AdaptiveEvidence {M : MeshAdmittedObject} {Q : ElementQualityPackage M}
    {R : RefinementPackage Q} (A : AdaptivePackage R) where
  errorEstimatorClosed : A.errorEstimator
  markingStrategyClosed : A.markingStrategy
  refinementCriterionClosed : A.refinementCriterion
  convergenceProofClosed : A.convergenceProof
  optimalComplexityClosed : A.optimalComplexity

def AdaptiveClosed {M : MeshAdmittedObject} {Q : ElementQualityPackage M}
    {R : RefinementPackage Q} (A : AdaptivePackage R) : Prop :=
  A.errorEstimator ∧ A.markingStrategy ∧ A.refinementCriterion ∧
  A.convergenceProof ∧ A.optimalComplexity

theorem adaptive_closed_from_evidence {M : MeshAdmittedObject} {Q : ElementQualityPackage M}
    {R : RefinementPackage Q} (A : AdaptivePackage R) (E : AdaptiveEvidence A) :
    AdaptiveClosed A := by
  exact And.intro E.errorEstimatorClosed
    (And.intro E.markingStrategyClosed
      (And.intro E.refinementCriterionClosed
        (And.intro E.convergenceProofClosed E.optimalComplexityClosed)))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse