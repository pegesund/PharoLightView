"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestLightView',
	#superclass : 'PackageManifest',
	#category : 'LightView-Manifest',
	#package : 'LightView',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestLightView class >> ruleExcessiveMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#HTMLRenderer)) #'2024-08-11T13:32:17.554394+02:00') )
]
