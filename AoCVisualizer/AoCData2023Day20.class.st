"
I am a graph of FlipFlops and Conjunctions network.
"
Class {
	#name : 'AoCData2023Day20',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day20 class >> day [

    ^ 20
]

{ #category : 'private' }
AoCData2023Day20 >> buildDataModelFrom: aJson [

	| nodes |
	nodes := aJson inject: Dictionary new into: [ :pool :each |
		         | dic name props |
		         dic := IdentityDictionary new.
		         name := each at: 1.
		         props := each at: 2.
		         dic at: #name put: (each at: 1);
			         at: #inputs put: (props at: 'hash') keys;
			         at: #output put: (props at: 'dests');
			         at: #type put: (props at: 'module_type').
		         pool at: name put: dic;
			         yourself ].
	^ nodes
]

{ #category : 'private' }
AoCData2023Day20 >> buildRoassalCanvasFrom: aCollection [

	<script: 'self open'>
	| canvas elements flipflipLineBuilder conjunctionLineBuilder |
	canvas := RSCanvas new.
	elements := aCollection keys
		            collect: [ :name |
			            RSEllipse new size: 5;
				            model: name ]
		            as: RSGroup.
	elements @ RSDraggable.
	canvas addAll: elements.
	flipflipLineBuilder := RSLineBuilder line.
	flipflipLineBuilder canvas: canvas;
		color: Color red;
		connectFromAll: [ :each |
			((aCollection at: each) at: #type) = 'FlipFlop' ifTrue: [ (aCollection at: each) at: #inputs ]
				ifFalse: [ {  } ] ].
	conjunctionLineBuilder := RSLineBuilder line.
	conjunctionLineBuilder canvas: canvas;
		color: Color blue;
		connectFromAll: [ :each |
			((aCollection at: each) at: #type) = 'Conjunction' ifTrue: [ (aCollection at: each) at: #inputs ]
				ifFalse: [ {  } ] ].
	RSTreeLayout new on: elements.
	canvas @ RSCanvasController.
	^ canvas
]
