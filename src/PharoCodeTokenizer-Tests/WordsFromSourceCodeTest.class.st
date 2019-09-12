Class {
	#name : #WordsFromSourceCodeTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable',
		'exampleClass'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #running }
WordsFromSourceCodeTest >> setUp [ 
	super setUp.
	exampleClass := CodeTokenizerExample.
]

{ #category : #tests }
WordsFromSourceCodeTest >> testAlphabeticCharacter [
	| method expected actual |
	method := exampleClass >> #exampleAlphabeticCharacter.
	expected := OrderedCollection withAll: #(x).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testArray [
	| method expected actual |
	method := exampleClass >> #exampleArray.
	expected := OrderedCollection withAll: #(hello 'true' 'nil').
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testAssignment [
	| method expected actual |
	method := exampleClass >> #exampleAssignment.
	expected := OrderedCollection withAll: #(variable name variable name).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testBlock [
	| method expected actual |
	method := exampleClass >> #exampleBlock.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testBlockWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgs.
	expected := OrderedCollection withAll: #(variable name variable name).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testBlockWithArgsAndTemp [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgsAndTemp.
	expected := OrderedCollection withAll: #(variable name another variable name 
	argument argument
	argument variable name
	argument another variable name
	argument argument).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testCharacter [
	| method expected actual |
	method := exampleClass >> #exampleCharacter.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testClass [
	| method expected actual |
	method := exampleClass >> #exampleClass.
	expected := OrderedCollection withAll: #(ordered collection).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testCollect [
	| method expected actual |
	method := exampleClass >> #exampleCollect.
	expected := OrderedCollection withAll: #(self collect variable name variable name).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testComment [
	| method expected actual |
	method := exampleClass >> #exampleComment.
	expected := OrderedCollection withAll: #(this is a comment hello as string another comment).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testCommentEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleCommentEmptyMethod.
	expected := OrderedCollection withAll: #(this is a comment).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testEmptyArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyArray.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testEmptyLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyLiteralArray.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testInstanceVariable [
	| method expected actual |
	method := exampleClass >> #exampleInstanceVariable.
	expected := OrderedCollection withAll: #(an instance variable).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArray.
	expected := OrderedCollection withAll: #(hello 'true' 'nil').
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testMessageNoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageNoArgs.
	expected := OrderedCollection withAll: #(as integer).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testMessageOneArg [
	| method expected actual |
	method := exampleClass >> #exampleMessageOneArg.
	expected := OrderedCollection withAll: #(array new).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testMessageOperator [
	| method expected actual |
	method := exampleClass >> #exampleMessageOperator.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testMessageThreeArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageThreeArgs.
	expected := OrderedCollection withAll: #(array with with with).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testMessageTwoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageTwoArgs.
	expected := OrderedCollection withAll: #(array with with).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testNestedArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedArrays.
	expected := OrderedCollection withAll: #(hello 'true' 'false').
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testNestedLiteralArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedLiteralArrays.
	expected := OrderedCollection withAll: #(hello 'true' 'false').
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testNumber [
	| method expected actual |
	method := exampleClass >> #exampleNumber.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testParentheses [
	| method expected actual |
	method := exampleClass >> #exampleParentheses.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testReturn [
	| method expected actual |
	method := exampleClass >> #exampleReturn.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testSelf [
	| method expected actual |
	method := exampleClass >> #exampleSelf.
	expected := OrderedCollection withAll: #(self).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testSequence [
	| method expected actual |
	method := exampleClass >> #exampleSequence.
	expected := OrderedCollection withAll: #('true').
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testSuper [
	| method expected actual |
	method := exampleClass >> #exampleSuper.
	expected := OrderedCollection withAll: #(super).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testSymbol [
	| method expected actual |
	method := exampleClass >> #exampleSymbol.
	expected := OrderedCollection withAll: #(hello).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testTemporary [
	| method expected actual |
	method := exampleClass >> #exampleTemporary.
	expected := OrderedCollection withAll: #(temporary variable temporary variable temporary variable).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testTemporaryUsed [
	| method expected actual |
	method := exampleClass >> #exampleTemporaryUsed.
	expected := OrderedCollection withAll: #(temp var temp var
	temp var
	temp var
	temp var temp var).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testThisContext [
	| method expected actual |
	method := exampleClass >> #exampleThisContext.
	expected := OrderedCollection withAll: #(this context).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromSourceCodeTest >> testWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleWithArgs:.
	expected := OrderedCollection withAll: #(an arg).
	actual := method wordsFromSourceCode.
	self assert: actual equals: expected
]
