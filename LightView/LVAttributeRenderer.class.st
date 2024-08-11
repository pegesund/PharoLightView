"
I am the base class for hooks that change how attributes are rendered.
"
Class {
	#name : 'LVAttributeRenderer',
	#superclass : 'Object',
	#instVars : [
		'parent'
	],
	#category : 'LightView-rendering',
	#package : 'LightView',
	#tag : 'rendering'
}

{ #category : 'accessing' }
LVAttributeRenderer >> parent: anObject [

	parent := anObject
]

{ #category : 'rendering' }
LVAttributeRenderer >> render: attributeEntry [
	"Render an attribute value to string, may do some special handling.
	Returns a new association with value processed.
	Default implementation just returns attribute mapping as is."
	^ attributeEntry 
]
