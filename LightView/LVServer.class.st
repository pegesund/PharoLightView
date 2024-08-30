"
This serves data from Teapot.

- Handlers can be added on pages.

- Keep track of sessions and pages.

**Data structure**

- LVServer holds a link between a session and pages.
- Pages is a new dict, with the different pages
- Each page holds a component tree and this will keep the continuations
- Each component has a mapping between a contination tree with the continutaion id and the code block

**Security**

There are two layers of security:
- Each continuation will get a unique random id, which will be impossible to guess.
- Also to prevent url-highjacking each continuation will be validated against the session id which belongs to the corresponding page

"
Class {
	#name : 'LVServer',
	#superclass : 'Object',
	#instVars : [
		'teapot',
		'pages',
		'sessionToPages'
	],
	#classInstVars : [
		'teapot'
	],
	#category : 'LightView-server',
	#package : 'LightView',
	#tag : 'server'
}

{ #category : 'adding' }
LVServer >> addPage: page name: name [

	(pages includesKey: name) ifTrue: [
		self error: 'Trying to add already added page: ' , page ].

	page mountedAt: DateAndTime now.
	teapot GET: name -> page render
]

{ #category : 'initialization' }
LVServer >> initialize [

	pages := Dictionary new.
	sessionToPages := Dictionary new.
]

{ #category : 'removing' }
LVServer >> removePageByName: name [

	pages removeKey: name ifAbsent: [ self error: 'No such page: ', name ].
]

{ #category : 'start' }
LVServer >> start [

	teapot := Teapot on.
	teapot start.
	teapot GET: ('lvhelper.js' -> (LVJSHelper new) render).
	^ self
]

{ #category : 'start' }
LVServer >> stop [

	teapot stop.
	^ self.
]
