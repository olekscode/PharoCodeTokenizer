Class {
	#name : #PharoTokenizingVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleArray [
	#(1 'hello' true nil)
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleArrayCurly [
	{1 . 'hello' . true . nil}
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleAssignment [
	| x |
	x := 2
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleBlock [
	[ 1 + 2 ]
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleBlockWithArgs [
	[ :x | x + 2 ]
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleBlockWithArgsAndTemp [
	[ :x :y | 
	| a b |
	a := x + 1.
	b := y - 1.
	a * b ]
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleCharacter [
	$,
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleClass [
	Array
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleCollect [
	self collect: [ :x | x ]
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleEmptyArray [
	#()
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleEmptyArrayCurly [
	{}
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleInstanceVariable [
	anInstanceVariable := 1
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleMessageNoArgs [
	2 asInteger
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleMessageOneArg [
	Array new: 2
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleMessageOperator [
	1 + 2
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleMessageThreeArgs [
	Array with: 3 with: 4 with: 5
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleMessageTwoArgs [
	Array with: 3 with: 4
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleNestedArrays [
	#((1 2 3) 'hello' (true false))
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleNestedArraysCurly [
	{ { 1 . 'hello' } . true . { false } }
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleNumber [
	5
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleParentheses [
	2 * (3 + 4)
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleReturn [
	^ 1
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleSelf [
	self
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleSequence [
	5.
	#(1 2 true)
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleSuper [
	super
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleSymbol [
	#hello
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleTemporary [
	| x y z |
	
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleTemporaryUsed [
	| x y |
	x := 1.
	y := 2.
	x + y
]

{ #category : #examples }
PharoTokenizingVisitorTest >> exampleWithArgs: anArg [
	5
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testArray [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleArray) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleArray'.
	self
		assert: visitor tokens
		equals: #('#(' '<num>' '<str>' 'true' 'nil' ')' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testArrayCurly [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleArrayCurly) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleArrayCurly'.
	self
		assert: visitor tokens
		equals: #('{' '<num>' '.' '<str>' '.' 'true' '.' 'nil' '}' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testAssignment [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleAssignment) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleAssignment'.
	self
		assert: visitor tokens
		equals: #('|' 'x' '|' 'x' ':=' '<num>' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testBlock [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleBlock) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('[' '(' '<num>' '+' '<num>' ')' '.' ']' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testBlockWithArgs [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleBlockWithArgs) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('[' ':x' '|' '(' 'x' '+' '<num>' ')' '.' ']' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testBlockWithArgsAndTemp [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleBlockWithArgsAndTemp) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals:
			#('[' ':x' ':y' '|' '|' 'a' 'b' '|' 'a' ':=' '(' 'x' '+' '<num>' ')' '.' 'b' ':=' '(' 'y' '-' '<num>' ')' '.' '(' 'a' '*' 'b' ')' '.' ']' '.')
				asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testCharacter [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleCharacter) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleCharacter'.
	self
		assert: visitor tokens
		equals: #('<str>' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testClass [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleClass) ast acceptVisitor: visitor.
	self assert: visitor tokens equals: #('Array' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testCollect [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleCollect) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('(' 'self' 'collect:' '[' ':x' '|' 'x' '.' ']' ')' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testEmptyArray [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleEmptyArray) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleEmptyArray'.
	self assert: visitor tokens equals: #('#(' ')' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testEmptyArrayCurly [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleEmptyArrayCurly) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleEmptyArrayCurly'.
	self assert: visitor tokens equals: #('{' '}' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testInstanceVariable [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleInstanceVariable) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('anInstanceVariable' ':=' '<num>' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testMessageNoArgs [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleMessageNoArgs) ast acceptVisitor: visitor.
	self assert: visitor tokens equals: #('<num>' 'asInteger' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testMessageOneArg [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleMessageOneArg) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('(' 'Array' 'new:' '<num>' ')' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testMessageOperator [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleMessageOperator) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('(' '<num>' '+' '<num>' ')' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testMessageThreeArgs [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleMessageThreeArgs) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('(' 'Array' 'with:' '<num>' 'with:' '<num>' 'with:' '<num>' ')' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testMessageTwoArgs [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleMessageTwoArgs) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('(' 'Array' 'with:' '<num>' 'with:' '<num>' ')' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testNestedArrays [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleNestedArrays) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals:
			#('#(' '#(' '<num>' '<num>' '<num>' ')' '<str>' '#(' 'true' 'false' ')' ')' '.')
				asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testNestedArraysCurly [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleNestedArraysCurly) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals:
			#('{' '{' '<num>' '.' '<str>' '}' '.' 'true' '.' '{' 'false' '}' '}' '.')
				asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testNumber [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleNumber) ast acceptVisitor: visitor.
	self assert: visitor tokens equals: #('<num>' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testParentheses [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleParentheses) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleParentheses'.
	self
		assert: visitor tokens
		equals: #('(' '<num>' '*' '(' '<num>' '+' '<num>' ')' ')' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testReturn [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleReturn) ast acceptVisitor: visitor.
	self assert: visitor tokens equals: #('^' '<num>' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testSelf [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleSelf) ast acceptVisitor: visitor.
	self assert: visitor tokens equals: #('self' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testSequence [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleSequence) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals: #('<num>' '.' '#(' '<num>' '<num>' 'true' ')' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testSuper [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleSuper) ast acceptVisitor: visitor.
	self assert: visitor tokens equals: #('super' '.') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testSymbol [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleSymbol) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleSymbol'.
	self
		assert: visitor tokens
		equals: #('<str>' '.') asOrderedCollection.
	self assert: visitor arguments equals: #() asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testTemporary [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleTemporary) ast acceptVisitor: visitor.
	self assert: visitor tokens equals: #('|' 'x' 'y' 'z' '|') asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testTemporaryUsed [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleTemporaryUsed) ast acceptVisitor: visitor.
	self
		assert: visitor tokens
		equals:
			#('|' 'x' 'y' '|' 'x' ':=' '<num>' '.' 'y' ':=' '<num>' '.' '(' 'x' '+' 'y' ')' '.')
				asOrderedCollection
]

{ #category : #examples }
PharoTokenizingVisitorTest >> testWithArgs [
	| visitor |
	visitor := TokensCollectingVisitor new.
	(self class >> #exampleWithArgs:) ast acceptVisitor: visitor.
	self assert: visitor name equals: 'exampleWithArgs:'.
	self assert: visitor tokens equals: #('<num>' '.') asOrderedCollection.
	self assert: visitor arguments equals: #('anArg') asOrderedCollection
]
