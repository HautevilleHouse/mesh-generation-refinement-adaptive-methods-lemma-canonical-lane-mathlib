import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure ErrorEstimationPackage where
  residualBasedEstimator : Type u
  recoveryBasedEstimator : Type v
  hierarchicalEstimator : Type w
  reliability : Prop
  efficiency : Prop
  localLowerBound : Prop

structure ErrorEstimationEvidence (E : ErrorEstimationPackage) where
  reliabilityClosed : E.reliability
  efficiencyClosed : E.efficiency
  localLowerBoundClosed : E.localLowerBound

def ErrorEstimationClosed (E : ErrorEstimationPackage) : Prop :=
  E.reliability ∧ E.efficiency ∧ E.localLowerBound

theorem error_estimation_closed_from_evidence (E : ErrorEstimationPackage) (Ev : ErrorEstimationEvidence E) :
    ErrorEstimationClosed E := by
  exact And.intro Ev.reliabilityClosed
    (And.intro Ev.efficiencyClosed Ev.localLowerBoundClosed)

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse