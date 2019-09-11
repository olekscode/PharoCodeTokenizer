Class {
	#name : #PharoCodeTokenizer,
	#superclass : #Object,
	#category : #PharoCodeTokenizer
}

{ #category : #parsing }
PharoCodeTokenizer >> tokenize: aMethod [

	| visitor |
	visitor := PharoTokenizingVisitor new.
	aMethod ast acceptVisitor: visitor.
	
	^ visitor tokens.
]

{ #category : #parsing }
PharoCodeTokenizer >> tokenizeWithIdentifierNames: aMethod [
	| nameTokenizer |
	nameTokenizer := IdentifierNameTokenizer new.
	
	^ (self tokenize: aMethod) flatCollect: [ :token |
		(token matchesRegex: '(\w|\:)+')
			ifTrue: (nameTokenizer tokenize: token)
			ifFalse: { token } ].
]
