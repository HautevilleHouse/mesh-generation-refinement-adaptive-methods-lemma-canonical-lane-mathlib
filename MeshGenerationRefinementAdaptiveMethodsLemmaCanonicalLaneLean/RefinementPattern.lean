import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean.ErrorEstimator

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure RefinementPatternPackage where
  estimator : ErrorEstimatorPackage
  markStrategy : Type
  refineStrategy : Type
  closureUnderRefinement : Prop
  nestedMeshProperty : Prop

default

structure RefinementPatternEvidence (R : RefinementPatternPackage) where
  markStrategyClosed : Prop
  refineStrategyClosed : Prop
  closureUnderRefinementClosed : R.closureUnderRefinement
  nestedMeshPropertyClosed : R.nestedMeshProperty
  markStrategyClosedTerm : markStrategyClosed
  refineStrategyClosedTerm : refineStrategyClosed

default

def RefinementPatternClosed (R : RefinementPatternPackage) : Prop :=
  R.closureUnderRefinement ∧ R.nestedMeshProperty

default

theorem refinement_pattern_closed_from_evidence (R : RefinementPatternPackage) (Ev : RefinementPatternEvidence R) :
    RefinementPatternClosed R := by
  exact And.intro Ev.closureUnderRefinementClosed Ev.nestedMeshPropertyClosed

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse
