"
Lowest level for Pharo class that can render html.
"
Class {
	#name : 'LVHtml',
	#superclass : 'Object',
	#instVars : [
		'children',
		'id',
		'h',
		'extraAttributes'
	],
	#category : 'LightView-rendering',
	#package : 'LightView',
	#tag : 'rendering'
}

{ #category : 'adding' }
LVHtml >> addChild: c [

		children add: c.
]

{ #category : 'accessing' }
LVHtml >> children [

	^ children
]

{ #category : 'accessing' }
LVHtml >> children: anObject [

	children := anObject
]

{ #category : 'accessing' }
LVHtml >> contents [

	^ h out contents
]

{ #category : 'accessing' }
LVHtml >> extraAttributes: anObject [

	extraAttributes := anObject
]

{ #category : 'accessing' }
LVHtml >> id [

	^ id
]

{ #category : 'accessing' }
LVHtml >> id: anObject [

	id := anObject
]

{ #category : 'initialization' }
LVHtml >> initialize [

	super initialize .
	children := OrderedCollection new.
	extraAttributes := {  }
]

{ #category : 'removing' }
LVHtml >> removeChild: c [

"Todo"
]

{ #category : 'rendering' }
LVHtml >> render [
	"A component MUST have a unique name. Overwrite this method if you need other attributes or another base tag"

	h
		div: {
				(#class -> 'lv-component').
				 } , extraAttributes
		with: [ self renderChildren ]
]

{ #category : 'rendering' }
LVHtml >> renderChildren [

	^ ''
]

{ #category : 'accessing' }
LVHtml >> renderer: anObject [

	h := anObject
]
