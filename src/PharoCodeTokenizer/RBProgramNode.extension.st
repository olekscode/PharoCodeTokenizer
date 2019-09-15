Extension { #name : #RBProgramNode }

{ #category : #'*PharoCodeTokenizer' }
RBProgramNode >> commentStrings [
	"A hack to put comments inside a block node in PharoCodeTokenizer. RBBlockNode node overrides this message"
	^ self comments collect: #contents
]
