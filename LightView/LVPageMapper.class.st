"
I map from session-ids to page objects by the sessionPage var.
"
Class {
	#name : 'LVPageMapper',
	#superclass : 'Object',
	#instVars : [
		'sessionPage'
	],
	#category : 'LightView-memory',
	#package : 'LightView',
	#tag : 'memory'
}

{ #category : 'adding' }
LVPageMapper >> addPage: page sessionId: sessionId [
   sessionPage at: sessionId add: page.
]
