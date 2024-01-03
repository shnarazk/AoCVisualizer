"
I am a Spec application to view AoC data.
"
Class {
	#name : 'AoCPresenter',
	#superclass : 'SpPresenter',
	#classTraits : '{} + TraitedClass',
	#instVars : [
		'memoPresenter',
		'graphPresenter',
		'updateButton',
		'dataModel'
	],
	#category : 'AoCVisualizer-core',
	#package : 'AoCVisualizer',
	#tag : 'core'
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
    graphPresenter canvas: dataModel roassalCanvas
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
	title := dataModel ifNotNil: [
		         'AoC y' , dataModel class yearString , ' day' , dataModel class dayString ]
		         ifNil: [ 'AoC' ].
	aWindowPresenter title: title
]

{ #category : 'accessing' }
AoCPresenter >> memoPresenter [

	^ memoPresenter
]

{ #category : 'accessing' }
AoCPresenter >> memoPresenter: anObject [

	memoPresenter := anObject
]

{ #category : 'accessing' }
AoCPresenter >> newGraphPresenter [

    | presenter |
    presenter := self newRoassal.
    dataModel ifNotNil: [ presenter canvas: self dataModel roassalCanvas ].
    ^ presenter
]

{ #category : 'accessing' }
AoCPresenter >> updateButton [

	^ updateButton
]

{ #category : 'accessing' }
AoCPresenter >> updateButton: anObject [

	updateButton := anObject
]

{ #category : 'initialization' }
AoCPresenter >> updatePresenter [

    dataModel ifNotNil: [ graphPresenter canvas: dataModel roassalCanvas ]
]
