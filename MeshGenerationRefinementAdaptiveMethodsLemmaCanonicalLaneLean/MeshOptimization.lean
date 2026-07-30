import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure MeshOptimizationPackage {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A} where
  costFunctional : Type u
  geometryConstraint : Type v
  topologicalConstraint : Type w
  optimizationAlgorithm : Type x
  costFunctionalConvex : Prop
  geometryConstraintSatisfied : Prop
  topologicalConstraintSatisfied : Prop
  algorithmConverges : Prop

structure MeshOptimizationEvidence {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    (O : MeshOptimizationPackage C) where
  costFunctionalConvexClosed : O.costFunctionalConvex
  geometryConstraintSatisfiedClosed : O.geometryConstraintSatisfied
  topologicalConstraintSatisfiedClosed : O.topologicalConstraintSatisfied
  algorithmConvergesClosed : O.algorithmConverges

def MeshOptimizationClosed {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    (O : MeshOptimizationPackage C) : Prop :=
  O.costFunctionalConvex ∧ O.geometryConstraintSatisfied ∧
  O.topologicalConstraintSatisfied ∧ O.algorithmConverges

theorem mesh_optimization_closed_from_evidence
    {M : MeshElementQualityPackage} {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A} (O : MeshOptimizationPackage C)
    (E : MeshOptimizationEvidence O) : MeshOptimizationClosed O := by
  exact And.intro E.costFunctionalConvexClosed
    (And.intro E.geometryConstraintSatisfiedClosed
      (And.intro E.topologicalConstraintSatisfiedClosed E.algorithmConvergesClosed))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse