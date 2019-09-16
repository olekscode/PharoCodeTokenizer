Class {
	#name : #TokensTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable',
		'exampleClass'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #running }
TokensTest >> setUp [ 
	super setUp.
	exampleClass := CodeTokenizerExample.
]

{ #category : #tests }
TokensTest >> testAlphabeticCharacter [
	| method expected actual |
	method := exampleClass >> #exampleAlphabeticCharacter.
	expected := OrderedCollection withAll: #(X .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testArray [
	| method expected actual |
	method := exampleClass >> #exampleArray.
	expected := OrderedCollection withAll: #('{' '1' '.' 'hello' '.' 'true' '.' 'nil' '}' '.').
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testAssignment [
	| method expected actual |
	method := exampleClass >> #exampleAssignment.
	expected := OrderedCollection withAll: #(| variableName | variableName ':=' '2' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testBlock [
	| method expected actual |
	method := exampleClass >> #exampleBlock.
	expected := OrderedCollection withAll: #([ '1' + '2' . ] .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testBlockWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgs.
	expected := OrderedCollection withAll: #([ ':variableName' | variableName + '2' . ] .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testBlockWithArgsAndTemp [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgsAndTemp.
	expected := OrderedCollection withAll: #([ ':variableName' ':anotherVariableName' | 
	| argument1 argument2 |
	argument1 ':=' variableName + '1' .
	argument2 ':=' anotherVariableName - '1' .
	argument1 * argument2 . ] .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testCharacter [
	| method expected actual |
	method := exampleClass >> #exampleCharacter.
	expected := OrderedCollection withAll: #(, .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testClass [
	| method expected actual |
	method := exampleClass >> #exampleClass.
	expected := OrderedCollection withAll: #(OrderedCollection .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testCollect [
	| method expected actual |
	method := exampleClass >> #exampleCollect.
	expected := OrderedCollection withAll: #(self collect: [ ':variableName' | variableName . ] .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testComment [
	| method expected actual |
	method := exampleClass >> #exampleComment.
	expected := OrderedCollection withAll: #('first comment' 'multiline comment with a tab' 'hello' , '#()' collect: [ ':each' | each 'argument comment' . ] 'another comment' . [ '2' + '2' 'value comment' . ] ifTrue: [ | x | ^ '1' + '1' 'last block comment' . 'comment inside a block' ] 'block comment before temps' 'last comment' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testCommentEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleCommentEmptyMethod.
	expected := OrderedCollection withAll: #('this is a comment').
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testEmptyArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyArray.
	expected := OrderedCollection withAll: #({ } .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testEmptyLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyLiteralArray.
	expected := OrderedCollection withAll: #('#()' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleEmptyMethod.
	expected := OrderedCollection withAll: #().
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testInstanceVariable [
	| method expected actual |
	method := exampleClass >> #exampleInstanceVariable.
	expected := OrderedCollection withAll: #(anInstanceVariable ':=' '1' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArray.
	expected := OrderedCollection withAll: #('#(1 #hello true nil)' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testLiteralArrayWithStringAndSymbol [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArrayWithStringAndSymbol.
	expected := OrderedCollection withAll: #('#(#Hello #world ''Hello world'')' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testMessageNoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageNoArgs.
	expected := OrderedCollection withAll: #('2' asInteger .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testMessageOneArg [
	| method expected actual |
	method := exampleClass >> #exampleMessageOneArg.
	expected := OrderedCollection withAll: #(Array new: '2' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testMessageOperator [
	| method expected actual |
	method := exampleClass >> #exampleMessageOperator.
	expected := OrderedCollection withAll: #('1' + '2' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testMessageThreeArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageThreeArgs.
	expected := OrderedCollection withAll: #(Array with:with:with: '3' '4' '5' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testMessageTwoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageTwoArgs.
	expected := OrderedCollection withAll: #(Array with:with: '3' '4' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testNestedArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedArrays.
	expected := OrderedCollection withAll: #({ { '1' . hello } . 'true' . { 'false' } } .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testNestedLiteralArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedLiteralArrays.
	expected := OrderedCollection withAll: #('#(#(1 2 3) #hello #(true false))' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testNumber [
	| method expected actual |
	method := exampleClass >> #exampleNumber.
	expected := OrderedCollection withAll: #('5' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testParentheses [
	| method expected actual |
	method := exampleClass >> #exampleParentheses.
	expected := OrderedCollection withAll: #('2' * '3' + '4' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testReturn [
	| method expected actual |
	method := exampleClass >> #exampleReturn.
	expected := OrderedCollection withAll: #(^ '1' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testSelf [
	| method expected actual |
	method := exampleClass >> #exampleSelf.
	expected := OrderedCollection withAll: #(self .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testSequence [
	| method expected actual |
	method := exampleClass >> #exampleSequence.
	expected := OrderedCollection withAll: #('5' . '#(1 2 true)' .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testSuper [
	| method expected actual |
	method := exampleClass >> #exampleSuper.
	expected := OrderedCollection withAll: #(super .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testSymbol [
	| method expected actual |
	method := exampleClass >> #exampleSymbol.
	expected := OrderedCollection withAll: #(#hello .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testTemporary [
	| method expected actual |
	method := exampleClass >> #exampleTemporary.
	expected := OrderedCollection withAll: #(| temporaryVariable1 temporaryVariable2 temporaryVariable3 |).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testTemporaryUsed [
	| method expected actual |
	method := exampleClass >> #exampleTemporaryUsed.
	expected := OrderedCollection withAll: #(| tempVAR1 tempVAR2 |
	tempVAR1 ':=' '1'.
	tempVAR2 ':=' '2'.
	tempVAR1 + tempVAR2 .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testThisContext [
	| method expected actual |
	method := exampleClass >> #exampleThisContext.
	expected := OrderedCollection withAll: #(thisContext .).
	actual := method tokens.
	self assert: actual equals: expected
]

{ #category : #tests }
TokensTest >> testWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleWithArgs:.
	expected := OrderedCollection withAll: #(^ anArg + '5' .).
	actual := method tokens.
	self assert: actual equals: expected
]
