Class {
	#name : #StringCollectingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'strings'
	],
	#category : #PharoCodeTokenizer
}

{ #category : #initialization }
StringCollectingVisitor >> initialize [ 	
	super initialize.
	strings := OrderedCollection new.
]

{ #category : #accessing }
StringCollectingVisitor >> strings [
	^ strings
]

{ #category : #accessing }
StringCollectingVisitor >> strings: anObject [
	strings := anObject
]

{ #category : #initialization }
StringCollectingVisitor >> visitLiteralNode: aLiteralNode [
	| value |
	value := aLiteralNode value.
	
	value isString ifTrue: [
		value isSymbol ifFalse: [ 
			self strings add: value ] ]
]
