"
I deal with much of the storing and evaluation of the continations.

I map from session-ids to page objects by the sessionPage var.
"
Class {
	#name : 'LVContMapper',
	#superclass : 'Object',
	#instVars : [
		'sessionPage'
	],
	#category : 'LightView-memory',
	#package : 'LightView',
	#tag : 'memory'
}

{ #category : 'uuid' }
LVContMapper class >> safeUUID [

 ^ (UUID new asString) , (UUID new asString)
]

{ #category : 'adding' }
LVContMapper >> addPage: page sessionId: sessionId [
   sessionPage at: sessionId add: page.
]

{ #category : 'lookup' }
LVContMapper >> findPage: sessionId [

	^ sessionPage at: sessionId ifAbsent: nil
]
