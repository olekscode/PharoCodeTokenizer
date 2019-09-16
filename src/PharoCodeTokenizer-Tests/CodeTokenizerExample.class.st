Class {
	#name : #CodeTokenizerExample,
	#superclass : #Object,
	#instVars : [
		'anInstanceVariable'
	],
	#category : #'PharoCodeTokenizer-Tests'
}

{ #category : #examples }
CodeTokenizerExample >> exampleAlphabeticCharacter [
	$X
]

{ #category : #examples }
CodeTokenizerExample >> exampleArray [
	{1 . 'hello' . true . nil}
]

{ #category : #examples }
CodeTokenizerExample >> exampleAssignment [
	| variableName |
	variableName := 2
]

{ #category : #examples }
CodeTokenizerExample >> exampleBlock [
	[ 1 + 2 ]
]

{ #category : #examples }
CodeTokenizerExample >> exampleBlockWithArgs [
	[ :variableName | variableName + 2 ]
]

{ #category : #examples }
CodeTokenizerExample >> exampleBlockWithArgsAndTemp [
	[ :variableName :anotherVariableName | 
	| argument1 argument2 |
	argument1 := variableName + 1.
	argument2 := anotherVariableName - 1.
	argument1 * argument2 ]
]

{ #category : #examples }
CodeTokenizerExample >> exampleCharacter [
	$,
]

{ #category : #examples }
CodeTokenizerExample >> exampleClass [
	OrderedCollection
]

{ #category : #examples }
CodeTokenizerExample >> exampleCollect [
	self collect: [ :variableName | variableName ]
]

{ #category : #'as yet unclassified' }
CodeTokenizerExample >> exampleComment [
	"first comment"
	"multiline
	comment	with a tab"
	'hello', #() collect: [ :each | each "argument comment" ].
	"another comment"
	[ 2 + 2 "value comment" ] ifTrue: [
		"block comment before temps"
		| x |
		"comment inside a block".
		^ 1 + 1 .
		"last block comment" ]
	"last comment"
]

{ #category : #'as yet unclassified' }
CodeTokenizerExample >> exampleCommentEmptyMethod [
	"this is a comment"
]

{ #category : #examples }
CodeTokenizerExample >> exampleEmptyArray [
	{}
]

{ #category : #examples }
CodeTokenizerExample >> exampleEmptyLiteralArray [
	#()
]

{ #category : #'examples-simple' }
CodeTokenizerExample >> exampleEmptyMethod [
]

{ #category : #examples }
CodeTokenizerExample >> exampleGlobal [
	Transcript
]

{ #category : #examples }
CodeTokenizerExample >> exampleInstanceVariable [
	anInstanceVariable := 1
]

{ #category : #examples }
CodeTokenizerExample >> exampleLiteralArray [
	#(1 hello true nil)
]

{ #category : #examples }
CodeTokenizerExample >> exampleLiteralArrayWithStringAndSymbol [
	#(Hello world 'Hello world')
]

{ #category : #examples }
CodeTokenizerExample >> exampleMessageNoArgs [
	2 asInteger
]

{ #category : #examples }
CodeTokenizerExample >> exampleMessageOneArg [
	Array new: 2
]

{ #category : #examples }
CodeTokenizerExample >> exampleMessageOperator [
	1 + 2
]

{ #category : #examples }
CodeTokenizerExample >> exampleMessageThreeArgs [
	Array with: 3 with: 4 with: 5
]

{ #category : #examples }
CodeTokenizerExample >> exampleMessageTwoArgs [
	Array with: 3 with: 4
]

{ #category : #examples }
CodeTokenizerExample >> exampleNestedArrays [
	{ { 1 . 'hello' } . true . { false } }
]

{ #category : #examples }
CodeTokenizerExample >> exampleNestedLiteralArrays [
	#((1 2 3) hello (true false))
]

{ #category : #examples }
CodeTokenizerExample >> exampleNumber [
	5
]

{ #category : #examples }
CodeTokenizerExample >> exampleParentheses [
	2 * (3 + 4)
]

{ #category : #examples }
CodeTokenizerExample >> exampleReturn [
	^ 1
]

{ #category : #examples }
CodeTokenizerExample >> exampleSelf [
	self
]

{ #category : #examples }
CodeTokenizerExample >> exampleSequence [
	5.
	#(1 2 true)
]

{ #category : #examples }
CodeTokenizerExample >> exampleSuper [
	super
]

{ #category : #examples }
CodeTokenizerExample >> exampleSymbol [
	#hello
]

{ #category : #examples }
CodeTokenizerExample >> exampleTemporary [
	| temporaryVariable1 temporaryVariable2 temporaryVariable3 |
	
]

{ #category : #examples }
CodeTokenizerExample >> exampleTemporaryUsed [
	| tempVAR1 tempVAR2 |
	tempVAR1 := 1.
	tempVAR2 := 2.
	tempVAR1 + tempVAR2
]

{ #category : #examples }
CodeTokenizerExample >> exampleThisContext [
	thisContext
]

{ #category : #examples }
CodeTokenizerExample >> exampleWithArgs: anArg [
	^ anArg + 5
]
