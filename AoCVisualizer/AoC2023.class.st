"
I am visualizer for AoC 2023 problems.

"
Class {
	#name : 'AoC2023',
	#superclass : 'AoCView',
	#category : 'AoCVisualizer',
	#package : 'AoCVisualizer'
}

{ #category : 'public' }
AoC2023 class >> day10 [

	<script>
	| viewer |
	viewer := self new day10.
	viewer open.
	^ viewer
]

{ #category : 'public' }
AoC2023 class >> day19 [

	<script>
	| viewer |
	viewer := self new day19.
	viewer open.
	^ viewer
]

{ #category : 'public' }
AoC2023 class >> day20 [

	<script>
	| viewer |
	viewer := self new day20.
	viewer open.
	^ viewer
]

{ #category : 'public' }
AoC2023 class >> day21 [

	<script>
	| viewer |
	viewer := self new day21.
	viewer open.
	^ viewer
]

{ #category : 'public' }
AoC2023 class >> day24 [

	<script>
	| viewer |
	viewer := self new day24.
	viewer open.
	^ viewer
]

{ #category : 'public' }
AoC2023 class >> day25 [

	<script>
	| viewer |
	viewer := self new day25.
	viewer open.
	^ viewer
]

{ #category : 'initialization' }
AoC2023 >> day10 [
	"Draw maze graph."

	title := 'y2023 day10'.
	update := [ self day10 ].
	graph := self day10graph
]

{ #category : 'private - building' }
AoC2023 >> day10graph [
	"Draw grid map"

	| anArray canvas elements black gray length |
	anArray := self day10load.
	black := Color black.
	gray := Color white darker.
	canvas := RSCanvas new.
	length := anArray size.
	elements := anArray inject: OrderedCollection new into: [ :array :row |
		            row do: [ :cell |
			            | box |
			            box := RSBox new size: 2; model: cell; yourself.
			            cell ifTrue: [ box color: black ]
				            ifFalse: [ box color: gray ].
			            array add: box; yourself ].
		            array ].
	elements := elements as: RSGroup.
	canvas addAll: elements.
	RSCellLayout new lineItemsCount: length; gapSize: 0; on: elements.
	canvas @ RSCanvasController.
	^ SpRoassalPresenter new canvas: canvas; yourself
]

{ #category : 'private - loading' }
AoC2023 >> day10load [

	| data nodes |
	data := (baseDirectory / 'day10.json') asFileReference readStreamDo: [ :stream |
		        STON fromStream: stream ].
	nodes := (data collect: [ :each | each asArray ]) asArray.
	^ nodes
]

{ #category : 'initialization' }
AoC2023 >> day19 [
	"Draw maze graph."

	title := 'y2023 day19'.
	update := [ self day19 ].
	graph := self day19graph
]

{ #category : 'private - building' }
AoC2023 >> day19graph [
    "Draw grid map"

    | anArray canvas elements lb |
    anArray := self day19load.
    canvas := RSCanvas new.
    elements := anArray inject: Set new into: [ :aSet :link |
                    aSet add: (link at: 1).
                    aSet add: (link at: 2).
                    aSet ].
    elements := elements collect: [ :name | RSEllipse new size: 5; model: name ].
    elements := elements as: RSGroup.
    canvas addAll: elements.
    lb := RSLineBuilder line.
    lb canvas: canvas; color: Color red; connectToAll: [ :each |
            (anArray select: [ :link | (link at: 1) = each ]) collect: [ :link | link at: 2 ] ].
    RSTreeLayout new on: elements.
    canvas @ RSCanvasController.
    ^ SpRoassalPresenter new canvas: canvas; yourself
]

{ #category : 'private - loading' }
AoC2023 >> day19load [

    ^ (baseDirectory / 'day19.json') asFileReference readStreamDo: [ :stream | STON fromStream: stream ]
]

{ #category : 'initialization' }
AoC2023 >> day20 [

	title := 'y2023 day20'.
	update := [ self day20 ].
	graph := self day20graph
]

{ #category : 'private - building' }
AoC2023 >> day20graph [

	| aCollection canvas elements flipflipLineBuilder conjunctionLineBuilder |
	aCollection := self day20load.
	canvas := RSCanvas new.
	elements := aCollection keys collect: [ :name | RSEllipse new size: 5; model: name ] as: RSGroup.
	elements @ RSDraggable.
	canvas addAll: elements.
	flipflipLineBuilder := RSLineBuilder line.
	flipflipLineBuilder canvas: canvas; color: Color red; connectFromAll: [ :each |
			((aCollection at: each) at: #type) = 'FlipFlop' ifTrue: [ (aCollection at: each) at: #inputs ]
				ifFalse: [ {  } ] ].
	conjunctionLineBuilder := RSLineBuilder line.
	conjunctionLineBuilder canvas: canvas; color: Color blue; connectFromAll: [ :each |
			((aCollection at: each) at: #type) = 'Conjunction' ifTrue: [ (aCollection at: each) at: #inputs ]
				ifFalse: [ {  } ] ].
	RSTreeLayout new on: elements.
	canvas @ RSCanvasController.
	^ SpRoassalPresenter new canvas: canvas; yourself
]

{ #category : 'private - loading' }
AoC2023 >> day20load [

	| data nodes |
	data := (baseDirectory / 'day20.json') asFileReference readStreamDo: [ :stream |
		        STON fromStream: stream ].
	nodes := data inject: Dictionary new into: [ :pool :each |
		         | dic name props |
		         dic := IdentityDictionary new.
		         name := each at: 1.
		         props := each at: 2.
		         dic at: #name put: (each at: 1); at: #inputs put: (props at: 'hash') keys; at: #output
			         put: (props at: 'dests'); at: #type put: (props at: 'module_type').
		         pool at: name put: dic; yourself ].
	^ nodes
]

{ #category : 'initialization' }
AoC2023 >> day21 [
	"Draw maze graph."

	title := 'y2023 day21'.
	update := [ self day21 ].
	graph := self day21graph
]

{ #category : 'private - building' }
AoC2023 >> day21graph [
	"Draw grid map"

	| anArray canvas elements black gray length |
	anArray := self day21load.
	black := Color black.
	gray := Color white darker.
	canvas := RSCanvas new.
	length := anArray size.
	elements := anArray inject: OrderedCollection new into: [ :array :row |
		            row do: [ :cell |
			            | box |
			            box := RSBox new size: 3; model: cell; yourself.
			            cell ifTrue: [ box color: black ]
				            ifFalse: [ box color: gray ].
			            array add: box; yourself ].
		            array ].
	elements := elements as: RSGroup.
	canvas addAll: elements.
	RSCellLayout new lineItemsCount: length; gapSize: 1; on: elements.
	canvas @ RSCanvasController.
	^ SpRoassalPresenter new canvas: canvas; yourself
]

{ #category : 'private - loading' }
AoC2023 >> day21load [

	| data nodes |
	data := (baseDirectory / 'day21.json') asFileReference readStreamDo: [ :stream |
		        STON fromStream: stream ].
	nodes := (data collect: [ :each | each asArray ]) asArray.
	^ nodes
]

{ #category : 'initialization' }
AoC2023 >> day24 [

	title := 'y2023 day24'.
	update := [ self day24 ].
	graph := self day24graph
]

{ #category : 'private - building' }
AoC2023 >> day24graph [
	"Draw lines."

	| anArray canvas elements time scale |
	anArray := self day24load.
	scale := 0.000000000001.
	time := 1.0 / scale.
	self memo: 'scale = ' , scale asString , ', time from 0 to ' , time asString.
	canvas := RSCanvas new.
	elements := anArray collect: [ :pv |
		            | line start end |
		            start := (pv at: 1) * scale.
		            end := (pv at: 1) + ((pv at: 2) negated * time).
		            end := end * scale.
		            line := RSLine new width: 1.
		            (pv at: 2) > 0 ifTrue: [ line color: Color blue ].
		            line startPoint: 0 @ start; endPoint: 1000 @ end; yourself ].

	elements := elements as: RSGroup.
	canvas addAll: elements.
	canvas @ RSCanvasController.
	^ SpRoassalPresenter new canvas: canvas; yourself
]

{ #category : 'private - loading' }
AoC2023 >> day24load [
	"Load [{position, speed)] json"

	^ (baseDirectory / 'day24.json') asFileReference readStreamDo: [ :stream |
		  STON fromStream: stream ]
]

{ #category : 'initialization' }
AoC2023 >> day25 [

	title := 'y2023 day25'.
	update := [ self day25 ].
	graph := self day25graph
]

{ #category : 'private - building' }
AoC2023 >> day25graph [
	"Draw node-edge graph"

	| aCollection canvas lb elements |
	aCollection := self day25load.
	canvas := RSCanvas new.
	elements := aCollection keys collect: [ :c | RSEllipse new size: 5; model: c ] as: RSGroup.
	elements @ RSDraggable.
	canvas addAll: elements.
	lb := RSLineBuilder line.
	lb canvas: canvas; color: Color red; connectFromAll: [ :each | aCollection at: each ].
	RSForceBasedLayout new on: elements.
	canvas @ RSCanvasController.
	^ SpRoassalPresenter new canvas: canvas; yourself
]

{ #category : 'private - loading' }
AoC2023 >> day25load [

	| data nodes |
	data := (baseDirectory / 'day25.json') asFileReference readStreamDo: [ :stream |
		        STON fromStream: stream ].
	nodes := data inject: Dictionary new into: [ :dic :element |
		         | to |
		         to := element at: 2.
		         dic at: (element at: 1)
			         update: [ :set | set add: to; yourself ]
			         initial: [ Set new add: to; yourself ].
		         (dic keys includes: to) ifFalse: [ dic at: to put: Set new ].
		         dic ].
	^ nodes
]

{ #category : 'initialization' }
AoC2023 >> initialize [

	super initialize.
	baseDirectory := baseDirectory / '2023'
]
