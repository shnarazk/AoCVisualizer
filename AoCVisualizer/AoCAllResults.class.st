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
	"jsons inject: OrderedCollection new into: [ :collection :each ]"
	^ jsons flattened
]
