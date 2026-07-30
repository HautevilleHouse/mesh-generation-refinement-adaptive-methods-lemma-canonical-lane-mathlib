import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure AdaptiveFiniteElementAssemblyPackage {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    {O : MeshOptimizationPackage C}
    {P : ParallelMeshAdaptationPackage O} where
  elementMatrixComputation : Type u
  globalAssembly : Type v
  dirichletBC : Type w
  neumannBC : Type x
  elementMatrixConsistent : Prop
  globalAssemblyCorrect : Prop
  boundaryConditionsApplied : Prop
  linearSystemSolvable : Prop

structure AdaptiveFiniteElementAssemblyEvidence {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    {O : MeshOptimizationPackage C}
    {P : ParallelMeshAdaptationPackage O}
    (F : AdaptiveFiniteElementAssemblyPackage P) where
  elementMatrixConsistentClosed : F.elementMatrixConsistent
  globalAssemblyCorrectClosed : F.globalAssemblyCorrect
  boundaryConditionsAppliedClosed : F.boundaryConditionsApplied
  linearSystemSolvableClosed : F.linearSystemSolvable

def AdaptiveFiniteElementAssemblyClosed {M : MeshElementQualityPackage}
    {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A}
    {O : MeshOptimizationPackage C}
    {P : ParallelMeshAdaptationPackage O}
    (F : AdaptiveFiniteElementAssemblyPackage P) : Prop :=
  F.elementMatrixConsistent ∧ F.globalAssemblyCorrect ∧
  F.boundaryConditionsApplied ∧ F.linearSystemSolvable

theorem adaptive_finite_element_assembly_closed_from_evidence
    {M : MeshElementQualityPackage} {A : AdaptiveRefinementCriteriaPackage M}
    {C : ConvergenceAnalysisPackage A} {O : MeshOptimizationPackage C}
    {P : ParallelMeshAdaptationPackage O} (F : AdaptiveFiniteElementAssemblyPackage P)
    (E : AdaptiveFiniteElementAssemblyEvidence F) :
    AdaptiveFiniteElementAssemblyClosed F := by
  exact And.intro E.elementMatrixConsistentClosed
    (And.intro E.globalAssemblyCorrectClosed
      (And.intro E.boundaryConditionsAppliedClosed E.linearSystemSolvableClosed))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse