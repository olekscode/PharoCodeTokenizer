Class {
	#name : #SubtokensCollectingVisitor,
	#superclass : #TokensCollectingVisitor,
	#category : #PharoCodeTokenizer
}

{ #category : #adding }
SubtokensCollectingVisitor >> addComments: aCollectionOfComments [
	"do nothing"
]

{ #category : #visiting }
SubtokensCollectingVisitor >> encodeLiteral: aLiteral [
	aLiteral isNumber
		ifTrue: [ ^ '<num>' ].
	aLiteral isSymbol
		ifTrue: [ ^ '<sym>' ].
	aLiteral isString
		ifTrue: [ ^ '<str>' ].
	aLiteral isCharacter 
		ifTrue: [ ^ '<chr>' ].
	^ aLiteral asString "true, false, or nil"
]

{ #category : #'as yet unclassified' }
SubtokensCollectingVisitor >> extractSubtokens: aString [
	^ (aString splitIdentifierName collect: #asLowercase) collect: [ :each |
		[ each asNumber. '<num>' ] on: Error do: [ each ] ]
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitArgumentNode: anArgumentNode [
	tokens addAll: (self extractSubtokens: anArgumentNode name asString)
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitBlockNode: aBlockNode [
	tokens add: '['.
	aBlockNode arguments do: [ :each |
		tokens add: ':'.
		each acceptVisitor: self  ].
	aBlockNode arguments size > 0
		ifTrue: [ tokens add: '|' ].
	aBlockNode body acceptVisitor: self.
	tokens add: ']'
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitGlobalNode: aGlobalNode [
	tokens addAll: (self extractSubtokens: aGlobalNode name asString)
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
		ifEmpty: [ tokens addAll: (self extractSubtokens: aMessageNode selector asString) ]
		ifNotEmpty: [
			(1 to: aMessageNode arguments size) do: [ :i | 
				tokens addAll: (self extractSubtokens: (aMessageNode selectorParts at: i) asString).
				(aMessageNode arguments at: i) acceptVisitor: self ] ].
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitTemporaryNode: aTemporaryNode [
	tokens addAll: (self extractSubtokens: aTemporaryNode name asString)
]

{ #category : #visiting }
SubtokensCollectingVisitor >> visitVariableNode: aVariableNode [
	tokens addAll: (self extractSubtokens: aVariableNode name asString)
]
