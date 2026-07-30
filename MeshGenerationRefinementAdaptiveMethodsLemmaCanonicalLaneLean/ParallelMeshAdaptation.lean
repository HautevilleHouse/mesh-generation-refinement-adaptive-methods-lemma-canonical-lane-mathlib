import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure ParallelMeshAdaptationPackage {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    {O : MeshOptimizationPackage C} where
  domainDecomposition : Type u
  loadBalancing : Type v
  communicationPattern : Type w
  partitionQuality : Prop
  loadBalanceAchieved : Prop
  communicationOverheadBounded : Prop
  scalingEfficiency : Prop

structure ParallelMeshAdaptationEvidence {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    {O : MeshOptimizationPackage C}
    (P : ParallelMeshAdaptationPackage O) where
  partitionQualityClosed : P.partitionQuality
  loadBalanceAchievedClosed : P.loadBalanceAchieved
  communicationOverheadBoundedClosed : P.communicationOverheadBounded
  scalingEfficiencyClosed : P.scalingEfficiency

def ParallelMeshAdaptationClosed {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    {O : MeshOptimizationPackage C}
    (P : ParallelMeshAdaptationPackage O) : Prop :=
  P.partitionQuality ∧ P.loadBalanceAchieved ∧
  P.communicationOverheadBounded ∧ P.scalingEfficiency

theorem parallel_mesh_adaptation_closed_from_evidence
    {M : MeshElementQualityPackage} {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A} {O : MeshOptimizationPackage C}
    (P : ParallelMeshAdaptationPackage O) (E : ParallelMeshAdaptationEvidence P) :
    ParallelMeshAdaptationClosed P := by
  exact And.intro E.partitionQualityClosed
    (And.intro E.loadBalanceAchievedClosed
      (And.intro E.communicationOverheadBoundedClosed E.scalingEfficiencyClosed))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse