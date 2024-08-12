"
Renders body.
"
Class {
	#name : 'LVCBody',
	#superclass : 'LVComponent',
	#category : 'LightView-components',
	#package : 'LightView',
	#tag : 'components'
}

{ #category : 'instance creation' }
LVCBody class >> new [

	| c |
	c := super superNew.
	c initialize.
	self initialize.
	^ c.
]

{ #category : 'rendering' }
LVCBody >> html [
	h
		body: { }
		with: [ self renderChildren ]
]

{ #category : 'initialization' }
LVCBody >> initialize [
	super initialize .
	id := 'body'.
	name := 'body'
]
