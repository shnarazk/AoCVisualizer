"
I am a class to visualize AoC _problems_, I mean data.
"
Class {
	#name : 'AoCView',
	#superclass : 'SpPresenter',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'baseDirectory',
		'updateButton',
		'update',
		'title',
		'graph',
		'memo',
		'memoLabel'
	],
	#category : 'AoCVisualizer',
	#package : 'AoCVisualizer'
}

{ #category : 'initialization' }
AoCView >> connectPresenters [

   updateButton action: [ update ifNotNil: [ update value ]]
]

{ #category : 'layout' }
AoCView >> defaultLayout [

   | box |
   box := SpBoxLayout newVertical.
   box add: memoLabel expand: false; add: graph; add: updateButton expand: false.
   ^ box
]

{ #category : 'initialization' }
AoCView >> initialize [

   super initialize.
   title := 'AoC visualizer'.
   baseDirectory := (Smalltalk os environment at: 'HOME') asPath / 'Repositories/advent-of-code/tmp'
]

{ #category : 'initialization' }
AoCView >> initializePresenters [

   graph := self newRoassal.
   updateButton := self newButton.
   "Get all iconnames by Smalltalk ui icons"
   updateButton label: 'Update'; icon: (self iconNamed: #smallUpdate).
   memoLabel := self newLabel.

]

{ #category : 'initialization' }
AoCView >> initializeWindow: aWindowPresenter [
aWindowPresenter title: title; initialExtent: 600@660
]

{ #category : 'accessing' }
AoCView >> memo [

	^ memo
]

{ #category : 'accessing' }
AoCView >> memo: anObject [

   memo := anObject.
   anObject ifNotNil: [ memoLabel label: memo asString ] ifNil: [ memoLabel label: '' ]
]
