import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure ConvergenceAnalysisPackage {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M} where
  solutionSpace : Type u
  errorNorm : Type v
  convergenceRate : Type w
  aPrioriEstimate : Prop
  aPosterioriEstimate : Prop
  contractionProperty : Prop
  optimalityUpToConstant : Prop

structure ConvergenceAnalysisEvidence {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    (C : ConvergenceAnalysisPackage A) where
  aPrioriEstimateClosed : C.aPrioriEstimate
  aPosterioriEstimateClosed : C.aPosterioriEstimate
  contractionPropertyClosed : C.contractionProperty
  optimalityUpToConstantClosed : C.optimalityUpToConstant

def ConvergenceAnalysisClosed {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    (C : ConvergenceAnalysisPackage A) : Prop :=
  C.aPrioriEstimate ∧ C.aPosterioriEstimate ∧
  C.contractionProperty ∧ C.optimalityUpToConstant

theorem convergence_analysis_closed_from_evidence
    {M : MeshElementQualityPackage} {A : AdaptiveRefinementCriteriaPackage M}
    (C : ConvergenceAnalysisPackage A) (E : ConvergenceAnalysisEvidence C) :
    ConvergenceAnalysisClosed C := by
  exact And.intro E.aPrioriEstimateClosed
    (And.intro E.aPosterioriEstimateClosed
      (And.intro E.contractionPropertyClosed E.optimalityUpToConstantClosed))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse