"
I keep track on how to render a component and also rendering of children.
"
Class {
	#name : 'LVComponent',
	#superclass : 'Object',
	#instVars : [
		'children',
		'name',
		'id',
		'h',
		'extraAttributes'
	],
	#category : 'LightView-rendering',
	#package : 'LightView',
	#tag : 'rendering'
}

{ #category : 'accessing' }
LVComponent >> children [

	^ children
]

{ #category : 'accessing' }
LVComponent >> children: anObject [

	children := anObject
]

{ #category : 'accessing' }
LVComponent >> contents [

	^ h out contents
]

{ #category : 'accessing' }
LVComponent >> extraAttributes: anObject [

	extraAttributes := anObject
]

{ #category : 'accessing' }
LVComponent >> id [

	^ id
]

{ #category : 'accessing' }
LVComponent >> id: anObject [

	id := anObject
]

{ #category : 'initialization' }
LVComponent >> initialize [

	super initialize.
	children := OrderedCollection new.
	extraAttributes := {  }
]

{ #category : 'accessing' }
LVComponent >> name [

	^ name
]

{ #category : 'accessing' }
LVComponent >> name: anObject [

	name := anObject
]

{ #category : 'rendering' }
LVComponent >> render [
	"A component MUST have a unique name. Overwrite this method if you need other attributes or another base tag"

	h
		div: (({
				(#class -> 'lv-component').
				(#name -> name) }) , extraAttributes)
		with: [ self renderChildren ]
]

{ #category : 'rendering' }
LVComponent >> renderChildren [

	^ ''
]

{ #category : 'accessing' }
LVComponent >> renderer [

	^ h
]

{ #category : 'accessing' }
LVComponent >> renderer: anObject [

	h := anObject
]
