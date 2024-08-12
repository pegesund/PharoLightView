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
		'name'
	],
	#category : 'LightView-rendering',
	#package : 'LightView',
	#tag : 'rendering'
}

{ #category : 'adding' }
LVHtml >> addChild: c [
	self verifyAddChild: c.
	c renderer: h.
	c parent: self.
	children add: c
]

{ #category : 'adding' }
LVHtml >> addChild: c after: n [
	"Can be used on a page, then follows all children"
	| keeperNode |
	keeperNode := LVPage findChildOwnerOf: n startingAt: self page.
	keeperNode ifNil: [
		self error: 'to after object does not exist in this page' ].
	keeperNode verifyAddChild: c.
	c renderer: h.
	c parent: keeperNode.
	keeperNode addToChildCollection: c after: n
]

{ #category : 'adding' }
LVHtml >> addChild: c before: n [

	| keeperNode |
	keeperNode := LVPage findChildOwnerOf: n startingAt: self page.
	keeperNode ifNil: [
		self error: 'to after object does not exist in this page' ].
	keeperNode verifyAddChild: c.
	c renderer: h.
	c parent: keeperNode.
	keeperNode addToChildCollection: c before: n
]

{ #category : 'adding' }
LVHtml >> addChildFirst: c [
	self verifyAddChild: c.
	c renderer: h.
	c parent: self.
	children addFirst: c
]

{ #category : 'adding' }
LVHtml >> addToChildCollection: obj after: a [
	children add: obj after: a.
]

{ #category : 'adding' }
LVHtml >> addToChildCollection: obj before: a [

	children add: obj before: a
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
LVHtml >> extraAttributes [

	^ extraAttributes
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
]

{ #category : 'accessing' }
LVHtml >> name [

	^ name
]

{ #category : 'accessing' }
LVHtml >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
LVHtml >> page [
	"Iterates up in hierarchy to find page"

	| p |
	p := self.
   [ p class = LVPage ] whileFalse: [ p := p parent ].
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

	h
		div: { (#class -> 'lv-component') } 
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

{ #category : 'adding' }
LVHtml >> verifyAddChild: c [

	| allComponentNames |
	self class = LVHtml & (c class = LVComponent) ifTrue: [
		self error: 'You can not add a LVComponent to LVHTML' ].

	self class = LVHtml & (c class = LVPage) ifTrue: [
		self error: 'You can not add a LVPage to a LVHhtml' ].

	self class = LVComponent & (c class = LVPage) ifTrue: [
		self error: 'You can not add a LVPage to a LVComponent' ].

	self class = LVComponent & (c class = LVPage) ifTrue: [
		self error: 'You can not add a LVPage to a LVComponent' ].

	self class = LVPage & (c class = LVPage) ifTrue: [
		self error: 'You can not add a LVPage to a LVPage' ].

	self = c ifTrue: [ self error: 'Can not add a component to itself' ].

	allComponentNames := LVPage getComponentNames: self page set: nil.
	(allComponentNames includes: c name) ifTrue: [
		self error: 'Duplicate component name in page' ].
]
