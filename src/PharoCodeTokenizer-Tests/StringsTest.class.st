Class {
	#name : #StringsTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable',
		'exampleClass'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #running }
StringsTest >> setUp [ 
	super setUp.
	exampleClass := CodeTokenizerExample.
]

{ #category : #tests }
StringsTest >> testAlphabeticCharacter [
	| method expected actual |
	method := exampleClass >> #exampleAlphabeticCharacter.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testArray [
	| method expected actual |
	method := exampleClass >> #exampleArray.
	expected := OrderedCollection withAll: #(hello).
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testAssignment [
	| method expected actual |
	method := exampleClass >> #exampleAssignment.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testBlock [
	| method expected actual |
	method := exampleClass >> #exampleBlock.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testBlockWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgs.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testBlockWithArgsAndTemp [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgsAndTemp.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testCharacter [
	| method expected actual |
	method := exampleClass >> #exampleCharacter.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testClass [
	| method expected actual |
	method := exampleClass >> #exampleClass.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testCollect [
	| method expected actual |
	method := exampleClass >> #exampleCollect.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testComment [
	| method expected actual |
	method := exampleClass >> #exampleComment.
	expected := OrderedCollection withAll: #(hello).
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testCommentEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleCommentEmptyMethod.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testEmptyArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyArray.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testEmptyLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyLiteralArray.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleEmptyMethod.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testInstanceVariable [
	| method expected actual |
	method := exampleClass >> #exampleInstanceVariable.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArray.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testMessageNoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageNoArgs.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testMessageOneArg [
	| method expected actual |
	method := exampleClass >> #exampleMessageOneArg.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testMessageOperator [
	| method expected actual |
	method := exampleClass >> #exampleMessageOperator.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testMessageThreeArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageThreeArgs.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testMessageTwoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageTwoArgs.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testNestedArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedArrays.
	expected := OrderedCollection withAll: #(hello).
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testNestedLiteralArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedLiteralArrays.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testNumber [
	| method expected actual |
	method := exampleClass >> #exampleNumber.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testParentheses [
	| method expected actual |
	method := exampleClass >> #exampleParentheses.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testReturn [
	| method expected actual |
	method := exampleClass >> #exampleReturn.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testSelf [
	| method expected actual |
	method := exampleClass >> #exampleSelf.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testSequence [
	| method expected actual |
	method := exampleClass >> #exampleSequence.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testSuper [
	| method expected actual |
	method := exampleClass >> #exampleSuper.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testSymbol [
	| method expected actual |
	method := exampleClass >> #exampleSymbol.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testTemporary [
	| method expected actual |
	method := exampleClass >> #exampleTemporary.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testTemporaryUsed [
	| method expected actual |
	method := exampleClass >> #exampleTemporaryUsed.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testThisContext [
	| method expected actual |
	method := exampleClass >> #exampleThisContext.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]

{ #category : #tests }
StringsTest >> testWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleWithArgs:.
	expected := OrderedCollection withAll: #().
	actual := method strings.
	self assert: actual equals: expected
]
