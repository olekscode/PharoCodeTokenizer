Extension { #name : #RBProgramNode }

{ #category : #'*PharoCodeTokenizer' }
RBProgramNode >> commentStrings [
	"A hack to put comments inside a block node in PharoCodeTokenizer. RBBlockNode node overrides this message"
	^ self commentsAsCleanStrings
]

{ #category : #'*PharoCodeTokenizer' }
RBProgramNode >> commentsAsCleanStrings [
	"Remove tabs and newlines from the contents of comments"
	^ self comments collect: [ :each |
		' ' join: each contents substrings ]
]
