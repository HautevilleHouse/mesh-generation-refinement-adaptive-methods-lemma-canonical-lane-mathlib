import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean.OptimalComplexity

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure MeshAdaptiveMethodFoundation where
  optimalComplexity : OptimalComplexityPackage
  optimalComplexityEvidence : OptimalComplexityEvidence optimalComplexity
  meshDomain : MeshDomain
  errorEstimator : ErrorEstimatorPackage
  refinementPattern : RefinementPatternPackage
  convergenceAnalysis : ConvergenceAnalysisPackage

default

def MeshAdaptiveMethodFoundationClosed (A : MeshAdaptiveMethodFoundation) : Prop :=
  ErrorEstimatorClosed A.errorEstimator ∧
  RefinementPatternClosed A.refinementPattern ∧
  ConvergenceAnalysisClosed A.convergenceAnalysis ∧
  OptimalComplexityClosed A.optimalComplexity

default

theorem mesh_adaptive_method_foundation_closed_from_evidence (A : MeshAdaptiveMethodFoundation) :
    MeshAdaptiveMethodFoundationClosed A := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact error_estimator_closed_from_evidence A.errorEstimator ?_
  · exact refinement_pattern_closed_from_evidence A.refinementPattern ?_
  · exact convergence_analysis_closed_from_evidence A.convergenceAnalysis ?_
  · exact optimal_complexity_closed_from_evidence A.optimalComplexity A.optimalComplexityEvidence

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse
