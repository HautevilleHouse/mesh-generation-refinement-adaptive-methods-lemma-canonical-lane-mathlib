import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure MeshDomain where
  vertexType : Type
  elementType : Type
  geometry : Type
  dimension : Nat
  domainTopology : TopologicalSpace vertexType

default

structure MeshAdmittedObject where
  domain : MeshDomain
  initialTriangulation : Prop
  refinementLevel : Nat
  qualityGuarantee : Prop
  conclusion : qualityGuarantee

default

structure MeshEndgameState where
  object : MeshAdmittedObject

default

def MeshWitnessClosed (O : MeshAdmittedObject) : Prop :=
  O.qualityGuarantee

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse
