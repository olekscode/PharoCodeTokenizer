Class {
	#name : #TokenTypesTest,
	#superclass : #TestCase,
	#instVars : [
		'anInstanceVariable',
		'exampleClass'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #running }
TokenTypesTest >> setUp [ 
	super setUp.
	exampleClass := CodeTokenizerExample.
]

{ #category : #tests }
TokenTypesTest >> testAlphabeticCharacter [
	| method expected actual |
	method := exampleClass >> #exampleAlphabeticCharacter.
	expected := OrderedCollection withAll: #(CHR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testArray [
	| method expected actual |
	method := exampleClass >> #exampleArray.
	expected := OrderedCollection withAll: #(CB1 NUM DOT STR DOT TRU DOT NIL CB2 DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testAssignment [
	| method expected actual |
	method := exampleClass >> #exampleAssignment.
	expected := OrderedCollection withAll: #(PIP TMP PIP TMP ASS NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testBlock [
	| method expected actual |
	method := exampleClass >> #exampleBlock.
	expected := OrderedCollection withAll: #(SB1 NUM MSG NUM DOT SB2 DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testBlockWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgs.
	expected := OrderedCollection withAll: #(SB1 ARG PIP ARG MSG NUM DOT SB2 DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testBlockWithArgsAndTemp [
	| method expected actual |
	method := exampleClass >> #exampleBlockWithArgsAndTemp.
	expected := OrderedCollection withAll: #(SB1 ARG ARG PIP 
	PIP TMP TMP PIP
	TMP ASS ARG MSG NUM DOT
	TMP ASS ARG MSG NUM DOT
	TMP MSG TMP DOT SB2 DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testCharacter [
	| method expected actual |
	method := exampleClass >> #exampleCharacter.
	expected := OrderedCollection withAll: #(CHR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testClass [
	| method expected actual |
	method := exampleClass >> #exampleClass.
	expected := OrderedCollection withAll: #(CLS DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testCollect [
	| method expected actual |
	method := exampleClass >> #exampleCollect.
	expected := OrderedCollection withAll: #(VAR MSG SB1 ARG PIP ARG DOT SB2 DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testComment [
	| method expected actual |
	method := exampleClass >> #exampleComment.
	expected := OrderedCollection withAll: #(COM COM STR MSG ARR MSG SB1 ARG PIP ARG COM DOT SB2 COM DOT SB1 NUM MSG NUM COM DOT SB2 MSG SB1 PIP TMP PIP RET NUM MSG NUM COM DOT COM SB2 COM COM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testCommentEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleCommentEmptyMethod.
	expected := OrderedCollection withAll: #(COM).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testEmptyArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyArray.
	expected := OrderedCollection withAll: #(CB1 CB2 DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testEmptyLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleEmptyLiteralArray.
	expected := OrderedCollection withAll: #(ARR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testEmptyMethod [
	| method expected actual |
	method := exampleClass >> #exampleEmptyMethod.
	expected := OrderedCollection withAll: #().
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testGlobal [
	| method expected actual |
	method := exampleClass >> #exampleGlobal.
	expected := OrderedCollection withAll: #(GLB DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testInstanceVariable [
	| method expected actual |
	method := exampleClass >> #exampleInstanceVariable.
	expected := OrderedCollection withAll: #(VAR ASS NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testLiteralArray [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArray.
	expected := OrderedCollection withAll: #(ARR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testLiteralArrayWithStringAndSymbol [
	| method expected actual |
	method := exampleClass >> #exampleLiteralArrayWithStringAndSymbol.
	expected := OrderedCollection withAll: #(ARR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testMessageNoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageNoArgs.
	expected := OrderedCollection withAll: #(NUM MSG DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testMessageOneArg [
	| method expected actual |
	method := exampleClass >> #exampleMessageOneArg.
	expected := OrderedCollection withAll: #(CLS MSG NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testMessageOperator [
	| method expected actual |
	method := exampleClass >> #exampleMessageOperator.
	expected := OrderedCollection withAll: #(NUM MSG NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testMessageThreeArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageThreeArgs.
	expected := OrderedCollection withAll: #(CLS MSG NUM NUM NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testMessageTwoArgs [
	| method expected actual |
	method := exampleClass >> #exampleMessageTwoArgs.
	expected := OrderedCollection withAll: #(CLS MSG NUM NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testNestedArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedArrays.
	expected := OrderedCollection withAll: #(CB1 CB1 NUM DOT STR CB2 DOT TRU DOT CB1 FLS CB2 CB2 DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testNestedLiteralArrays [
	| method expected actual |
	method := exampleClass >> #exampleNestedLiteralArrays.
	expected := OrderedCollection withAll: #(ARR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testNumber [
	| method expected actual |
	method := exampleClass >> #exampleNumber.
	expected := OrderedCollection withAll: #(NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testParentheses [
	| method expected actual |
	method := exampleClass >> #exampleParentheses.
	expected := OrderedCollection withAll: #(NUM MSG NUM MSG NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testReturn [
	| method expected actual |
	method := exampleClass >> #exampleReturn.
	expected := OrderedCollection withAll: #(RET NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testSelf [
	| method expected actual |
	method := exampleClass >> #exampleSelf.
	expected := OrderedCollection withAll: #(VAR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testSequence [
	| method expected actual |
	method := exampleClass >> #exampleSequence.
	expected := OrderedCollection withAll: #(NUM DOT ARR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testSuper [
	| method expected actual |
	method := exampleClass >> #exampleSuper.
	expected := OrderedCollection withAll: #(VAR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testSymbol [
	| method expected actual |
	method := exampleClass >> #exampleSymbol.
	expected := OrderedCollection withAll: #(SYM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testTemporary [
	| method expected actual |
	method := exampleClass >> #exampleTemporary.
	expected := OrderedCollection withAll: #(PIP TMP TMP TMP PIP).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testTemporaryUsed [
	| method expected actual |
	method := exampleClass >> #exampleTemporaryUsed.
	expected := OrderedCollection withAll: #(PIP TMP TMP PIP
	TMP ASS NUM DOT
	TMP ASS NUM DOT
	TMP MSG TMP DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testThisContext [
	| method expected actual |
	method := exampleClass >> #exampleThisContext.
	expected := OrderedCollection withAll: #(VAR DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]

{ #category : #tests }
TokenTypesTest >> testWithArgs [
	| method expected actual |
	method := exampleClass >> #exampleWithArgs:.
	expected := OrderedCollection withAll: #(RET ARG MSG NUM DOT).
	actual := method tokenTypes.
	self assert: actual equals: expected
]
