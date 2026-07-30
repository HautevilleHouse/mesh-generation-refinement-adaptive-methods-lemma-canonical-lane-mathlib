import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure RefinementPackage {M : MeshAdmittedObject} (Q : ElementQualityPackage M) where
  hRefinement : Prop
  pRefinement : Prop
  hpRefinement : Prop
  anisotropicRefinement : Prop
  conformityPreserved : Prop

structure RefinementEvidence {M : MeshAdmittedObject} {Q : ElementQualityPackage M}
    (R : RefinementPackage Q) where
  hRefinementClosed : R.hRefinement
  pRefinementClosed : R.pRefinement
  hpRefinementClosed : R.hpRefinement
  anisotropicRefinementClosed : R.anisotropicRefinement
  conformityPreservedClosed : R.conformityPreserved

def RefinementClosed {M : MeshAdmittedObject} {Q : ElementQualityPackage M}
    (R : RefinementPackage Q) : Prop :=
  R.hRefinement ∧ R.pRefinement ∧ R.hpRefinement ∧ R.anisotropicRefinement ∧ R.conformityPreserved

theorem refinement_closed_from_evidence {M : MeshAdmittedObject} {Q : ElementQualityPackage M}
    (R : RefinementPackage Q) (E : RefinementEvidence R) : RefinementClosed R := by
  exact And.intro E.hRefinementClosed
    (And.intro E.pRefinementClosed
      (And.intro E.hpRefinementClosed
        (And.intro E.anisotropicRefinementClosed E.conformityPreservedClosed)))

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse