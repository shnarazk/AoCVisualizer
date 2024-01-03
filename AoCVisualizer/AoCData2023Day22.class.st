"
Build a DAG on supported relations between blocks.
"
Class {
	#name : 'AoCData2023Day22',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day22 class >> day [

    ^ 22
]

{ #category : 'private' }
AoCData2023Day22 >> buildDataModelFrom: aJson [

	^ aJson collect: [ :each | each collect: [ :aNumber | aNumber + 1 ] ]
]

{ #category : 'private' }
AoCData2023Day22 >> buildRoassalCanvasFrom: aCollection [

	<script: 'self open'>
	| canvas elements aLineBuilder |
	canvas := RSCanvas new.
	elements := (1 to: aCollection size)
		            collect: [ :i |
			            RSEllipse new size: 5;
				            color: Color black;
				            model: i ]
		            as: RSGroup.
	elements @ RSDraggable.
	canvas addAll: elements.
	aLineBuilder := RSLineBuilder arrowedLine.
	aLineBuilder canvas: canvas;
		color: Color gray;
		connectToAll: [ :each | aCollection at: each ].
	RSTreeLayout new on: elements.
	canvas @ RSCanvasController.
	^ canvas
]
