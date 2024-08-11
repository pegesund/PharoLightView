Class {
	#name : 'LightViewTest',
	#superclass : 'TestCase',
	#category : 'LightView-Tests',
	#package : 'LightView-Tests'
}

{ #category : 'testRendring' }
LightViewTest >> testSimpleRendring [

	| s r l contents |
	r := HTMLRenderer new.
	s := WriteStream on: String new.
	r out: s.

	l := LVComponent new.
	l name: 'myname'.
	l renderer: r.
	contents := l render contents.

	self
		assert: contents
		equals: '<div class="lv-component" name="myname"></div>'
]
