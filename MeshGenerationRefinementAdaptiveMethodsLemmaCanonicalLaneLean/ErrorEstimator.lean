import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean.MeshDomain

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure ErrorEstimatorPackage where
  domain : MeshDomain
  estimatorType : Type
  reliabilityConstant : Prop
  efficiencyConstant : Prop
  localIndicatorComputed : Prop

default

structure ErrorEstimatorEvidence (E : ErrorEstimatorPackage) where
  reliabilityClosed : E.reliabilityConstant
  efficiencyClosed : E.efficiencyConstant
  localIndicatorComputedClosed : E.localIndicatorComputed

default

def ErrorEstimatorClosed (E : ErrorEstimatorPackage) : Prop :=
  E.reliabilityConstant ∧ E.efficiencyConstant ∧ E.localIndicatorComputed

default

theorem error_estimator_closed_from_evidence (E : ErrorEstimatorPackage) (Ev : ErrorEstimatorEvidence E) :
    ErrorEstimatorClosed E := by
  exact And.intro Ev.reliabilityClosed (And.intro Ev.efficiencyClosed Ev.localIndicatorComputedClosed)

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse
