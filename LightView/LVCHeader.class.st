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

{ #category : 'rendering' }
LVCHeader >> html [

	h head: [
		h
			script: {
					('src' -> 'https://unpkg.com/htmx.org@2.0.2').
					('itegrity'
					 ->
						 'sha384-Y7hw+L/jvKeWIRRkqWYfPcvVxHzVzn5REgzbawhxAuQGwX1XWe70vji+VSeHOThJ').
					('crossorigin' -> 'anonymous') };
			meta: { ('charset' -> 'UTF-8') };
			title: self page name.

		self renderChildren ]
]

{ #category : 'initialization' }
LVCHeader >> initialize [
	super initialize .
	id := 'header'.
	name := 'header'
]
