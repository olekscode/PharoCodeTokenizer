Extension { #name : #RBBlockNode }

{ #category : #'*PharoCodeTokenizer' }
RBBlockNode >> commentStrings [ 
	"A hack to put comments inside a block node in PharoCodeTokenizer. Returns an empty collection of comments. Now our visitor can call RBBlockNode >> #comments"
	^ OrderedCollection new
]
