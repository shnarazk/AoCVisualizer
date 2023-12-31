Class {
	#name : 'BaselineOfAoCVisualizer',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAoCVisualizer',
	#package : 'BaselineOfAoCVisualizer'
}

{ #category : 'baselines' }
BaselineOfAoCVisualizer >> baseline: spec [

    <baseline>
    spec for: #common do: [ spec package: 'AoCVisualizer' ]
]
