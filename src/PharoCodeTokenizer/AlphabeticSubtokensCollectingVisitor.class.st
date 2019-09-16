Class {
	#name : #AlphabeticSubtokensCollectingVisitor,
	#superclass : #TokensCollectingVisitor,
	#category : #PharoCodeTokenizer
}

{ #category : #adding }
AlphabeticSubtokensCollectingVisitor >> addComments: aCollectionOfComments [
	"do nothing"
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitAssignmentNode: anAssignement [
	tokens add: anAssignement variable name asString.
	self visitNode: anAssignement value
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitBlockNode: aBlockNode [
	self visitNode: aBlockNode body.
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitLiteralArrayNode: aLiteralNode [
	"do nothing"
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitLiteralNode: aLiteralNode [
	(#(true false nil) includes: aLiteralNode value)
		ifTrue: [ tokens add: aLiteralNode value asString ].	
	"do nothing if it is string, symbol, or number"
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitMessageNode: aMessageNode [
	self visitNode: aMessageNode receiver.
	
	aMessageNode arguments
		ifEmpty: [ tokens add: aMessageNode selector asString ]
		ifNotEmpty: [
			(1 to: aMessageNode arguments size) do: [ :i | 
				tokens add: (aMessageNode selectorParts at: i) asString.
				self visitNode: (aMessageNode arguments at: i) ] ].
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitMethodNode: aMethodNode [
	super visitMethodNode: aMethodNode.
	tokens := tokens flatCollect: #splitIdentifierName.
	tokens := tokens select: #isAllLetters.
	tokens := tokens collect: #asLowercase
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitSequenceNode: aSequence [
	aSequence statements
		do: [ :each | self visitNode: each ]
]
