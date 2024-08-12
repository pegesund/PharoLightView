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

{ #category : 'initialization' }
LVCBody >> initialize [
	super initialize .
	id := 'body'.
	name := 'body'
]

{ #category : 'rendering' }
LVCBody >> render [
	h
		body: { }
		with: [ self renderChildren ]
]
