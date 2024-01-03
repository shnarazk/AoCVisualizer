"
I am a Spec application to view AoC data.
"
Class {
	#name : 'AoCPresenter',
	#superclass : 'SpPresenter',
	#classTraits : '',
	#instVars : [
		'memoPresenter',
		'graphPresenter',
		'updateButton',
		'dataModel'
	],
	#category : 'AoCVisualizer-Core',
	#package : 'AoCVisualizer',
	#tag : 'Core'
}

{ #category : 'instance creation' }
AoCPresenter class >> newFor: anAoCData [

    ^ self new dataModel: anAoCData;
          yourself
]

{ #category : 'initialization' }
AoCPresenter >> connectPresenters [

	updateButton action: [ self updatePresenter ]
]

{ #category : 'accessing' }
AoCPresenter >> dataModel [

	^ dataModel
]

{ #category : 'accessing' }
AoCPresenter >> dataModel: anObject [

	dataModel := anObject.
	graphPresenter canvas: dataModel roassalCanvas.
	"comment might be set as a side-effect of roassalCanvas"
	memoPresenter label: dataModel comment
]

{ #category : 'layout' }
AoCPresenter >> defaultLayout [

    | box |
    box := SpBoxLayout newVertical.
    box add: memoPresenter expand: false;
        add: graphPresenter;
        add: updateButton expand: false.
    ^ box
]

{ #category : 'accessing' }
AoCPresenter >> graphPresenter [

	^ graphPresenter
]

{ #category : 'accessing' }
AoCPresenter >> graphPresenter: anObject [

	graphPresenter := anObject
]

{ #category : 'initialization' }
AoCPresenter >> initializePresenters [

	memoPresenter := self newLabel.
	graphPresenter := self newRoassal.
	updateButton := self newButton label: 'update';
		                icon: (self iconNamed: #smallUpdate);
		                yourself
]

{ #category : 'initialization' }
AoCPresenter >> initializeWindow: aWindowPresenter [

	| title |
	aWindowPresenter initialExtent: 800 @ 860.
	title := dataModel ifNotNil: [ dataModel description ] ifNil: [ 'AoC' ].
	aWindowPresenter title: title
]

{ #category : 'initialization' }
AoCPresenter >> updatePresenter [

	dataModel ifNotNil: [
		memoPresenter label: dataModel comment.
		graphPresenter canvas: dataModel roassalCanvas ]
]
