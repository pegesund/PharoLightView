"
I am responsible for rendering a web page.

My children are components.
"
Class {
	#name : 'LVPage',
	#superclass : 'LVComponent',
	#instVars : [
		'sessionId',
		'createdAt'
	],
	#category : 'LightView-rendering',
	#package : 'LightView',
	#tag : 'rendering'
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

{ #category : 'initialization' }
LVPage >> initialize [ 
   super initialize .
]

{ #category : 'rendering' }
LVPage >> render [
	"Overwrite for page other page rendering"

	| attribs |
	attribs := id
		           ifNil: [ extraAttributes ]
		           ifNotNil: [ { ('id' -> id) } , extraAttributes ].
	h
		div: {
				(#class -> 'lv-page').
				(#name -> name) } , attribs
		with: [ self renderChildren ]
]

{ #category : 'accessing' }
LVPage >> sessionId [

	^ sessionId
]

{ #category : 'accessing' }
LVPage >> sessionId: anObject [

	sessionId := anObject
]
