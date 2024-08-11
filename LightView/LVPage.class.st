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
LVPage >> createdAt [

	^ createdAt
]

{ #category : 'accessing' }
LVPage >> createdAt: anObject [

	createdAt := anObject
]

{ #category : 'initialization' }
LVPage >> initialize [ 
   super initialize .
   isPage := true.
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
