"
draw a graph that is very close to a bi-graph.
"
Class {
	#name : 'AoCData2024Day23',
	#superclass : 'AoCData2024',
	#category : 'AoCVisualizer-AoC2024',
	#package : 'AoCVisualizer',
	#tag : 'AoC2024'
}

{ #category : 'accessing' }
AoCData2024Day23 class >> day [

	^ 23
]

{ #category : 'private' }
AoCData2024Day23 >> buildDataModelFrom: data [

	^ data inject: Dictionary new into: [ :dic :element |
		  | to |
		  to := element at: 2.
		  dic
			  at: (element first)
			  update: [ :set |
				  set add: to;
					  yourself ]
			  initial: [
				  Set new add: to;
					  yourself ].
		  (dic keys includes: to) ifFalse: [ dic at: to put: Set new ].
		  dic ]
]

{ #category : 'private' }
AoCData2024Day23 >> buildRoassalCanvasFrom: aCollection [
  "Draw node-edge graph"

  <script: 'self open'>
  | canvas lb elements |
  elements := aCollection keys collect: [ :c | RSEllipse new size: 5; model: c ] as: RSGroup.
  elements @ RSDraggable.
  canvas := RSCanvas new addAll: elements; yourself.
  lb := RSLineBuilder line canvas: canvas; color: Color red; connectFromAll: [ :each | aCollection at: each ]; yourself.
  RSForceBasedLayout new on: elements.
  ^ canvas @ RSCanvasController; yourself
]