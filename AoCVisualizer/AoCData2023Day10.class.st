"
A variant of shortest path finding problem
"
Class {
	#name : 'AoCData2023Day10',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day10 class >> day [

	^ 10
]

{ #category : 'private' }
AoCData2023Day10 >> buildDataModelFrom: aJson [

    ^ (aJson collect: [ :each | each asArray ]) asArray
]

{ #category : 'private' }
AoCData2023Day10 >> buildRoassalCanvasFrom: anArray [
	"Draw grid map"

	<script: 'self open'>
	| canvas elements |
	elements := (anArray
		             inject: OrderedCollection new
		             into: [ :array :row |
			             row do: [ :cell |
				             | box |
				             box := RSBox new
					                    size: 2;
					                    model: cell;
					                    color: (cell
							                     ifTrue: [ Color black ]
							                     ifFalse: [ Color white darker ]);
					                    yourself.
				             array
					             add: box;
					             yourself ].
			             array ]) as: RSGroup.
	canvas := RSCanvas new
		          addAll: elements;
		          yourself.
	RSCellLayout new
		lineItemsCount: anArray size;
		gapSize: 0;
		on: elements.
	^ canvas
		  @ RSCanvasController;
		  yourself
]
