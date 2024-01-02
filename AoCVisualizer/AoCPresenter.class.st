"
I am a Spec application to view AoC data.
"
Class {
	#name : 'AoCPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'memoPresenter',
		'graphPresenter',
		'updateButton',
		'dataModel'
	],
	#category : 'AoCVisualizer',
	#package : 'AoCVisualizer'
}

{ #category : 'instance creation' }
AoCPresenter class >> newFor: anAoCData [

    ^ self new dataModel: anAoCData;
          yourself
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
    updateButton := self newButton
]

{ #category : 'initialization' }
AoCPresenter >> initializeWindow: aWindowPresenter [

    <todo: 'set title'>
    aWindowPresenter initialExtent: 800 @ 860
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

    ^ self newRoassal canvas: self dataModel roassalCanvas;
          yourself
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
