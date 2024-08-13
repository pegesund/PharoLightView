"
I handle the Tepot server.

I keep track on the routes and dispactch traffic.
"
Class {
	#name : 'LVServer',
	#superclass : 'Object',
	#instVars : [
		'teapot'
	],
	#classInstVars : [
		'servers'
	],
	#category : 'LightView-webServer',
	#package : 'LightView',
	#tag : 'webServer'
}

{ #category : 'adding' }
LVServer class >> addServer: s [
  servers add: s.
]

{ #category : 'registration' }
LVServer class >> createNew [

	| lvServer |
	lvServer := self new.
	^ lvServer
]

{ #category : 'registration' }
LVServer class >> stopAll [
  Teapot stopAll.
  servers := OrderedCollection new.
  
]

{ #category : 'adding' }
LVServer >> addRoute: route toPage: component method: method [
	"This connects a component or page a route in Teapot"

	(component class isInClassHierarchyOf: LVComponent)
	| (component class isInClassHierarchyOf: LVPage) ifFalse: [
		self error: 'Routes can only be added to components and pages' ].
   
	(method = #get) ifTrue: [
 		teapot GET: route -> [ :req | component request: req ].
		^ #added. 
		].
	
   self error: 'No such method'
]

{ #category : 'handling' }
LVServer >> start [

	teapot := Teapot configure: { #debugMode -> true }.
	teapot start.
	^ self
]

{ #category : 'handling' }
LVServer >> stop [
	teapot stop.
]
