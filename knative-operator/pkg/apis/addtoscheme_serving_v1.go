package apis

import (
	servingv1 "knative.dev/serving/pkg/apis/serving/v1"
)

func init() {
	// Register the types with the Scheme so the components can map objects to GroupVersionKinds and back
	// Add Knative Serving scheme used in ConsoleCLIDownload
	AddToSchemes = append(AddToSchemes, servingv1.AddToScheme)
}
