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
	anAssignement value acceptVisitor: self
]

{ #category : #visiting }
AlphabeticSubtokensCollectingVisitor >> visitBlockNode: aBlockNode [
	aBlockNode body acceptVisitor: self.
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
	aMessageNode receiver acceptVisitor: self.
	
	aMessageNode arguments
		ifEmpty: [ tokens add: aMessageNode selector asString ]
		ifNotEmpty: [
			(1 to: aMessageNode arguments size) do: [ :i | 
				tokens add: (aMessageNode selectorParts at: i) asString.
				(aMessageNode arguments at: i) acceptVisitor: self ] ].
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
		do: [ :each | each acceptVisitor: self ]
]
