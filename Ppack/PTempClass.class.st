Class {
	#name : 'PTempClass',
	#superclass : 'Object',
	#category : 'Ppack',
	#package : 'Ppack'
}

{ #category : 'math' }
PTempClass class >> consineDist: v1 vector2: v2 [

	| dot v1c v2c s1 s2 |
	dot := v1 dot: v2.
	v1c := v1 clone.
	v2c := v2 clone.
	s1 := (v1c primMulArray: v1) sum sqrt.
	s2 := (v2c primMulArray: v2) sum sqrt.
	^ dot / (s1 * s2)
]

{ #category : 'math' }
PTempClass class >> hamming2: anInteger and: anotherInteger [
	"Calculate the Hamming distance between two 32-bit integers."

	| xor |
	xor := anInteger bitXor: anotherInteger.
	^ (0 to: ((16 * 8) -1))  inject: 0 into: [ :count :bitPosition |
		  (xor bitAt: bitPosition + 1) = 1
			  ifTrue: [ count + 1 ]
			  ifFalse: [ count ] ]
]

{ #category : 'math' }
PTempClass class >> hamming: x and: y [ 
    "Calculate the Hamming distance between two integers using a fast bit counting method."
    | xorResult |
    xorResult := x bitXor: y.
    
    "Step 1: Count bits in groups of 2"
    xorResult := (xorResult bitAnd: 16r5555555555555555) + 
                ((xorResult bitShift: -1) bitAnd: 16r5555555555555555).
    
    "Step 2: Count bits in groups of 4"
    xorResult := (xorResult bitAnd: 16r3333333333333333) + 
                ((xorResult bitShift: -2) bitAnd: 16r3333333333333333).
    
    "Step 3: Count bits in groups of 8"
    xorResult := (xorResult bitAnd: 16r0F0F0F0F0F0F0F0F) + 
                ((xorResult bitShift: -4) bitAnd: 16r0F0F0F0F0F0F0F0F).
    
    "Step 4: Count bits in groups of 16"
    xorResult := (xorResult bitAnd: 16r00FF00FF00FF00FF) + 
                ((xorResult bitShift: -8) bitAnd: 16r00FF00FF00FF00FF).
    
    "Step 5: Count bits in groups of 32"
    xorResult := (xorResult bitAnd: 16r0000FFFF0000FFFF) + 
                ((xorResult bitShift: -16) bitAnd: 16r0000FFFF0000FFFF).
    
    "Step 6: Final count"
    ^ (xorResult bitAnd: 16r00000000FFFFFFFF) + 
      ((xorResult bitShift: -32) bitAnd: 16r00000000FFFFFFFF)

]

{ #category : 'math' }
PTempClass class >> randomVector: size [


| vector random |
        
        "Create a FloatArray of the specified size"
        vector := Float32Array new: size.
        
        "Create a random number generator"
        random := Random new.
        
        "Fill the vector with random values between 0 and 1"
        1 to: size do: [:i | vector at: i put: random next].
                
        ^ vector


]

{ #category : 'as yet unclassified' }
PTempClass class >> readAndWriteToDiskBench [

| vec file stream inpub res input random |
file := '/tmp/vectors.bin' asFileReference .
stream := file binaryWriteStream .
2000 timesRepeat: [
	vec := PTempClass randomVector: 385.
	vec do: [ :each | 
		stream int32: each asIEEE32BitWord 
	]].
stream close.

input := file binaryReadStream .
random := Random new.
1 to: 2000 do: [ :each | 	
input position: (random nextInteger: 1999) * 385 * 4.		
res := (vec collect: [ :i |
	Float fromIEEE32Bit: input int32 
	 ]) asFloatArray ] .
input close.
]

{ #category : 'as yet unclassified' }
PTempClass class >> saveArray [

| vec statement res client |
vec := PTempClass randomVector: 385.
client := P3Client new url: 'psql://pvector:pvector@localhost:5432/pvector'.
statement := client prepare: 'INSERT INTO documents (content) VALUES ($1)'.
[ statement execute: { P3ValuesArray withAll: vec } ] bench inspect.
[ res := client query: 'select content from documents limit 1' ] bench inspect.
{ res firstRecord first asFloatArray . vec } inspect.
client close.
]

{ #category : 'tests' }
PTempClass class >> testSpeed [

	| fileStream r s |
	r := Random new.
	fileStream := FileSystem disk binaryReadStreamOn:
		              '/home/petter/Downloads/ProPlusRetail.img'.
	s := fileStream size - 3000.
	fileStream reset.
	[
	"fileStream reset."
	fileStream position: (r nextInteger: s).
	fileStream next: 1024.
	] bench inspect.
	fileStream close
]
