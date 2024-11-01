"
I am a reporter of AoC results.
"
Class {
	#name : 'AoCResult',
	#superclass : 'SpPresenter',
	#category : 'AoCVisualizer-AoC',
	#package : 'AoCVisualizer',
	#tag : 'AoC'
}

{ #category : 'accessing' }
AoCResult class >> baseDirectory [

    ^ (Smalltalk os environment at: 'HOME') asPath / 'Repositories/advent-of-code/misc'
]

{ #category : 'accessing' }
AoCResult class >> dataFilename [

	^ self baseDirectory / self yearString / 'execution_time.json' 
]

{ #category : 'accessing' }
AoCResult class >> graphTitle [

	^ self yearString 
]

{ #category : 'accessing' }
AoCResult class >> year [

    self subclassResponsibility 
]

{ #category : 'accessing' }
AoCResult class >> yearString [

	^ self year asString
]

{ #category : 'accessing' }
AoCResult >> jsonData [

    ^ self class dataFilename asFileReference readStreamDo: [ :stream | STON fromStream: stream ]
]

{ #category : 'showing' }
AoCResult >> open [

"Open the data file, then open a graph view"
	<script: 'self new open'>
	| data densityPlot |
	data := self jsonData collect: [ :each | ((each at: #time) log: 2) max: -3 ].
	densityPlot := RSDensityPlot data: data.
	densityPlot bandwidth: 1.
	densityPlot xlabel: 'Log2-scaled execution time (msec)';
		ylabel: 'Dencity';
		title: 'AoC' , self class graphTitle;
		color: Color green;
		minChartValueX: -5;
		maxChartValueX: 20;
		xTicks: ((-3 to: 10) collect: [ :each | each * 2 ])
		labels: ((-3 to: 10) collect: [ :each | each * 2 ]).
	densityPlot extent: 500 @ 280.
	^ densityPlot open;
		  yourself
]
