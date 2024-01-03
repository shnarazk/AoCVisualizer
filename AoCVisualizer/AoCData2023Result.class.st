Class {
	#name : 'AoCData2023Result',
	#superclass : 'AoCData2023',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'private' }
AoCData2023Result >> buildDataModelFrom: aJson [

	
]

{ #category : 'private' }
AoCData2023Result >> buildRoassalCanvasFrom: aDataModel [

	<script: 'self open'>
	
]

{ #category : 'drawing - roassal' }
AoCData2023Result >> dataModel [

	^ #( -25 -25 -25 -25 10 20 30 40 50 50 50 50 )
]

{ #category : 'accessing' }
AoCData2023Result >> description [

	^ 'AoC2023 implementation results'
]

{ #category : 'drawing - roassal' }
AoCData2023Result >> roassalCanvas [

	| densityPlot |
	densityPlot := RSDensityPlot data: self dataModel.
	densityPlot bandwidth: 10.
	densityPlot xlabel: 'X label';
		ylabel: 'Y label';
		title: 'Density plot (bandwidth:10)'.
	densityPlot color: Color green.
	^ densityPlot
]
