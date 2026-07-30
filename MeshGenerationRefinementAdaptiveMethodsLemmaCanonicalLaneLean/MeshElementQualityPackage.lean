import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure MeshElementQualityPackage where
  aspectRatio : Prop
  skewness : Prop
  jacobian : Prop
  orthogonality : Prop
  distortion : Prop
  shapeMetricClosure : Prop
  aspectRatioClosed : aspectRatio
  skewnessClosed : skewness
  jacobianClosed : jacobian
  orthogonalityClosed : orthogonality
  distortionClosed : distortion
  shapeMetricClosureClosed : shapeMetricClosure

structure MeshElementQualityEvidence (M : MeshElementQualityPackage) where
  aspectRatioClosed : M.aspectRatio
  skewnessClosed : M.skewness
  jacobianClosed : M.jacobian
  orthogonalityClosed : M.orthogonality
  distortionClosed : M.distortion
  shapeMetricClosureClosed : M.shapeMetricClosure

def MeshElementQualityClosed (M : MeshElementQualityPackage) : Prop :=
  M.aspectRatio ∧ M.skewness ∧ M.jacobian ∧ M.orthogonality ∧ M.distortion ∧ M.shapeMetricClosure

theorem mesh_element_quality_closed_from_evidence
    (M : MeshElementQualityPackage) (E : MeshElementQualityEvidence M) :
    MeshElementQualityClosed M := by
  exact And.intro E.aspectRatioClosed
    (And.intro E.skewnessClosed
      (And.intro E.jacobianClosed
        (And.intro E.orthogonalityClosed
          (And.intro E.distortionClosed E.shapeMetricClosureClosed))))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse