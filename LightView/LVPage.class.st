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

{ #category : 'accessing' }
LVPage >> sessionId [

	^ sessionId
]

{ #category : 'accessing' }
LVPage >> sessionId: anObject [

	sessionId := anObject
]
