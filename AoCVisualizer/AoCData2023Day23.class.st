"
A graph of pathes and walls.
"
Class {
	#name : 'AoCData2023Day23',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day23 class >> day [

	^ 23
]

{ #category : 'private' }
AoCData2023Day23 >> buildDataModelFrom: aJson [

	^ aJson
]

{ #category : 'private' }
AoCData2023Day23 >> buildRoassalCanvasFrom: data [
  "Draw 2D grid map and aux line."

  <script: 'self open'>
  | canvas elements branch route next |
  route := data at: 'route'.
  next := Dictionary new.
  route doWithIndex: [ :n :i | next at: n + 1 put: (route at: i + 1 ifAbsent: -3) + 1 ].
  canvas := RSCanvas new.
  branch := 1.
  elements := (data at: 'map') inject: OrderedCollection new into: [ :array :row |
                row do: [ :cell |
                  | box |
                  box := RSBox new size: 3; yourself.
                  cell = 0 ifTrue: [ box color: Color white darker; model: 0 ].
                  cell = 1 ifTrue: [ box color: Color black; model: -1 ].
                  cell = 2 ifTrue: [
                    box color: Color red; model: branch.
                    branch := branch + 1 ].
                  array add: box; yourself ].
                array ].
  elements := elements as: RSGroup.
  canvas addAll: elements.
  RSLineBuilder line canvas: canvas; color: Color red; connectTo: [ :each | next at: each ifAbsent: nil ].
  RSCellLayout new lineItemsCount: (data at: 'map') size; gapSize: 0; on: elements.
  ^ canvas @ RSCanvasController; yourself
]
