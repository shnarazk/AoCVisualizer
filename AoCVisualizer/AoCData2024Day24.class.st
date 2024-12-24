"
Build a DAG on supported relations between blocks.
"
Class {
	#name : 'AoCData2024Day24',
	#superclass : 'AoCData2024',
	#category : 'AoCVisualizer-AoC2024',
	#package : 'AoCVisualizer',
	#tag : 'AoC2024'
}

{ #category : 'accessing' }
AoCData2024Day24 class >> day [

    ^ 24
]

{ #category : 'private' }
AoCData2024Day24 >> buildDataModelFrom: aJson [

^aJson inject: Dictionary new into: [ :dic :element |
	| inputs |
	inputs := element last.
	dic at: (element first) put: (inputs asSet; yourself); yourself 
	 ]

]

{ #category : 'private' }
AoCData2024Day24 >> buildRoassalCanvasFrom: anDictionary [

	<script: 'self open'>
	| canvas elements aLineBuilder |
	canvas := RSCanvas new.
	elements := anDictionary keys
		            collect: [ :wire |
			            RSEllipse new size: 5;
				            color: Color black;
				            model: wire ]
		            as: RSGroup.
	elements @ RSDraggable.
	elements @ RSPopup.
	canvas addAll: elements.
	aLineBuilder := RSLineBuilder arrowedLine.
	aLineBuilder canvas: canvas;
		color: Color gray;
		connectFromAll: [ :each | anDictionary at: each ].
	RSTreeLayout new on: elements.
	canvas @ RSCanvasController.
	^ canvas
]
