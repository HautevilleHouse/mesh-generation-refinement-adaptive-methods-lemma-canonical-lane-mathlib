import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

def ConstrainedMeshClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mesh_endgame (A : AdmissibleClass) :
    ConstrainedMeshClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse