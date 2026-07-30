import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure MeshAdmittedObject where
  domain : Type
  triangulation : Type
  elementQuality : Prop
  refinementLevel : Nat
  convergenceOrder : Prop

structure AdmissibleClass where
  object : MeshAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MeshWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def MeshWitnessClosed (O : MeshAdmittedObject) : Prop :=
  O.convergenceOrder

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse