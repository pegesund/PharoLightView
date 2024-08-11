"
I am the base class for hooks that change how attributes are rendered.
"
Class {
	#name : 'LVAttributeRenderer',
	#superclass : 'Object',
	#category : 'LightView-rendering',
	#package : 'LightView',
	#tag : 'rendering'
}

{ #category : 'rendering' }
LVAttributeRenderer >> render: attributeEntry [
	"Render an attribute value to string, may do some special handling.
	Returns a new association with value processed.
	Default implementation just returns attribute mapping as is."
	^ attributeEntry 
]
