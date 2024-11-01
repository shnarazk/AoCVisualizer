"
Draw a connection graph between FlipFlops and Conjunctions.
"
Class {
	#name : 'AoCData2023Day19',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day19 class >> day [

	^ 19
]

{ #category : 'private' }
AoCData2023Day19 >> buildDataModelFrom: aJson [

	^aJson 
]

{ #category : 'private' }
AoCData2023Day19 >> buildRoassalCanvasFrom: anArray [
  "Draw a tree"

  <script: 'self open'>
  | canvas elements lb |
  canvas := RSCanvas new.
  elements := anArray inject: Set new into: [ :aSet :link |
                aSet add: link first.
                aSet add: (link at: 2).
                aSet ].
  elements := elements collect: [ :name |
                RSEllipse new size: 5;
                  model: name ].
  elements := elements as: RSGroup.
  canvas addAll: elements.
  lb := RSLineBuilder line.
  lb canvas: canvas;
    color: Color red;
    connectToAll: [ :each | (anArray select: [ :link | link first = each ]) collect: [ :link | link at: 2 ] ].
  RSTreeLayout new on: elements.
  ^ canvas @ RSCanvasController;
      yourself
]
