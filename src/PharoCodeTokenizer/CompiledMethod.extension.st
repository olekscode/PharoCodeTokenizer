Extension { #name : #CompiledMethod }

{ #category : #'*PharoCodeTokenizer' }
CompiledMethod >> strings [ 
	| visitor |
	visitor := StringCollectingVisitor new.
	self ast acceptVisitor: visitor.
	^ visitor strings
]

{ #category : #'*PharoCodeTokenizer' }
CompiledMethod >> subtokens [ 
	| visitor |
	visitor := SubtokensCollectingVisitor new.
	self ast acceptVisitor: visitor.
	^ visitor tokens
]

{ #category : #'*PharoCodeTokenizer' }
CompiledMethod >> tokenTypes [
	| visitor |
	visitor := TokenTypesCollectingVisitor new.
	self ast acceptVisitor: visitor.
	^ visitor tokens
]

{ #category : #'*PharoCodeTokenizer' }
CompiledMethod >> tokens [ 
	| visitor |
	visitor := TokensCollectingVisitor new.
	self ast acceptVisitor: visitor.
	^ visitor tokens
]

{ #category : #'*PharoCodeTokenizer' }
CompiledMethod >> wordsFromIdentifierNames [
	| visitor |
	visitor := AlphabeticSubtokensCollectingVisitor new.
	self ast acceptVisitor: visitor.
	^ visitor tokens
]

{ #category : #'*PharoCodeTokenizer' }
CompiledMethod >> wordsFromSourceCode [
	"Collect individual words that compose identifier names, as well as words from strings and comments. Source code is turned into a sequence of lowercase words"
	| sourceCodeWithoutMethodName tokens alphabeticTokens lowercaseTokens |
	sourceCodeWithoutMethodName := self sourceCode lines copyWithoutFirst.
	tokens := (sourceCodeWithoutMethodName flatCollect: #substrings) flatCollect: #splitIdentifierName.
	alphabeticTokens := tokens select: #isAllLetters.
	lowercaseTokens := alphabeticTokens collect: #asLowercase.
	^ lowercaseTokens asOrderedCollection
]
