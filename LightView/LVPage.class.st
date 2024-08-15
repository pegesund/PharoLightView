"
I am responsible for rendering a web page.

My children are components.
"
Class {
	#name : 'LVPage',
	#superclass : 'LVHtml',
	#instVars : [
		'sessionId',
		'createdAt',
		'hasState'
	],
	#category : 'LightView-components',
	#package : 'LightView',
	#tag : 'components'
}

{ #category : 'accessing' }
LVPage class >> findChildOwnerOf: obj startingAt: node [
	"Finds a LV-object in a child hierarchy. Returns the owning node. See test findChildOwenerOf:StartingAt:"
	(node children includes: obj) ifTrue: [ ^ node ].
	node children do: [ :c |
		(self findChildOwnerOf: obj startingAt: c) ifNotNil: [ ^ c ] ].
	^ nil
]

{ #category : 'accessing' }
LVPage class >> getComponentNames: node set: n [
	"Get name of all components. Start with nil to initiate recursion"

	| names componentChildren |
	names := n ifNil: [ OrderedCollection new ] ifNotNil: [ n ].
	names add: (node name).
	componentChildren := node children select: [ :c |
		                     c class = LVComponent ].
	componentChildren do: [ :c |
		self getComponentNames: c set: names ].
	^ names
]

{ #category : 'instance creation' }
LVPage class >> new [
  self error: 'Use newName instead. Page must have a name'
]

{ #category : 'instance creation' }
LVPage class >> newName: n [

	| c |
	c := super new.
	c hasState: false.
	super initialize.
	c name: n.
	^ c
]

{ #category : 'instance creation' }
LVPage class >> statefullNewName: n [

	| c |
	c := super new.
	c hasState: true.
	super initialize.
	c name: n.
	c body addChild: LVJSHelper new.
	^ c
]

{ #category : 'accessing' }
LVPage >> createdAt [

	^ createdAt
]

{ #category : 'accessing' }
LVPage >> createdAt: anObject [

	createdAt := anObject
]

{ #category : 'accessing' }
LVPage >> getComponentNames: node set: n [ 
	^ self class getComponentNames: node set: n 
]

{ #category : 'accessing' }
LVPage >> hasState [

	^ hasState
]

{ #category : 'accessing' }
LVPage >> hasState: anObject [

	hasState := anObject
]

{ #category : 'rendering' }
LVPage >> html [
	"Overwrite for page other page rendering"

	h
		html: { }
		with: [ self renderChildren ]
]

{ #category : 'initialization' }
LVPage >> initialize [

	super initialize.
	self addChild: LVCHeader new.
	self addChild: LVCBody new.
	hasState ifNotNil: [  self body addChild: LVJSHelper ].
	
]

{ #category : 'accessing' }
LVPage >> sessionId [

	^ sessionId
]

{ #category : 'accessing' }
LVPage >> sessionId: anObject [

	sessionId := anObject
]
