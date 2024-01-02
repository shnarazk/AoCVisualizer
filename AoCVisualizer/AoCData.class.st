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

    ^ (self baseDirectory / ('day' , ('00' , self class asString last: 2) , '.json')) asFileReference 
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
AoCData class >> year [

    self subclassResponsibility 
]

{ #category : 'accessing' }
AoCData >> graph [

    self subclassResponsibility
]

{ #category : 'accessing' }
AoCData >> jsonData [

     ^ self class dataFilename readStreamDo: [ :stream |
          STON fromStream: stream ]
]

{ #category : 'presenter building' }
AoCData >> renderOn: aPreseter [

    aPreseter canvas: self graph
]
