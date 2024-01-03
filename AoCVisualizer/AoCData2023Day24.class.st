"
dray lines that represent equations.
"
Class {
	#name : 'AoCData2023Day24',
	#superclass : 'AoCData2023',
	#instVars : [
		'scale'
	],
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCData2023Day24 class >> day [

	^ 24
]

{ #category : 'private' }
AoCData2023Day24 >> buildDataModelFrom: aJson [

	^ aJson
]

{ #category : 'private' }
AoCData2023Day24 >> buildRoassalCanvasFrom: anArray [
	"Draw lines."

	<script: 'self open'>
	| elements time |

	scale := 0.000000000001.
	time := 1.0 / scale.
	elements := anArray collect: [ :pv |
		            | start end |

		            start := pv at: 1.
		            end := start - ((pv at: 2) * time).
		            RSLine new width: 1;
			            color: ((pv at: 2) > 0 ifTrue: [ Color blue ]
					             ifFalse: [ Color red ]);
			            startPoint: 0 @ (start * scale);
			            endPoint: 1000 @ (end * scale);
			            yourself ].
	^ RSCanvas new addAll: (elements as: RSGroup);
		  @ RSCanvasController;
		  yourself
]

{ #category : 'private' }
AoCData2023Day24 >> comment [

	| time |
	time := 1.0 / scale.
	^ 'scale = ' , scale asString , ', time from 0 to ' , time asString
]
