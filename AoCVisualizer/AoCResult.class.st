"
I am a reporter of AoC results.
"
Class {
	#name : 'AoCResult',
	#superclass : 'SpPresenter',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCResult class >> baseDirectory [

    ^ (Smalltalk os environment at: 'HOME') asPath / 'Repositories/advent-of-code/tmp'
]

{ #category : 'accessing' }
AoCResult class >> dataFilename [

	^ self baseDirectory / self yearString / 'execution_time.json' 
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

	<script: 'self new open'>
	| data densityPlot |
	"results := self results.""data := (results at: 'Rust') collect: [ :each | each log: 2 ]."
	data := self jsonData collect: [ :each | ((each at: 2) log: 2) max: 0 ].
	densityPlot := RSDensityPlot data: data.
	densityPlot bandwidth: 1.
	densityPlot xlabel: 'Log2-scaled Execution time (msec)'; ylabel: 'Dencity'; title:
			'AoC' , self class yearString; color: Color green; minChartValueX: -5; maxChartValueX: 20;
		xTicks: ((-2 to: 10) collect: [ :each | each * 2 ])
		labels: ((-2 to: 10) collect: [ :each | each * 2 ]).
	densityPlot extent: 500 @ 280.
	^ densityPlot open; yourself
]
