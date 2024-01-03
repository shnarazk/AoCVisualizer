"
AoC2023: Rust.
"
Class {
	#name : 'AoCResult2023',
	#superclass : 'AoCResult',
	#classTraits : '',
	#category : 'AoCVisualizer-AoC2023',
	#package : 'AoCVisualizer',
	#tag : 'AoC2023'
}

{ #category : 'accessing' }
AoCResult2023 >> results [

	<script: 'self new open'>
	| rust |
	rust := Dictionary new at: 1 put: 1.9;
		        at: 2 put: 0.7;
		        at: 3 put: 2.0;
		        at: 4 put: 0.8;
		        at: 5 put: 0.5;
		        at: 6 put: 0.1;
		        at: 7 put: 7.6;
		        at: 8 put: 5.5;
		        at: 9 put: 0.7;
		        at: 10 put: 196.4;
		        at: 11 put: 1.1;
		        at: 12 put: 175.8;
		        at: 13 put: 1.0;
		        at: 14 put: 75.5;
		        at: 15 put: 0.8;
		        at: 16 put: 301.6;
		        at: 17 put: 207.3;
		        at: 18 put: 249.1;
		        at: 19 put: 4.5;
		        at: 20 put: 346.5;
		        at: 21 put: 1628.3;
		        at: 22 put: 31.7;
		        at: 23 put: 7592.5;
		        at: 24 put: 20.5;
		        at: 25 put: 234.5;
		        yourself.
	^ Dictionary new at: 'Rust' put: rust;
		  yourself
]
