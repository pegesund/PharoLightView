"
Renders header
"
Class {
	#name : 'LVCHeader',
	#superclass : 'LVComponent',
	#category : 'LightView-components',
	#package : 'LightView',
	#tag : 'components'
}

{ #category : 'instance creation' }
LVCHeader class >> new [

	| c |
	c := super superNew.
	c initialize.
	self initialize.
	^ c.
]

{ #category : 'initialization' }
LVCHeader >> initialize [
	super initialize .
	id := 'header'.
	name := 'header'
]

{ #category : 'rendering' }
LVCHeader >> render [

	h header: {  } with: [ self renderChildren ]
]
