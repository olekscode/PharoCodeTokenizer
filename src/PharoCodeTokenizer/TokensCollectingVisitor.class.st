Class {
	#name : #TokensCollectingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'tokens'
	],
	#category : #PharoCodeTokenizer
}

{ #category : #initialization }
TokensCollectingVisitor >> initialize [
	super initialize.
	tokens := OrderedCollection new.
]

{ #category : #accessing }
TokensCollectingVisitor >> tokens [
	^ tokens
]

{ #category : #visiting }
TokensCollectingVisitor >> visitArgumentNode: anArgumentNode [
	tokens add: anArgumentNode name asString
]

{ #category : #visiting }
TokensCollectingVisitor >> visitArrayNode: aLiteralNode [
	tokens add: '{'.
	1 to: aLiteralNode children size - 1 do: [ :i | 
		(aLiteralNode children at: i) acceptVisitor: self.
		tokens add: '.' ].
	aLiteralNode children isEmpty
		ifFalse: [ aLiteralNode children last acceptVisitor: self ].
	tokens add: '}'
]

{ #category : #visiting }
TokensCollectingVisitor >> visitAssignmentNode: anAssignment [
	anAssignment variable acceptVisitor: self.
	tokens add: ':='.
	anAssignment value acceptVisitor: self
]

{ #category : #visiting }
TokensCollectingVisitor >> visitBlockNode: aBlockNode [
	tokens add: '['.
	aBlockNode arguments do: [ :each | tokens add: ':' , each name asString ].
	aBlockNode arguments size > 0
		ifTrue: [ tokens add: '|' ].
	aBlockNode body acceptVisitor: self.
	tokens add: ']'
]

{ #category : #visiting }
TokensCollectingVisitor >> visitGlobalNode: aGlobalNode [
	tokens add: aGlobalNode name asString
]

{ #category : #visiting }
TokensCollectingVisitor >> visitLiteralArrayNode: aLiteralNode [
	tokens add: aLiteralNode value asString.
]

{ #category : #visiting }
TokensCollectingVisitor >> visitLiteralNode: aLiteralNode [
	tokens add: aLiteralNode value asString
]

{ #category : #visiting }
TokensCollectingVisitor >> visitMessageNode: aMessageNode [
	aMessageNode receiver acceptVisitor: self.
	tokens add: aMessageNode selector asString.
	aMessageNode arguments do: [ :each | each acceptVisitor: self ].
]

{ #category : #visiting }
TokensCollectingVisitor >> visitMethodNode: aMethodNode [
	aMethodNode children
		do: [ :each | 
			each class = RBSequenceNode
				ifTrue: [ each acceptVisitor: self ] ]
]

{ #category : #visiting }
TokensCollectingVisitor >> visitReturnNode: aReturnNode [
	tokens add: '^'.
	aReturnNode children do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
TokensCollectingVisitor >> visitSequenceNode: aSequence [
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
TokensCollectingVisitor >> visitTemporaryNode: aTemporaryNode [
	tokens add: aTemporaryNode name asString
]

{ #category : #visiting }
TokensCollectingVisitor >> visitVariableNode: aVariableNode [
	tokens add: aVariableNode name asString
]
