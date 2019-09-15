Class {
	#name : #TokenTypesCollectingVisitor,
	#superclass : #TokensCollectingVisitor,
	#category : #PharoCodeTokenizer
}

{ #category : #encoding }
TokenTypesCollectingVisitor >> encodeLiteral: aLiteral [
	aLiteral isNumber
		ifTrue: [ ^ 'NUM' ].
	aLiteral isSymbol
		ifTrue: [ ^ 'SYM' ].
	aLiteral isString
		ifTrue: [ ^ 'STR' ].
	aLiteral isCharacter 
		ifTrue: [ ^ 'CHR' ].
	aLiteral ifNil: [ ^ 'NIL' ].
	aLiteral ifTrue: [ ^ 'TRU' ].
	aLiteral ifFalse: [ ^ 'FLS' ].
	^ aLiteral asString
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitArgumentNode: anArgumentNode [
	tokens add: 'ARG'
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitArrayNode: aLiteralNode [
	tokens add: 'CB1'.
	1 to: aLiteralNode children size - 1 do: [ :i | 
		(aLiteralNode children at: i) acceptVisitor: self.
		tokens add: 'DOT' ].
	aLiteralNode children isEmpty
		ifFalse: [ aLiteralNode children last acceptVisitor: self ].
	tokens add: 'CB2'
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitAssignmentNode: anAssignment [
	anAssignment variable acceptVisitor: self.
	tokens add: 'ASS'.
	anAssignment value acceptVisitor: self
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitBlockNode: aBlockNode [
	tokens add: 'SB1'.
	aBlockNode arguments do: [ :each | each acceptVisitor: self ].
	aBlockNode arguments size > 0
		ifTrue: [ tokens add: 'PIP' ].
	aBlockNode comments do: [ :each | tokens add: 'COM' ].
	aBlockNode body acceptVisitor: self.
	tokens add: 'SB2'
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitGlobalNode: aGlobalNode [
	tokens add: 'GLB'
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitLiteralArrayNode: aLiteralNode [
	tokens add: 'ARR'.
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitLiteralNode: aLiteralNode [
	tokens add: (self encodeLiteral: aLiteralNode value)
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitMessageNode: aMessageNode [
	aMessageNode receiver acceptVisitor: self.
	tokens add: 'MSG'.
	aMessageNode arguments do: [ :each | each acceptVisitor: self ].
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitMethodNode: aMethodNode [
	aMethodNode comments do: [ :each | tokens add: 'COM' ].
	
	aMethodNode children
		do: [ :each |
			each class = RBSequenceNode
				ifTrue: [ self visitNode: each ] ]
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitReturnNode: aReturnNode [
	tokens add: 'RET'.
	aReturnNode children do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitSequenceNode: aSequence [
	aSequence temporaries size > 0
		ifTrue: [ tokens add: 'PIP'.
			aSequence temporaries do: [ :each | each acceptVisitor: self ].
			tokens add: 'PIP' ].
	aSequence statements
		do: [ :each | 
			each acceptVisitor: self.
			tokens add: 'DOT'.
			each commentStrings do: [ :comment | tokens add: 'COM' ] ]
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitTemporaryNode: aTemporaryNode [
	tokens add: 'TMP'
]

{ #category : #visiting }
TokenTypesCollectingVisitor >> visitVariableNode: aVariableNode [
	tokens add: 'VAR'
]
