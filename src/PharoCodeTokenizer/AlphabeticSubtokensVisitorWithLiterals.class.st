Class {
	#name : #AlphabeticSubtokensVisitorWithLiterals,
	#superclass : #AlphabeticSubtokensVisitor,
	#category : #PharoCodeTokenizer
}

{ #category : #visiting }
AlphabeticSubtokensVisitorWithLiterals >> visitLiteralArrayNode: aLiteralNode [
	tokens addAll: aLiteralNode value asString substrings
]

{ #category : #visiting }
AlphabeticSubtokensVisitorWithLiterals >> visitLiteralNode: aLiteralNode [
	tokens addAll: aLiteralNode value asString substrings
]
