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
- Each continuation will get a unique random id, very different to guess.
- Also to prevent url-highjacking each continuation will be valideated against the session id which belongs to the corresponding page

"
Class {
	#name : 'LVServer',
	#superclass : 'Object',
	#instVars : [
		'teapot'
	],
	#category : 'LightView-server',
	#package : 'LightView',
	#tag : 'server'
}
