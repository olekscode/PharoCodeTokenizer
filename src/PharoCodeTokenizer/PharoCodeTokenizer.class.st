Class {
	#name : #PharoCodeTokenizer,
	#superclass : #Object,
	#category : #PharoCodeTokenizer
}

{ #category : #parsing }
PharoCodeTokenizer >> tokenize: aMethod [

	| visitor |
	visitor := AlphabeticSubtokensVisitorWithLiterals new.
	aMethod ast acceptVisitor: visitor.
	
	^ visitor tokens.
]

{ #category : #parsing }
PharoCodeTokenizer >> tokenizeWithIdentifierNames: aMethod [
	^ (self tokenize: aMethod) flatCollect: [ :token |
		(token matchesRegex: '(\w|\:)+')
			ifTrue: (token splitIdentifierName)
			ifFalse: { token } ].
]
