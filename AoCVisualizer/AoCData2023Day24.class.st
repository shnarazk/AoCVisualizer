"
dray lines that represent equations.
"
Class {
	#name : 'AoCData2023Day24',
	#superclass : 'AoCData2023',
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

	<todo: 'make a way to set meme'>
	<script: 'self open'>
	| elements time scale |
	scale := 0.000000000001.
	time := 1.0 / scale.
	"self memo: 'scale = ' , scale asString , ', time from 0 to ' , time asString."
	elements := anArray collect: [ :pv |
		            | line start end |
		            start := (pv at: 1) * scale.
		            end := (pv at: 1) + ((pv at: 2) negated * time).
		            end := end * scale.
		            line := RSLine new width: 1.
		            (pv at: 2) > 0 ifTrue: [ line color: Color blue ].
		            line startPoint: 0 @ start;
			            endPoint: 1000 @ end;
			            yourself ].
	elements := elements as: RSGroup.
	^ RSCanvas new addAll: elements;
		  @ RSCanvasController;
		  yourself
]
