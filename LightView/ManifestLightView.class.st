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
ManifestLightView class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#LVComponent)) #'2024-08-11T13:48:55.962541+02:00') #(#(#RGClassDefinition #(#LVPage)) #'2024-08-11T20:43:03.831329+02:00') )
]

{ #category : 'code-critics' }
ManifestLightView class >> ruleCollectionMessagesToExternalObjectRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#LVHtml #addChild:after: #false)) #'2024-08-12T15:53:40.129358+02:00') )
]

{ #category : 'code-critics' }
ManifestLightView class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#LVPage #getComponentNames:set: #false)) #'2024-08-12T14:16:14.447123+02:00') #(#(#RGMethodDefinition #(#'LVPage class' #getComponentNames:set: #true)) #'2024-08-12T14:33:51.564982+02:00') )
]

{ #category : 'code-critics' }
ManifestLightView class >> ruleEqualsTrueRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#HTMLRenderer #renderAttrs: #false)) #'2024-08-11T13:52:05.561851+02:00') )
]

{ #category : 'code-critics' }
ManifestLightView class >> ruleExcessiveMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#HTMLRenderer)) #'2024-08-11T13:32:17.554394+02:00') )
]

{ #category : 'code-critics' }
ManifestLightView class >> ruleRefersToClassRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#LVHtml #addChild: #false)) #'2024-08-12T13:16:17.984798+02:00') #(#(#RGMethodDefinition #(#LVHtml #verifyAddChild: #false)) #'2024-08-12T15:15:09.315216+02:00') )
]

{ #category : 'code-critics' }
ManifestLightView class >> ruleSendsDifferentSuperRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'LVComponent class' #newName: #true)) #'2024-08-12T20:00:23.554966+02:00') #(#(#RGMethodDefinition #(#'LVPage class' #newName: #true)) #'2024-08-12T20:20:53.831255+02:00') #(#(#RGMethodDefinition #(#'LVComponent class' #newName:id: #true)) #'2024-08-12T20:21:07.792331+02:00') #(#(#RGMethodDefinition #(#'LVComponent class' #superNew #true)) #'2024-08-12T20:49:47.015365+02:00') #(#(#RGMethodDefinition #(#'LVCBody class' #new #true)) #'2024-08-12T20:50:41.362932+02:00') #(#(#RGMethodDefinition #(#'LVCHeader class' #new #true)) #'2024-08-12T20:50:51.266743+02:00') #(#(#RGMethodDefinition #(#'LVPage class' #newNameStatefull: #true)) #'2024-08-15T20:26:30.773378+02:00') )
]
