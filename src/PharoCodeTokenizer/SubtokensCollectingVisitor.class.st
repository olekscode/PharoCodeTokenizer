Class {
	#name : #SubtokensCollectingVisitor,
	#superclass : #TokensCollectingVisitor,
	#category : #PharoCodeTokenizer
}

{ #category : #visiting }
SubtokensCollectingVisitor >> encodeLiteral: aLiteral [
	aLiteral isNumber
		ifTrue: [ ^ '<num>' ].
	aLiteral isString
		ifTrue: [ ^ '<str>' ].
	aLiteral isCharacter 
		ifTrue: [ ^ '<chr>' ].
	^ '<unk>'
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitLiteralArrayNode: aLiteralNode [
	tokens add: '<arr>'
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitLiteralNode: aLiteralNode [
	tokens add: (self encodeLiteral: aLiteralNode value)
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitMessageNode: aMessageNode [
	aMessageNode receiver acceptVisitor: self.
	
	aMessageNode arguments
		ifEmpty: [ tokens add: aMessageNode selector asString ]
		ifNotEmpty: [
			(1 to: aMessageNode arguments size) do: [ :i | 
				tokens add: (aMessageNode selectorParts at: i) asString.
				(aMessageNode arguments at: i) acceptVisitor: self ] ].
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitMethodNode: aMethodNode [
	super visitMethodNode: aMethodNode.
	tokens := tokens flatCollect: [ :token | 
		(#('<num>' '<str>' '<chr>' '<arr>' '<unk>') includes: token)
			ifTrue: [ { token } ]
			ifFalse: [ token splitIdentifierName collect: #asLowercase ] ].
]
