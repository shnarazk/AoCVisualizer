"
I am an abstract class to provide AoC input data.
"
Class {
	#name : 'AoCData',
	#superclass : 'Object',
	#category : 'AoCVisualizer',
	#package : 'AoCVisualizer'
}

{ #category : 'accessing' }
AoCData class >> baseDirectory [

    ^ (Smalltalk os environment at: 'HOME') asPath / 'Repositories/advent-of-code/tmp'
]

{ #category : 'accessing' }
AoCData class >> dataFilename [

    ^ (self baseDirectory / self year asString
       / ('day' , ('00' , self day asString last: 2) , '.json')) asFileReference
]

{ #category : 'accessing' }
AoCData class >> day [

    self subclassResponsibility
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
AoCData >> buildDataModelFrom: aJson [

    self subclassResponsibility
]

{ #category : 'drawing - roassal' }
AoCData >> buildRoassalCanvasFrom: aDataModel [

    self subclassResponsibility
]

{ #category : 'accessing' }
AoCData >> dataModel [

    ^ self buildDataModelFrom: self jsonData
]

{ #category : 'accessing' }
AoCData >> jsonData [

     ^ self class dataFilename readStreamDo: [ :stream |
          STON fromStream: stream ]
]

{ #category : 'drawing - roassal' }
AoCData >> roassalCanvas [

    ^ self buildRoassalCanvasFrom: self dataModel
]
