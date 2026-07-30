import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure AdaptiveSolverPackage where
  initialMesh : String
  solverType : String
  errorEstimator : String
  markingStrategy : String
  refinementRule : String
  convergenceRate : Float
  iterationCount : Nat
  finalError : Float

structure AdaptiveSolverEvidence (P : AdaptiveSolverPackage) where
  convergenceRateClosed : P.convergenceRate > 0.0
  finalErrorClosed : P.finalError < 1e-6
  iterationFinite : P.iterationCount < 10000

def AdaptiveSolverClosed (P : AdaptiveSolverPackage) : Prop :=
  P.convergenceRate > 0.0 ∧ P.finalError < 1e-6 ∧ P.iterationCount < 10000

theorem adaptive_solver_closed_from_evidence (P : AdaptiveSolverPackage) (E : AdaptiveSolverEvidence P) : AdaptiveSolverClosed P := by
  exact And.intro E.convergenceRateClosed (And.intro E.finalErrorClosed E.iterationFinite)

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse