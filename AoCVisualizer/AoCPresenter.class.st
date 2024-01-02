Class {
	#name : 'AoCPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'title',
		'baseDirectory',
		'memoPresenter',
		'graphPresenter',
		'updateButton',
		'dataModel'
	],
	#category : 'AoCVisualizer',
	#package : 'AoCVisualizer'
}

{ #category : 'instance creation' }
AoCPresenter class >> newFor: anAoCDataClass [

    ^ self new dataModel: anAoCDataClass new;
          yourself
]

{ #category : 'accessing' }
AoCPresenter >> baseDirectory [

	^ baseDirectory
]

{ #category : 'accessing' }
AoCPresenter >> baseDirectory: anObject [

	baseDirectory := anObject
]

{ #category : 'accessing' }
AoCPresenter >> dataModel [

	^ dataModel
]

{ #category : 'accessing' }
AoCPresenter >> dataModel: anObject [

	dataModel := anObject
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
AoCPresenter >> initialize [

    title := 'AoC Data Visualizer'.
    baseDirectory := '/'
]

{ #category : 'initialization' }
AoCPresenter >> initializePresenters [

    memoPresenter := self newLabel.
    graphPresenter := self newRoassal.
    updateButton := self newButton
]

{ #category : 'initialization' }
AoCPresenter >> initializeWindow: aWindowPresenter [

    aWindowPresenter title: title;
        initialExtent: 800 @ 860
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
AoCPresenter >> title1 [

	^ title
]

{ #category : 'accessing' }
AoCPresenter >> title: anObject [

	title := anObject
]

{ #category : 'accessing' }
AoCPresenter >> updateButton [

	^ updateButton
]

{ #category : 'accessing' }
AoCPresenter >> updateButton: anObject [

	updateButton := anObject
]
