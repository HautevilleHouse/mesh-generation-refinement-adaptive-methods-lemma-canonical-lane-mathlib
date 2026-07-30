import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure AdaptivityConvergencePackage where
  aPrioriEstimate : Prop
  aPosterioriEstimate : Prop
  saturationProperty : Prop
  contractionFixedPoint : Prop
  optimalComplexity : Prop
  aPrioriEstimateClosed : aPrioriEstimate
  aPosterioriEstimateClosed : aPosterioriEstimate
  saturationPropertyClosed : saturationProperty
  contractionFixedPointClosed : contractionFixedPoint
  optimalComplexityClosed : optimalComplexity

structure AdaptivityConvergenceEvidence (A : AdaptivityConvergencePackage) where
  aPrioriEstimateClosed : A.aPrioriEstimate
  aPosterioriEstimateClosed : A.aPosterioriEstimate
  saturationPropertyClosed : A.saturationProperty
  contractionFixedPointClosed : A.contractionFixedPoint
  optimalComplexityClosed : A.optimalComplexity

def AdaptivityConvergenceClosed (A : AdaptivityConvergencePackage) : Prop :=
  A.aPrioriEstimate ∧ A.aPosterioriEstimate ∧ A.saturationProperty ∧ A.contractionFixedPoint ∧ A.optimalComplexity

theorem adaptivity_convergence_closed_from_evidence
    (A : AdaptivityConvergencePackage) (E : AdaptivityConvergenceEvidence A) :
    AdaptivityConvergenceClosed A := by
  exact And.intro E.aPrioriEstimateClosed
    (And.intro E.aPosterioriEstimateClosed
      (And.intro E.saturationPropertyClosed
        (And.intro E.contractionFixedPointClosed E.optimalComplexityClosed)))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse