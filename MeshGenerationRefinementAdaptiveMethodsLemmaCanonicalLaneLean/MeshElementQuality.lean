import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure MeshElementQualityPackage where
  elementType : Type u
  aspectRatio : Type v
  skewness : Type w
  orthogonality : Type x
  smoothness : Type y
  aspectRatioControlled : Prop
  skewnessControlled : Prop
  orthogonalityControlled : Prop
  smoothnessControlled : Prop

structure MeshElementQualityEvidence (M : MeshElementQualityPackage) where
  aspectRatioControlledClosed : M.aspectRatioControlled
  skewnessControlledClosed : M.skewnessControlled
  orthogonalityControlledClosed : M.orthogonalityControlled
  smoothnessControlledClosed : M.smoothnessControlled

def MeshElementQualityClosed (M : MeshElementQualityPackage) : Prop :=
  M.aspectRatioControlled ∧ M.skewnessControlled ∧ M.orthogonalityControlled ∧ M.smoothnessControlled

theorem mesh_element_quality_closed_from_evidence
    (M : MeshElementQualityPackage) (E : MeshElementQualityEvidence M) :
    MeshElementQualityClosed M := by
  exact And.intro E.aspectRatioControlledClosed
    (And.intro E.skewnessControlledClosed
      (And.intro E.orthogonalityControlledClosed E.smoothnessControlledClosed))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse