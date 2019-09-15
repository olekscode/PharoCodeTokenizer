Class {
	#name : #CommentsTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable',
		'exampleClass'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #running }
CommentsTest >> setUp [ 
	super setUp.
	exampleClass := CodeTokenizerExample.
]

{ #category : #tests }
CommentsTest >> testAlphabeticCharacter [
	| method expected actual |
	method := exampleClass >> #exampleAlphabeticCharacter.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testArray [
	| method expected actual |
	method := exampleClass >> #exampleArray.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testAssignment [
	| method expected actual |
	method := exampleClass >> #exampleAssignment.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testBlock [
	| method expected actual |
	method := exampleClass >> #exampleBlock.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testBlockWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgs.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testBlockWithArgsAndTemp [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgsAndTemp.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testCharacter [
	| method expected actual |
	method := exampleClass >> #exampleCharacter.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testClass [
	| method expected actual |
	method := exampleClass >> #exampleClass.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testCollect [
	| method expected actual |
	method := exampleClass >> #exampleCollect.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testComment [
	| method expected actual |
	method := exampleClass >> #exampleComment.
	expected := OrderedCollection withAll: #(
		'this is a comment'
		'another comment'
		'comment inside a block').
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testCommentEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleCommentEmptyMethod.
	expected := OrderedCollection withAll: #('this is a comment').
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testEmptyArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyArray.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testEmptyLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyLiteralArray.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleEmptyMethod.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testInstanceVariable [
	| method expected actual |
	method := exampleClass >> #exampleInstanceVariable.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArray.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testMessageNoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageNoArgs.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testMessageOneArg [
	| method expected actual |
	method := exampleClass >> #exampleMessageOneArg.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testMessageOperator [
	| method expected actual |
	method := exampleClass >> #exampleMessageOperator.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testMessageThreeArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageThreeArgs.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testMessageTwoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageTwoArgs.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testNestedArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedArrays.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testNestedLiteralArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedLiteralArrays.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testNumber [
	| method expected actual |
	method := exampleClass >> #exampleNumber.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testParentheses [
	| method expected actual |
	method := exampleClass >> #exampleParentheses.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testReturn [
	| method expected actual |
	method := exampleClass >> #exampleReturn.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testSelf [
	| method expected actual |
	method := exampleClass >> #exampleSelf.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testSequence [
	| method expected actual |
	method := exampleClass >> #exampleSequence.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testSuper [
	| method expected actual |
	method := exampleClass >> #exampleSuper.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testSymbol [
	| method expected actual |
	method := exampleClass >> #exampleSymbol.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testTemporary [
	| method expected actual |
	method := exampleClass >> #exampleTemporary.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testTemporaryUsed [
	| method expected actual |
	method := exampleClass >> #exampleTemporaryUsed.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testThisContext [
	| method expected actual |
	method := exampleClass >> #exampleThisContext.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]

{ #category : #tests }
CommentsTest >> testWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleWithArgs:.
	expected := OrderedCollection withAll: #().
	actual := method comments.
	self assert: actual equals: expected
]
