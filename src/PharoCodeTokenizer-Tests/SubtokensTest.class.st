Class {
	#name : #SubtokensTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable',
		'exampleClass'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #running }
SubtokensTest >> setUp [ 
	super setUp.
	exampleClass := CodeTokenizerExample.
]

{ #category : #tests }
SubtokensTest >> testArray [
	| method expected actual |
	method := exampleClass >> #exampleArray.
	expected := OrderedCollection withAll: #('{' '<num>' '.' '<str>' '.' 'true' '.' 'nil' '}' '.').
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testAssignment [
	| method expected actual |
	method := exampleClass >> #exampleAssignment.
	expected := OrderedCollection withAll: #(| variable name | variable name ':=' '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testBlock [
	| method expected actual |
	method := exampleClass >> #exampleBlock.
	expected := OrderedCollection withAll: #([ '<num>' + '<num>' . ] .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testBlockWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgs.
	expected := OrderedCollection withAll: #([ : variable name | variable name + '<num>' . ] .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testBlockWithArgsAndTemp [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgsAndTemp.
	expected := OrderedCollection withAll: #([ : variable name : another variable name | 
	| argument '<num>' argument '<num>' |
	argument '<num>' ':=' variable name + '<num>' .
	argument '<num>' ':=' another variable name - '<num>' .
	argument '<num>' * argument '<num>' . ] .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testCharacter [
	| method expected actual |
	method := exampleClass >> #exampleCharacter.
	expected := OrderedCollection withAll: #('<chr>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testClass [
	| method expected actual |
	method := exampleClass >> #exampleClass.
	expected := OrderedCollection withAll: #(array .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testCollect [
	| method expected actual |
	method := exampleClass >> #exampleCollect.
	expected := OrderedCollection withAll: #(self collect : [ : variable name | variable name . ] .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testEmptyArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyArray.
	expected := OrderedCollection withAll: #({ } .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testEmptyLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyLiteralArray.
	expected := OrderedCollection withAll: #('<arr>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testInstanceVariable [
	| method expected actual |
	method := exampleClass >> #exampleInstanceVariable.
	expected := OrderedCollection withAll: #(an instance variable ':=' '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArray.
	expected := OrderedCollection withAll: #('<arr>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testMessageNoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageNoArgs.
	expected := OrderedCollection withAll: #('<num>' as integer .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testMessageOneArg [
	| method expected actual |
	method := exampleClass >> #exampleMessageOneArg.
	expected := OrderedCollection withAll: #(array new : '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testMessageOperator [
	| method expected actual |
	method := exampleClass >> #exampleMessageOperator.
	expected := OrderedCollection withAll: #('<num>' + '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testMessageThreeArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageThreeArgs.
	expected := OrderedCollection withAll: #(array with : '<num>' with : '<num>' with : '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testMessageTwoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageTwoArgs.
	expected := OrderedCollection withAll: #(array with : '<num>' with : '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testNestedArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedArrays.
	expected := OrderedCollection withAll: #({ { '<num>' . '<str>' } . 'true' . { 'false' } } .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testNestedLiteralArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedLiteralArrays.
	expected := OrderedCollection withAll: #('<arr>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testNumber [
	| method expected actual |
	method := exampleClass >> #exampleNumber.
	expected := OrderedCollection withAll: #('<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testParentheses [
	| method expected actual |
	method := exampleClass >> #exampleParentheses.
	expected := OrderedCollection withAll: #('<num>' * '<num>' + '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testReturn [
	| method expected actual |
	method := exampleClass >> #exampleReturn.
	expected := OrderedCollection withAll: #(^ '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testSelf [
	| method expected actual |
	method := exampleClass >> #exampleSelf.
	expected := OrderedCollection withAll: #(self .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testSequence [
	| method expected actual |
	method := exampleClass >> #exampleSequence.
	expected := OrderedCollection withAll: #('<num>' . '<arr>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testSuper [
	| method expected actual |
	method := exampleClass >> #exampleSuper.
	expected := OrderedCollection withAll: #(super .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testSymbol [
	| method expected actual |
	method := exampleClass >> #exampleSymbol.
	expected := OrderedCollection withAll: #('<sym>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testTemporary [
	| method expected actual |
	method := exampleClass >> #exampleTemporary.
	expected := OrderedCollection withAll: #(| temporary variable '<num>' temporary variable '<num>' temporary variable '<num>' |).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testTemporaryUsed [
	| method expected actual |
	method := exampleClass >> #exampleTemporaryUsed.
	expected := OrderedCollection withAll: #(| temp var '<num>' temp var '<num>' |
	temp var '<num>' ':=' '<num>' .
	temp var '<num>' ':=' '<num>' .
	temp var '<num>' + temp var '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testThisContext [
	| method expected actual |
	method := exampleClass >> #exampleThisContext.
	expected := OrderedCollection withAll: #(this context .).
	actual := method subtokens.
	self assert: actual equals: expected
]

{ #category : #tests }
SubtokensTest >> testWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleWithArgs:.
	expected := OrderedCollection withAll: #(^ an arg + '<num>' .).
	actual := method subtokens.
	self assert: actual equals: expected
]
