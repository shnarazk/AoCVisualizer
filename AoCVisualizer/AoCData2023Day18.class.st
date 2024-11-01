"
Draw a grid map
"
Class {
	#name : 'AoCData2023Day18',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day18 class >> day [

  ^ 18
]

{ #category : 'private' }
AoCData2023Day18 >> buildDataModelFrom: data [

  ^ ((data at: #map) collect: [ :each | each asArray ]) asArray
]

{ #category : 'private' }
AoCData2023Day18 >> buildRoassalCanvasFrom: anArray [
  "Draw grid map"

  <script: 'self open'>
  | canvas elements black gray length |
  black := Color black.
  gray := Color white darker.
  canvas := RSCanvas new.
  length := anArray size.
  elements := anArray inject: OrderedCollection new into: [ :array :row |
                row do: [ :cell |
                  | box |
                  box := RSBox new size: 3;
                           model: cell;
                           yourself.
                  (cell == 1) ifTrue: [ box color: black ]
                    ifFalse: [ box color: gray ].
                  array add: box;
                    yourself ].
                array ].
  elements := elements as: RSGroup.
  canvas addAll: elements.
  RSCellLayout new lineItemsCount: length;
    gapSize: 1;
    on: elements.
  ^ canvas @ RSCanvasController;
      yourself
]
