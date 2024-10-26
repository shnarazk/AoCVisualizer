"
draw a graph that is very close to a bi-graph.
"
Class {
	#name : 'AoCData2023Day25',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day25 class >> day [

	^ 25
]

{ #category : 'private' }
AoCData2023Day25 >> buildDataModelFrom: data [

	^ data inject: Dictionary new into: [ :dic :element |
		  | to |
		  to := element at: 2.
		  dic
			  at: (element at: 1)
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
AoCData2023Day25 >> buildRoassalCanvasFrom: aCollection [
	"Draw node-edge graph"

	<script: 'self open'>
	| canvas lb elements |
	elements := aCollection keys
		            collect: [ :c |
			            RSEllipse new
				            size: 5;
				            model: c ]
		            as: RSGroup.
	elements @ RSDraggable.
	canvas := RSCanvas new.
	canvas addAll: elements.
	lb := RSLineBuilder line.
	lb
		canvas: canvas;
		color: Color red;
		connectFromAll: [ :each | aCollection at: each ].
	RSForceBasedLayout new on: elements.
	^ canvas
		  @ RSCanvasController;
		  yourself
]
