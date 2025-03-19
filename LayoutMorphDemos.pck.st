'From Cuis7.3 [latest update: #7081] on 19 March 2025 at 12:34:41 pm'!
'Description '!
!provides: 'LayoutMorphDemos' 1 7!
!requires: 'Morf' 1 77 nil!
SystemOrganization addCategory: #LayoutMorphDemos!


!classDefinition: #FormDemo category: #LayoutMorphDemos!
Object subclass: #FormDemo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'FormDemo class' category: #LayoutMorphDemos!
FormDemo class
	instanceVariableNames: ''!

!classDefinition: #LayoutMorphDemos category: #LayoutMorphDemos!
Object subclass: #LayoutMorphDemos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'LayoutMorphDemos class' category: #LayoutMorphDemos!
LayoutMorphDemos class
	instanceVariableNames: ''!


!FormDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/19/2025 12:30:39'!
handleButtonClick

	'got click' print! !

!FormDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/19/2025 12:33:58'!
initialize
	| button extent label window |
	
	label := LabelMorph contents: 'Hello!!'.
	button := PluggableButtonMorph model: self action: #handleButtonClick label: 'Click Me'.

	window := SystemWindow new.
	window
		setLabel: 'Form Demo';
		addMorph: label;
		addMorph: button;
		openInWorld.
		
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	extent := window layoutMorph minimumExtent.
	window morphExtent: 300 @ extent y.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'rmv 3/9/2025 08:14:52'!
demo2
	| layout |
		
	layout := self makeRow.
	layout morphExtent: 300 @ 150.
	layout openInWorld.
! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'rmv 3/9/2025 08:23:00'!
demo3
	| layout |
		
	layout := self makeRow.
	layout morphExtent: 300 @ 150.

	layout axisEdgeWeight: #rowLeft. "default"
	"layout axisEdgeWeight: #center."
	"layout axisEdgeWeight: #rowRight."
	
	layout gap: 10. "default is 0"
	
	"The default offAxisEdgeWeight for all submorphs is 0.5 which centers.
	For a row layout, 0 moves to top and 1 moves to bottom."
	layout submorphs do: [ :submorph | submorph layoutSpec offAxisEdgeWeight: 0 ].
	
	layout openInWorld.
! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:22:13'!
example1
	| layout |
		
	layout := self makeRow.
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example1.png'! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:22:17'!
example10
	| center column1 column2 row |
	
	column1 := LayoutMorph newColumn
		addMorph: (LabelMorph contents: 'Apple');
		addMorph: (LabelMorph contents: 'Banana');
		addMorph: (LabelMorph contents: 'Cherry');
		borderColor: Color red; borderWidth: 2.
	column1 layoutSpec proportionalHeight: 0.
	

	column2 := LayoutMorph newColumn
		addMorph: (LabelMorph contents: 'Spring');
		addMorph: (LabelMorph contents: 'Winter');
		addMorph: (LabelMorph contents: 'Summer');
		addMorph: (LabelMorph contents: 'Fall');
		borderColor: Color blue; borderWidth: 2.
	column2 layoutSpec proportionalHeight: 0.
		
	center := LabelMorph contents: 'What are your favorites?'.
	center borderColor: Color green; borderWidth: 2.
	
	row := LayoutMorph newRow
		separation: 20;
		addMorph: column1;
		addMorph: center;
		addMorph: column2.
				
	row openInWorld.
	
	row writePNG: self path, 'ch03-layoutmorph-example10.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:22:08'!
example2
	| layout |
		
	layout := self makeRow.
	layout padding: 10.
	"layout gap: 10."
	"layout separation: 10."
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example2.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:22:24'!
example3
	| layout |
		
	layout := self makeRow.
	layout padding: 10.
	layout gap: 10.
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example3.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:22:46'!
example4
	| layout |
		
	layout := self makeRow.
	layout morphExtent: 350 @ 150.
	layout padding: 10.
	layout gap: 10.
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example4.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:22:42'!
example5
	| layout |
		
	layout := self makeRow.
	layout morphExtent: 350 @ 150.
	layout padding: 10.
	layout gap: 10.
	layout axisEdgeWeight: 0.5.
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example5.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:22:56'!
example6
	| layout |
		
	layout := self makeRow.
	layout morphExtent: 350 @ 150.
	layout padding: 10.
	layout gap: 10.
	layout axisEdgeWeight: 0.5.
	layout submorphsDo: [:submorph | submorph layoutSpec offAxisEdgeWeight: 0].
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example6.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:23:02'!
example7
	| box1 box2 box3 layout |
				
	box1 := ColoredBoxMorph new color: Color red; morphExtent: 50 @ 75.
	box2 := ColoredBoxMorph new color: Color green; morphExtent: 75 @ 50.
	box2 layoutSpec proportionalWidth: 1.
	box3 := ColoredBoxMorph new color: Color blue; morphExtent: 100 @ 100.
	layout := LayoutMorph newRow
		morphExtent: 350 @ 150;
		separation: 10;
		addMorph: box1;
		addMorph: box2;
		addMorph: box3.
	layout submorphsDo: [:submorph | submorph layoutSpec offAxisEdgeWeight: 0].
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example7.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:23:08'!
example8
	| box1 box2 box3 layout spacer1 spacer2 |
				
	box1 := ColoredBoxMorph new color: Color red; morphExtent: 50 @ 75.
	box2 := ColoredBoxMorph new color: Color green; morphExtent: 75 @ 50.
	box3 := ColoredBoxMorph new color: Color blue; morphExtent: 100 @ 100.
	spacer1 := ColoredBoxMorph new color: Color transparent.
	spacer1 layoutSpec proportionalWidth: 1.
	spacer2 := ColoredBoxMorph new color: Color transparent.
	spacer2 layoutSpec proportionalWidth: 1.
	layout := LayoutMorph newRow
		morphExtent: 350 @ 150;
		separation: 10;
		addMorph: box1;
		addMorph: spacer1;
		addMorph: box2;
		addMorph: spacer2;
		addMorph: box3.
	layout openInWorld.
	
	layout writePNG: self path, 'ch03-layoutmorph-example8.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:23:16'!
example9
	| column1 column2 row |
	
	column1 := LayoutMorph newColumn
		addMorph: (LabelMorph contents: 'Apple');
		addMorph: (LabelMorph contents: 'Banana');
		addMorph: (LabelMorph contents: 'Cherry').
	column1 layoutSpec proportionalHeight: 0.

	column2 := LayoutMorph newColumn
		addMorph: (LabelMorph contents: 'Spring');
		addMorph: (LabelMorph contents: 'Winter');
		addMorph: (LabelMorph contents: 'Summer');
		addMorph: (LabelMorph contents: 'Fall').
	column2 layoutSpec proportionalHeight: 0.
		
	row := LayoutMorph newRow
		separation: 20;
		addMorph: column1;
		addMorph: (LabelMorph contents: 'What are your favorites?');
		addMorph: column2.
				
	row openInWorld.
	
	row writePNG: self path, 'ch03-layoutmorph-example9.png'.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'rmv 3/9/2025 08:13:22'!
makeRow
	| box1 box2 box3 |
		
	box1 := ColoredBoxMorph new color: Color red; morphExtent: 50 @ 75.
	box2 := ColoredBoxMorph new color: Color green; morphExtent: 75 @ 50.
	box3 := ColoredBoxMorph new color: Color blue; morphExtent: 100 @ 100.
	^ LayoutMorph newRow
		addMorph: box1;
		addMorph: box2;
		addMorph: box3.! !

!LayoutMorphDemos class methodsFor: 'as yet unclassified' stamp: 'RMV 3/13/2025 11:21:05'!
path
	^​ '/Users/volkmannm/Documents/dev/lang/smalltalk/Cuis-Booklets/designGUI/chapter-03/img/'! !
