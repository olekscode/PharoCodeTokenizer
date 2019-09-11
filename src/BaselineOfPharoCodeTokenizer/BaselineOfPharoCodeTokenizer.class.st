Class {
	#name : #BaselineOfPharoCodeTokenizer,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoCodeTokenizer
}

{ #category : #baselines }
BaselineOfPharoCodeTokenizer >> baselineOf: spec [ 
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'IdentifierNameSplitter'
			with: [ spec repository: 'github://olekscode/IdentifierNameSplitter/src' ].
				
		"Packages"
		spec 
			package: 'PharoCodeTokenizer' with: [ spec requires: #(IdentifierNameSplitter) ];
			package: 'PharoCodeTokenizer-Tests' with: [ spec requires: #(PharoCodeTokenizer) ]].
]
