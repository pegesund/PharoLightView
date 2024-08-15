Class {
	#name : 'LightViewTest',
	#superclass : 'TestCase',
	#category : 'LightView-Tests',
	#package : 'LightView-Tests'
}

{ #category : 'tests' }
LightViewTest >> testAddChildAfter [

	| page c1 c2 c3 names |
	page := LVPage newName: 'MyPage'.
	c1 := LVComponent newName: 'C1' id: 1.
	c3 := LVComponent newName: 'C3' id: 3.
	c2 := LVComponent newName: 'C2' id: 2.
	page addChild: c1.
	page addChild: c3.
	page addChild: c2 after: c1.
	names := LVPage getComponentNames: page set: nil.
	self assert: names asArray equals: #( 'MyPage' 'C1' 'C2' 'C3' )
]

{ #category : 'tests' }
LightViewTest >> testAddChildBefore [

	| page c1 c2 c3 names |
	page := LVPage newName: 'MyPage'.
	c1 := LVComponent newName: 'C1' id: 1.
	c3 := LVComponent newName: 'C3' id: 3.
	c2 := LVComponent newName: 'C2' id: 2.
	page addChild: c1.
	page addChild: c3.
	page addChild: c2 before: c3.
	names := LVPage getComponentNames: page set: nil.
	self assert: names asArray equals: #( 'MyPage' 'C1' 'C2' 'C3' )
]

{ #category : 'tests' }
LightViewTest >> testAddChildFirst [

	| page c1 c2 names |
	page := LVPage newName: 'MyPage'.
	c1 := LVComponent newName: 'C1' id: 1.
	c2 := LVComponent newName: 'C2' id: 2.
	page addChild: c1.
	page addChildFirst: c2.
	names := LVPage getComponentNames: page set: nil.
	self assert: names asArray equals: #( 'MyPage' 'C2' 'C1' )
]

{ #category : 'tests' }
LightViewTest >> testAddingChildren [

	| page c1 c2 c3 names |
	page := LVPage newName: 'MyPage'.
	c1 := LVComponent newName: 'C1' id: 1.
	c2 := LVComponent newName: 'C2' id: 2.
	c3 := LVComponent newName: 'C3' id: 3.
	page addChild: c1.
	page addChild: c2.
	c2 addChild: c3.
	names := LVPage getComponentNames: page set: nil.
	self assert: names size equals: 4
]

{ #category : 'tests' }
LightViewTest >> testAddingNotAllowedNodes [

	| page c1 c2 |
	page := LVPage newName: 'MyPage'.
	c1 := LVComponent newName: 'C1' id: 1.
	c2 := LVComponent newName: 'C1' id: 2.
	self should: [ c1 addChild: page ] raise: Error.
	self should: [ c1 addChild: c1 ] raise: Error.
	"Test same name gitves error"
	self
		should: [
			page addChild: c1.
			page addChild: c2 ]
		raise: Error
]

{ #category : 'tests' }
LightViewTest >> testFindNodeObject [

	| page c1 c2 c3 fNode |
	page := LVPage newName: 'MyPage'.
	c1 := LVComponent newName: 'C1' id: 1.
	c2 := LVComponent newName: 'C2' id: 2.
	c3 := LVComponent newName: 'C3' id: 3.
	page addChild: c1.
	page addChild: c2.
	c2 addChild: c3.
	fNode := LVPage findChildOwnerOf: c3 startingAt: page.
	self assert: fNode equals: c2.
	fNode := LVPage findChildOwnerOf: c2 startingAt: page.
	self assert: fNode equals: page
]

{ #category : 'tests' }
LightViewTest >> testRenderPage [

	| page |
	page := LVPage newName: 'MyPage'.
	self
		assert: page render
		equals: '<html><head></head><body></body></html>'
]

{ #category : 'testRendring' }
LightViewTest >> testSimpleRendring [

	| s r l contents |
	r := HTMLRenderer new.
	s := WriteStream on: String new.
	r out: s.

	l := LVComponent newName: 'myname' id: 'x'.
	l extraAttributes: { ('id' -> 'myid') }.
	l name: 'myname'.
	l renderer: r.
	r component: l.
	contents := l html contents.


	self
		assert: contents
		equals: '<div class="lv-component" name="myname" id="myid"></div>'
]
