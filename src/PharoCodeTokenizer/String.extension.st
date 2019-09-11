Extension { #name : #String }

{ #category : #'*PharoCodeTokenizer' }
String >> isAllLetters [
	"Return whether the receiver is composed entirely of letters and has at least one letter"
	
	self do: [:c | c isLetter ifFalse: [^ false]].
	self ifEmpty: [^false].
	^ true
]
