"
I am an abstract class to provide AoC input data.
Concrete subclasses have to implement:

- _buildDataModelFrom:_
- _buildRoassalCanvasFrom:_

"
Class {
	#name : 'AoCData',
	#superclass : 'Object',
	#category : 'AoCVisualizer-Core',
	#package : 'AoCVisualizer',
	#tag : 'Core'
}

{ #category : 'accessing' }
AoCData class >> baseDirectory [

    ^ (Smalltalk os environment at: 'HOME') asPath / 'Repositories/advent-of-code/tmp'
]

{ #category : 'accessing' }
AoCData class >> dataFilename [

	^ self baseDirectory / self yearString / ('day' , self dayString , '.json')
]

{ #category : 'accessing' }
AoCData class >> day [

    self subclassResponsibility
]

{ #category : 'accessing' }
AoCData class >> dayString [

	^ '0' , self day asString last: 2
]

{ #category : 'testing' }
AoCData class >> isAbstract [

	^ self == AoCData
]

{ #category : 'accessing' }
AoCData class >> open [

    <script>
    ^ (AoCPresenter newFor: self new) open; yourself
]

{ #category : 'accessing' }
AoCData class >> year [

    self subclassResponsibility 
]

{ #category : 'accessing' }
AoCData class >> yearString [

	^ self year asString
]

{ #category : 'private' }
AoCData >> buildDataModelFrom: aJson [

    self subclassResponsibility
]

{ #category : 'private' }
AoCData >> buildRoassalCanvasFrom: aDataModel [

    <script: 'self open'>
    self subclassResponsibility
]

{ #category : 'private' }
AoCData >> comment [

	^ nil
]

{ #category : 'accessing' }
AoCData >> dataModel [

    ^ self buildDataModelFrom: self jsonData
]

{ #category : 'accessing' }
AoCData >> jsonData [

    ^ self class dataFilename asFileReference readStreamDo: [ :stream | STON fromStream: stream ]
]

{ #category : 'drawing - roassal' }
AoCData >> roassalCanvas [

    ^ self buildRoassalCanvasFrom: self dataModel
]
