Class {
	#name : #CommentCollectingVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'comments'
	],
	#category : #PharoCodeTokenizer
}

{ #category : #initialization }
CommentCollectingVisitor >> comments [ 	
	^ comments
]

{ #category : #initialization }
CommentCollectingVisitor >> initialize [ 
	super initialize.
	comments := OrderedCollection new.
]

{ #category : #initialization }
CommentCollectingVisitor >> visitMethodNode: aNode [
	self comments addAll: (aNode comments collect: #contents).
	super visitMethodNode: aNode.
]

{ #category : #initialization }
CommentCollectingVisitor >> visitNode: aNode [
	super visitNode: aNode.
	self comments addAll: (aNode comments collect: #contents).
]
