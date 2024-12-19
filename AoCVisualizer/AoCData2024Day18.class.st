"
I am a class to draw a graph for day18.
"
Class {
	#name : 'AoCData2024Day18',
	#superclass : 'AoCData2024',
	#category : 'AoCVisualizer-AoC2024',
	#package : 'AoCVisualizer',
	#tag : 'AoC2024'
}

{ #category : 'accessing' }
AoCData2024Day18 class >> day [

  ^18
]

{ #category : 'private' }
AoCData2024Day18 >> buildDataModelFrom: aJson [
  "aJson has two keys: size: [int, int], line: [[int, int]]"

  | anArray height width |
  height := (aJson at: #size) first.
  width := (aJson at: #size) last.
  anArray := ((1 to: height) collect: [ :i | (Array new: width) atAllPut: true ]) asArray.
  (aJson at: #line) do: [ :each | (anArray at: each first + 1) at: each last + 1 put: false ].
  ^ anArray
]

{ #category : 'private' }
AoCData2024Day18 >> buildRoassalCanvasFrom: anArray [
  "Draw grid map"

  <script: 'self open'>
  | canvas elements |
  elements := (anArray inject: OrderedCollection new into: [ :array :row |
                   row do: [ :cell |
                       | box |
                       box := RSBox new size: 2; model: cell; color:
                                  (cell ifTrue: [ Color black ] ifFalse: [ Color white darker ]); yourself.
                       array add: box; yourself ].
                   array ]) as: RSGroup.
  canvas := RSCanvas new addAll: elements; yourself.
  RSCellLayout new lineItemsCount: anArray size; gapSize: 0; on: elements.
  ^ canvas @ RSCanvasController; yourself
]
