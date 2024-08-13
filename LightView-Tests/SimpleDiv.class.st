"
Simple test class
"
Class {
	#name : 'SimpleDiv',
	#superclass : 'LVComponent',
	#category : 'LightView-Tests',
	#package : 'LightView-Tests'
}

{ #category : 'rendering' }
SimpleDiv >> html [

	h div: {  } with: 'hello'.
]
