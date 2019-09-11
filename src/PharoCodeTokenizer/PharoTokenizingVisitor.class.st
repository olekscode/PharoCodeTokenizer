Class {
	#name : #PharoTokenizingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'name',
		'tokens',
		'arguments'
	],
	#category : #PharoCodeTokenizer
}

{ #category : #accessing }
PharoTokenizingVisitor >> arguments [
	^ arguments
]

{ #category : #initialization }
PharoTokenizingVisitor >> initialize [
	tokens := OrderedCollection new.
	arguments := OrderedCollection new
]

{ #category : #accessing }
PharoTokenizingVisitor >> name [
	^ name
]

{ #category : #visiting }
PharoTokenizingVisitor >> tokenizeLiteral: aLiteral [
	aLiteral isNumber
		ifTrue: [ ^ '<num>' ].
	aLiteral isString
		ifTrue: [ ^ '<str>' ].
	aLiteral isCharacter 
		ifTrue: [ ^ '<str>' ].
	^ aLiteral asString
]

{ #category : #accessing }
PharoTokenizingVisitor >> tokens [
	^ tokens
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitArgumentNode: anArgumentNode [
	tokens add: anArgumentNode name asString
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitArrayNode: aLiteralNode [
	tokens add: '{'.
	1 to: aLiteralNode children size - 1 do: [ :i | 
		(aLiteralNode children at: i) acceptVisitor: self.
		tokens add: '.' ].
	aLiteralNode children isEmpty
		ifFalse: [ aLiteralNode children last acceptVisitor: self ].
	tokens add: '}'
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitAssignmentNode: anAssignement [
	tokens
		add: anAssignement variable name asString;
		add: ':='.
	anAssignement value acceptVisitor: self
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitBlockNode: aBlockNode [
	tokens add: '['.
	aBlockNode arguments do: [ :each | tokens add: ':' , each name asString ].
	aBlockNode arguments size > 0
		ifTrue: [ tokens add: '|' ].
	aBlockNode body acceptVisitor: self.
	tokens add: ']'
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitGlobalNode: aGlobalNode [
	tokens add: aGlobalNode name asString
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitLiteralArrayNode: aLiteralNode [
	| literal |
	literal := aLiteralNode value.
	tokens add: '#('.
	literal do: [ :each |
		each isArray
			ifTrue: [ self visitLiteralArrayNode: each ]
			ifFalse: [ tokens add: (self tokenizeLiteral: each) ] ].
	tokens add: ')'
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitLiteralNode: aLiteralNode [
	| literal |
	literal := aLiteralNode value.
	tokens add: (self tokenizeLiteral: literal)
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitMessageNode: aMessageNode [
	| shouldBeInParentheses |
	shouldBeInParentheses := aMessageNode arguments size > 0.
	shouldBeInParentheses
		ifTrue: [ tokens add: '(' ].
	aMessageNode receiver acceptVisitor: self.
	aMessageNode arguments size = 0
		ifTrue: [ tokens add: aMessageNode selector asString ].
	1 to: aMessageNode arguments size do: [ :i | 
		tokens add: (aMessageNode selectorParts at: i) asString.
		(aMessageNode arguments at: i) acceptVisitor: self ].
	shouldBeInParentheses
		ifTrue: [ tokens add: ')' ]
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitMethodNode: aMethodNode [
	name := aMethodNode selector asString.
	aMethodNode children
		do: [ :each | 
			each class = RBArgumentNode
				ifTrue: [ arguments add: each name asString ].
			each class = RBSequenceNode
				ifTrue: [ each acceptVisitor: self ] ]
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitReturnNode: aReturnNode [
	tokens add: '^'.
	aReturnNode children do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitSequenceNode: aSequence [
	aSequence temporaries size > 0
		ifTrue: [ tokens add: '|'.
			aSequence temporaries do: [ :each | each acceptVisitor: self ].
			tokens add: '|' ].
	aSequence statements
		do: [ :each | 
			each acceptVisitor: self.
			tokens add: '.' ]
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitTemporaryNode: aTemporaryNode [
	tokens add: aTemporaryNode name asString
]

{ #category : #visiting }
PharoTokenizingVisitor >> visitVariableNode: aVariableNode [
	tokens add: aVariableNode name asString
]
