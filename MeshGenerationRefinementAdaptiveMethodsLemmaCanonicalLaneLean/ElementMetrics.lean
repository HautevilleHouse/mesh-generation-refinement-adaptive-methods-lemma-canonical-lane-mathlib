import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean

structure ElementGeometry where
  dimension : Nat
  aspectRatio : Float
  jacobianDeterminant : Float
  innerAngleMin : Float
  innerAngleMax : Float

structure ElementQuality where
  geometry : ElementGeometry
  shapeQuality : Float
  skewness : Float
  orthogonality : Float
  smoothness : Float
  isAdmissible : Prop

structure ElementMetricsPackage where
  elementSet : List ElementQuality
  metricTensorDefined : Prop
  metricTensorContinuous : Prop
  metricTensorSmoothness : Prop

structure ElementMetricsEvidence (P : ElementMetricsPackage) where
  metricTensorDefinedClosed : P.metricTensorDefined
  metricTensorContinuousClosed : P.metricTensorContinuous
  metricTensorSmoothnessClosed : P.metricTensorSmoothness

def ElementMetricsClosed (P : ElementMetricsPackage) : Prop :=
  P.metricTensorDefined ∧ P.metricTensorContinuous ∧ P.metricTensorSmoothness

theorem element_metrics_closed_from_evidence (P : ElementMetricsPackage) (E : ElementMetricsEvidence P) : ElementMetricsClosed P := by
  exact And.intro E.metricTensorDefinedClosed (And.intro E.metricTensorContinuousClosed E.metricTensorSmoothnessClosed)

end MeshGenerationRefinementAdaptiveMethodsLemmaCanonicalLaneLean
end HautevilleHouse