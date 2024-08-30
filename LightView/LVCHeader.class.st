"
Renders header
"
Class {
	#name : 'LVCHeader',
	#superclass : 'LVComponent',
	#instVars : [
		'hasState'
	],
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

{ #category : 'accessing' }
LVCHeader >> hasState: anObject [

	hasState := anObject
]

{ #category : 'rendering' }
LVCHeader >> html [

	h head: {  } with: [
		hasState ifTrue: [ h script: { 'type' -> 'text/javascript' . 'src' -> 'lvhelper.js' } ].
		self renderChildren ]
]

{ #category : 'initialization' }
LVCHeader >> initialize [
	super initialize .
	id := 'header'.
	name := 'header'
]
