Class {
	#name : 'AoCResult',
	#superclass : 'SpPresenter',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'showing' }
AoCResult >> open [

	<script: 'self new open'>
	| results data densityPlot |
	results := self results.
	data := (results at: 'Rust') collect: [ :each | each log: 2 ].
	densityPlot := RSDensityPlot data: data.
	densityPlot bandwidth: 1.
	densityPlot xlabel: 'Execution time (msec)';
		ylabel: 'Dencity';
		title: 'Density plot'.
	densityPlot color: Color green.
	^ densityPlot open;
		  yourself
]
