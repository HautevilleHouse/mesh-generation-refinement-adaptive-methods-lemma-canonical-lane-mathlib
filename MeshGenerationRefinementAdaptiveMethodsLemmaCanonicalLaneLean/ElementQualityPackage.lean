import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure ElementQualityPackage (M : MeshAdmittedObject) where
  aspectRatio : Prop
  skewness : Prop
  orthogonality : Prop
  jacobian : Prop
  qualityGuarantee : Prop

structure ElementQualityEvidence {M : MeshAdmittedObject} (Q : ElementQualityPackage M) where
  aspectRatioClosed : Q.aspectRatio
  skewnessClosed : Q.skewness
  orthogonalityClosed : Q.orthogonality
  jacobianClosed : Q.jacobian
  qualityGuaranteeClosed : Q.qualityGuarantee

def ElementQualityClosed {M : MeshAdmittedObject} (Q : ElementQualityPackage M) : Prop :=
  Q.aspectRatio ∧ Q.skewness ∧ Q.orthogonality ∧ Q.jacobian ∧ Q.qualityGuarantee

theorem element_quality_closed_from_evidence {M : MeshAdmittedObject}
    (Q : ElementQualityPackage M) (E : ElementQualityEvidence Q) : ElementQualityClosed Q := by
  exact And.intro E.aspectRatioClosed
    (And.intro E.skewnessClosed
      (And.intro E.orthogonalityClosed
        (And.intro E.jacobianClosed E.qualityGuaranteeClosed)))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse