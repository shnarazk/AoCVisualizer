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
		         name := each first.
		         props := each at: 2.
		         dic at: #name put: (each first);
			         at: #inputs put: (props at: 'hash') keys;
			         at: #output put: (props at: 'dests');
			         at: #type put: (props at: 'module_type').
		         pool at: name put: dic;
			         yourself ].
	^ nodes
]

{ #category : 'private' }
AoCData2023Day20 >> buildRoassalCanvasFrom: aCollection [
  "Draw a layered network"

  <script: 'self open'>
  | canvas elements flipflipLineBuilder conjunctionLineBuilder |
  canvas := RSCanvas new.
  elements := self makeGraphElements: aCollection.
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

{ #category : 'private' }
AoCData2023Day20 >> makeGraphElements: aCollection [
  "generates a collection of RSEllipse representing a module"

  | elements |
  elements := aCollection keys
                collect: [ :name |
                  | size |
                  size := (((aCollection at: name) at: #output) includes: 'dh') ifTrue: [ 8 ]
                            ifFalse: [ 5 ].
                  RSEllipse new size: size;
                    model: name ]
                as: RSGroup.
  elements @ RSDraggable.
  elements @ RSPopup.
  ^ elements
]
