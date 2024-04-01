"
Class: Equivalent of Javadoc for Pharo.
Responsibility: It gives a documentation similar to one of Javadoc given the name of a class.
"
Class {
	#name : #PharoDoc,
	#superclass : #Object,
	#category : #PharoDoc
}

{ #category : #'as yet unclassified' }
PharoDoc >> pharoDoc: classDoc [
	"Gives the superclass, subclasses, instance variables, methods and senders' methods of a class."
	|methodsDoc methodsName senders message|
	methodsDoc := classDoc methods.
	methodsName := methodsDoc collect: [:m | m name].
	senders := methodsDoc collect: [:m | m senders].
	
	message := String streamContents: [ :stream |
		stream nextPutAll: 'Class: ';
			nextPutAll: classDoc asString;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Superclass: ';
			nextPutAll: classDoc superclass asString;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Subclasses: ';
			nextPutAll: classDoc subclasses asString;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Instance variables: ';
			nextPutAll: classDoc instVarNames asString;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Methods: ';
			nextPutAll: methodsName  printString;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: 'Senders: ';
			nextPutAll: senders  printString.].
	^ message
]
