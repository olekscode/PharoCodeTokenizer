Class {
	#name : #AlphabeticSubtokensVisitor,
	#superclass : #PharoTokenizingVisitor,
	#category : #PharoCodeTokenizer
}

{ #category : #visiting }
AlphabeticSubtokensVisitor >> visitAssignmentNode: anAssignement [
	tokens add: anAssignement variable name asString.
	anAssignement value acceptVisitor: self
]

{ #category : #visiting }
AlphabeticSubtokensVisitor >> visitBlockNode: aBlockNode [
	aBlockNode body acceptVisitor: self.
]

{ #category : #visiting }
AlphabeticSubtokensVisitor >> visitLiteralArrayNode: aLiteralNode [
	"do nothing"
]

{ #category : #visiting }
AlphabeticSubtokensVisitor >> visitLiteralNode: aLiteralNode [
	"do nothing"
]

{ #category : #visiting }
AlphabeticSubtokensVisitor >> visitMessageNode: aMessageNode [
	aMessageNode receiver acceptVisitor: self.
	
	aMessageNode arguments
		ifEmpty: [ tokens add: aMessageNode selector asString ]
		ifNotEmpty: [
			(1 to: aMessageNode arguments size) do: [ :i | 
				tokens add: (aMessageNode selectorParts at: i) asString.
				(aMessageNode arguments at: i) acceptVisitor: self ] ].
]

{ #category : #visiting }
AlphabeticSubtokensVisitor >> visitMethodNode: aMethodNode [
	super visitMethodNode: aMethodNode.
	tokens := tokens flatCollect: #splitIdentifierName.
	tokens := tokens select: #isAllLetters.
	tokens := tokens collect: #asLowercase
]

{ #category : #visiting }
AlphabeticSubtokensVisitor >> visitSequenceNode: aSequence [
	aSequence statements
		do: [ :each | each acceptVisitor: self ]
]
