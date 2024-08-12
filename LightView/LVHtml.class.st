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
		'extraAttributes',
		'parent',
		'isPage'
	],
	#category : 'LightView-rendering',
	#package : 'LightView',
	#tag : 'rendering'
}

{ #category : 'adding' }
LVHtml >> addChild: c [

	c renderer: h.
	c parent: self.
	children add: c
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

	super initialize.
	children := OrderedCollection new.
	extraAttributes := {  }.
	isPage := false.
]

{ #category : 'accessing' }
LVHtml >> page [
	"Iterates up in hierarchy to find page"
	| p |
	p := self parent.
	[ p class = LVPage ] doWhileFalse: [ p := p parent ].
	^ p
]

{ #category : 'accessing' }
LVHtml >> parent [

	^ parent
]

{ #category : 'accessing' }
LVHtml >> parent: anObject [

	parent := anObject
]

{ #category : 'removing' }
LVHtml >> removeChild: c [

"Todo"
]

{ #category : 'rendering' }
LVHtml >> render [
	"A component MUST have a unique name. Overwrite this method if you need other attributes or another base tag"

	| attribs |
	attribs := id
		           ifNil: [ extraAttributes ]
		           ifNotNil: [ { ('id' -> id) } , extraAttributes ].
	h
		div: { (#class -> 'lv-component') } , attribs
		with: [ self renderChildren ]
]

{ #category : 'rendering' }
LVHtml >> renderChildren [

	^ ''
]

{ #category : 'accessing' }
LVHtml >> renderer [

	^ h
]

{ #category : 'accessing' }
LVHtml >> renderer: anObject [

	h := anObject
]
