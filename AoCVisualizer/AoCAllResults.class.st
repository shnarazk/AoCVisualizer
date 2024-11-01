"
I am the reporter on AoC results.
"
Class {
	#name : 'AoCAllResults',
	#superclass : 'AoCResult',
	#category : 'AoCVisualizer-AoC',
	#package : 'AoCVisualizer',
	#tag : 'AoC'
}

{ #category : 'accessing' }
AoCAllResults class >> year [

	^ '2015-2023'
]

{ #category : 'accessing' }
AoCAllResults >> jsonData [

	<script: 'self new open'>
	| classes jsons |
	classes := AoCResult subclasses reject: [ :class | class = self class ].
	jsons := classes collect: [ :class | class new jsonData collect: [ :each | each at: 2 ] ].
	^ (jsons flattened collectWithIndex: [ :each :index | { index .  each} ]) asArray
]

{ #category : 'showing' }
AoCAllResults >> openHistgram [

	<script: 'self new openHistgram'>
	| data densityPlot |
	data := self jsonData collect: [ :each | ((each at: 2) log: 2) max: -3 ].
	densityPlot := RSHistogramPlot new x: data.
	"densityPlot bandwidth: 1".
	densityPlot xlabel: 'Log2-scaled execution time (msec)';
		ylabel: 'Occurrences';
		title: 'AoC' , self class yearString;
		color: Color green;
		minChartValueX: -5;
		maxChartValueX: 20;
		xTicks: ((-3 to: 10) collect: [ :each | each * 2 ])
		labels: ((-3 to: 10) collect: [ :each | each * 2 ]).
	densityPlot extent: 500 @ 280.
	^ densityPlot open;
		  yourself
]
