'From Cuis7.3 [latest update: #7081] on 21 March 2025 at 11:42:39 am'!
'Description '!
!provides: 'LayoutMorphDemos' 1 12!
!requires: 'Morf' 1 77 nil!
SystemOrganization addCategory: #LayoutMorphDemos!


!classDefinition: #LayoutMorphDemos category: #LayoutMorphDemos!
Object subclass: #LayoutMorphDemos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'LayoutMorphDemos class' category: #LayoutMorphDemos!
LayoutMorphDemos class
	instanceVariableNames: ''!

!classDefinition: #TextModelMorphDemo1 category: #LayoutMorphDemos!
Object subclass: #TextModelMorphDemo1
	instanceVariableNames: 'firstNameText lastNameText'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'TextModelMorphDemo1 class' category: #LayoutMorphDemos!
TextModelMorphDemo1 class
	instanceVariableNames: ''!

!classDefinition: #TextModelMorphDemo2 category: #LayoutMorphDemos!
Object subclass: #TextModelMorphDemo2
	instanceVariableNames: 'firstNameTMM lastNameTMM firstNameText'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'TextModelMorphDemo2 class' category: #LayoutMorphDemos!
TextModelMorphDemo2 class
	instanceVariableNames: ''!

!classDefinition: #UserInteractionDemo category: #LayoutMorphDemos!
Object subclass: #UserInteractionDemo
	instanceVariableNames: 'greetLabel firstNameModel lastName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'UserInteractionDemo class' category: #LayoutMorphDemos!
UserInteractionDemo class
	instanceVariableNames: ''!


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

!TextModelMorphDemo1 methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 18:10:45'!
firstNameText

	^ firstNameText! !

!TextModelMorphDemo1 methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 18:10:38'!
firstNameText: aText

	firstNameText := aText! !

!TextModelMorphDemo1 methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 18:19:27'!
handleButtonClick
	| message |
	
	"firstNameTMM scroller acceptContents."
	"lastNameTMM scroller acceptContents."
	message := 'Hello {1} {2}!!' format: { firstNameText asString. lastNameText asString }.
	message print.! !

!TextModelMorphDemo1 methodsFor: 'as yet unclassified' stamp: 'RMV 3/21/2025 11:38:54'!
initialize
	| button extent firstNameRow firstNameTMM lastNameRow lastNameTMM window |
		
	firstNameText := Text string: ''.
	firstNameTMM := TextModelMorph
		textProvider: self
		textGetter: #firstNameText
		textSetter: #firstNameText:.
	firstNameTMM
		acceptOnAny: true;
		askBeforeDiscardingEdits: false;
		hideScrollBarsIndefinitely;
		morphExtent: 200 @ 0; "calculates required height for one line"
		tabToFocus: true;
		wrapFlag: false.
	firstNameRow := LayoutMorph newRow
		gap: 10;
		addMorph: (LabelMorph contents: 'First Name:');
		addMorph: firstNameTMM.
	firstNameRow layoutSpec proportionalHeight: 0.

	lastNameText := Text string: ''.
	lastNameTMM := TextModelMorph
		textProvider: self
		textGetter: #lastNameText
		textSetter: #lastNameText:.
	lastNameTMM
		acceptOnAny: true;
		askBeforeDiscardingEdits: false;
		hideScrollBarsIndefinitely;
		morphExtent: 200 @ 0; "calculates required height for one line"
		tabToFocus: true;
		wrapFlag: false.
	lastNameRow := LayoutMorph newRow
		gap: 10;
		addMorph: (LabelMorph contents: 'Last Name:');
		addMorph: lastNameTMM.
	lastNameRow layoutSpec proportionalHeight: 0.

	button := PluggableButtonMorph model: self action: #handleButtonClick label: 'Greet'.
	
	window := SystemWindow new.
	window
		setLabel: 'TextModelMorph Demo';
		addMorph: firstNameRow;
		addMorph: lastNameRow;
		addMorph: button;
		openInWorld.
		
	"Set a background color so it's clear where the TextModelMorphs
	are placed when they do not have focus."
	"TODO: Why must this be changed AFTER openInWorld?"
	window layoutMorph
		color: (Color blue alpha: 0.1);
		separation: 10.
			
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	extent := window layoutMorph minimumExtent.
	window morphExtent: 400 @ extent y.

! !

!TextModelMorphDemo1 methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 18:11:05'!
lastNameText

	^ lastNameText! !

!TextModelMorphDemo1 methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 18:11:13'!
lastNameText: aText

	lastNameText := aText! !

!TextModelMorphDemo1 methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 18:10:25'!
text: aText

	text := aText! !

!TextModelMorphDemo2 methodsFor: 'as yet unclassified' stamp: 'RMV 3/21/2025 11:06:35'!
handleButtonClick
	| message |
	
	"firstNameTMM scroller acceptContents."
	"lastNameTMM scroller acceptContents."
	message := 'Hello {1} {2}!!' format: { firstNameTMM text. lastNameTMM text }.
	message print.! !

!TextModelMorphDemo2 methodsFor: 'as yet unclassified' stamp: 'RMV 3/21/2025 11:42:33'!
initialize
	| button extent firstNameRow lastNameRow window |
		
	firstNameRow := self rowLabel: 'First Name:'.
	firstNameTMM := firstNameRow firstSubmorph.
	lastNameRow := self rowLabel: 'Last Name:'.
	lastNameTMM := lastNameRow firstSubmorph.
	button := PluggableButtonMorph model: self action: #handleButtonClick label: 'Greet'.
	
	window := SystemWindow new.
	window
		setLabel: 'TextModelMorph Demo';
		addMorph: firstNameRow;
		addMorph: lastNameRow;
		addMorph: button;
		openInWorld.
		
	"Set a background color so it's clear where the TextModelMorphs
	are placed when they do not have focus."
	"TODO: Why must this be changed AFTER openInWorld?"
	window layoutMorph
		color: (Color blue alpha: 0.1);
		separation: 10.
			
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	extent := window layoutMorph minimumExtent.
	window morphExtent: 400 @ extent y.
	
	"TODO: Why isn't this trigger calls to update: ?"
	firstNameTMM model addDependent: self.
	lastNameTMM model addDependent: self.! !

!TextModelMorphDemo2 methodsFor: 'as yet unclassified' stamp: 'RMV 3/21/2025 11:36:21'!
rowLabel: aString
	| row tmm |
		
	tmm := TextModelMorph withText: '' ::
		acceptOnAny: true;
		askBeforeDiscardingEdits: false;
		hideScrollBarsIndefinitely;
		morphExtent: 200 @ 0; "calculates required height for one line"
		tabToFocus: true;
		wrapFlag: false.
	row := LayoutMorph newRow
		gap: 10;
		addMorph: (LabelMorph contents: aString);
		addMorph: tmm.
	row layoutSpec proportionalHeight: 0.
	^ row.

! !

!TextModelMorphDemo2 methodsFor: 'as yet unclassified' stamp: 'RMV 3/21/2025 11:39:25'!
update: someValue

	'got update' print.
	someValue print.! !

!UserInteractionDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 15:48:57'!
handleButtonClick
	| firstName greeting |

	firstName := firstNameModel actualContents.
	greeting := firstName isEmpty ifTrue: '' ifFalse: [ 'Hello ', firstName, '!!' ].
	greetLabel contents: greeting.
	
	lastName logAs: 'lastName'.! !

!UserInteractionDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 16:04:05'!
initialize
	| button extent firstNameInput form image label lastNameInput percent row textArea window |
	
	percent := 0.75.
	"Relative file paths start from the Cuis-Smalltalk-Dev-UserFiles directory."
	form := Form fromFileNamed: './hot-air-balloon.png' :: magnifyBy: percent.
	image := ImageMorph newWith: form ::
		scaleBy: percent;
		borderColor: Color red;
		borderWidth: 2.
	"extent := image morphExtent."
	"image morphExtent: (extent x * percent) @ (extent y * percent)."
	
	label := LabelMorph contents: 'First Name:'.
	firstNameModel := TextModel withText: ''.
	firstNameInput := TextModelMorph withModel: firstNameModel ::
		askBeforeDiscardingEdits: false;
		emptyTextDisplayMessage: 'first name';
		hideScrollBarsIndefinitely;
		"Width is set to zero because it is made proportional below.
		 Minimum height for font size is calculated when set to zero."
		morphExtent: 0 @ 0;
		wrapFlag: false.
	firstNameInput layoutSpec proportionalWidth: 1.	
	row := LayoutMorph newRow
		gap: 10;
		addMorph: label;
		addMorph: firstNameInput.
		
	lastName := ''.
	lastNameInput := TextModelMorph textProvider: self textGetter: #lastName textSetter: #lastName:.
	lastNameInput askBeforeDiscardingEdits: false.
	
	textArea := TextModelMorph withText: '' ::
		askBeforeDiscardingEdits: false.
		"borderWidth: 1;
		borderColor: Color red"

	textArea layoutSpec proportionalWidth: 1.
	
	button := PluggableButtonMorph model: self action: #handleButtonClick label: 'Click Me'.

	"TODO: Add a checkbox. "
	"TODO: Add radiobuttons."
	
	greetLabel := LabelMorph contents: ''.
	
	window := SystemWindow new.
	window layoutMorph separation: 10.
	window
		setLabel: 'User Interaction Demo';
		addMorph: image;
		addMorph: row;
		addMorph: lastNameInput;
		addMorph: textArea;
		addMorph: button;
		addMorph: greetLabel;
		openInWorld.
		
	image morphExtent: 158 @ 208.
	image minimumExtent logAs: 'min extent'.
	
	"Set a background color so it's clear where the TextModelMorphs
	are placed when they do not have focus."
	"TODO: Why must this be changed AFTER openInWorld?"
	window layoutMorph color: (Color blue alpha: 0.1).
			
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	extent := window layoutMorph minimumExtent.
	window morphExtent: 400 @ extent y.
	
! !

!UserInteractionDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 15:48:21'!
lastName

	^ lastName! !

!UserInteractionDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 16:08:37'!
lastName: aString

	aString logAs: 'lastName: aString'.
	lastName := aString.
	self changed.! !

!UserInteractionDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 16:20:46'!
update: aString

	aString logAs: 'UserInteractionDemo update: aString'! !
