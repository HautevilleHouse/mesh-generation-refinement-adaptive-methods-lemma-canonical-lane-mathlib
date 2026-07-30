import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean.ConvergenceAnalysis

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure OptimalComplexityPackage where
  convergenceAnalysis : ConvergenceAnalysisPackage
  workEstimates : Prop
  complexityBound : Prop

default

structure OptimalComplexityEvidence (O : OptimalComplexityPackage) where
  workEstimatesClosed : O.workEstimates
  complexityBoundClosed : O.complexityBound

default

def OptimalComplexityClosed (O : OptimalComplexityPackage) : Prop :=
  O.workEstimates ∧ O.complexityBound

default

theorem optimal_complexity_closed_from_evidence (O : OptimalComplexityPackage) (Ev : OptimalComplexityEvidence O) :
    OptimalComplexityClosed O := by
  exact And.intro Ev.workEstimatesClosed Ev.complexityBoundClosed

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse
