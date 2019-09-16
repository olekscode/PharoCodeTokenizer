Class {
	#name : #WordsFromIdentifierNamesTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable',
		'exampleClass'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #running }
WordsFromIdentifierNamesTest >> setUp [ 
	super setUp.
	exampleClass := CodeTokenizerExample.
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testAlphabeticCharacter [
	| method expected actual |
	method := exampleClass >> #exampleAlphabeticCharacter.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testArray [
	| method expected actual |
	method := exampleClass >> #exampleArray.
	expected := OrderedCollection withAll: #('true' 'nil').
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testAssignment [
	| method expected actual |
	method := exampleClass >> #exampleAssignment.
	expected := OrderedCollection withAll: #(variable name).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testBlock [
	| method expected actual |
	method := exampleClass >> #exampleBlock.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testBlockWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgs.
	expected := OrderedCollection withAll: #(variable name).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testBlockWithArgsAndTemp [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgsAndTemp.
	expected := OrderedCollection withAll: #( 
	argument variable name
	argument another variable name
	argument argument).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testCharacter [
	| method expected actual |
	method := exampleClass >> #exampleCharacter.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testClass [
	| method expected actual |
	method := exampleClass >> #exampleClass.
	expected := OrderedCollection withAll: #(ordered collection).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testCollect [
	| method expected actual |
	method := exampleClass >> #exampleCollect.
	expected := OrderedCollection withAll: #(self collect variable name).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testComment [
	| method expected actual |
	method := exampleClass >> #exampleComment.
	expected := OrderedCollection withAll: #(collect each if 'true').
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testCommentEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleCommentEmptyMethod.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testEmptyArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyArray.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testEmptyLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyLiteralArray.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleEmptyMethod.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testInstanceVariable [
	| method expected actual |
	method := exampleClass >> #exampleInstanceVariable.
	expected := OrderedCollection withAll: #(an instance variable).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArray.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testLiteralArrayWithStringAndSymbol [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArrayWithStringAndSymbol.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testMessageNoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageNoArgs.
	expected := OrderedCollection withAll: #(as integer).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testMessageOneArg [
	| method expected actual |
	method := exampleClass >> #exampleMessageOneArg.
	expected := OrderedCollection withAll: #(array new).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testMessageOperator [
	| method expected actual |
	method := exampleClass >> #exampleMessageOperator.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testMessageThreeArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageThreeArgs.
	expected := OrderedCollection withAll: #(array with with with).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testMessageTwoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageTwoArgs.
	expected := OrderedCollection withAll: #(array with with).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testNestedArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedArrays.
	expected := OrderedCollection withAll: #('true' 'false').
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testNestedLiteralArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedLiteralArrays.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testNumber [
	| method expected actual |
	method := exampleClass >> #exampleNumber.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testParentheses [
	| method expected actual |
	method := exampleClass >> #exampleParentheses.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testReturn [
	| method expected actual |
	method := exampleClass >> #exampleReturn.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testSelf [
	| method expected actual |
	method := exampleClass >> #exampleSelf.
	expected := OrderedCollection withAll: #(self).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testSequence [
	| method expected actual |
	method := exampleClass >> #exampleSequence.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testSuper [
	| method expected actual |
	method := exampleClass >> #exampleSuper.
	expected := OrderedCollection withAll: #(super).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testSymbol [
	| method expected actual |
	method := exampleClass >> #exampleSymbol.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testTemporary [
	| method expected actual |
	method := exampleClass >> #exampleTemporary.
	expected := OrderedCollection withAll: #().
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testTemporaryUsed [
	| method expected actual |
	method := exampleClass >> #exampleTemporaryUsed.
	expected := OrderedCollection withAll: #(
	temp var
	temp var
	temp var temp var).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testThisContext [
	| method expected actual |
	method := exampleClass >> #exampleThisContext.
	expected := OrderedCollection withAll: #(this context).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]

{ #category : #tests }
WordsFromIdentifierNamesTest >> testWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleWithArgs:.
	expected := OrderedCollection withAll: #(an arg).
	actual := method wordsFromIdentifierNames.
	self assert: actual equals: expected
]
