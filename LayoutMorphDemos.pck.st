'From Cuis7.3 [latest update: #7092] on 26 March 2025 at 4:04:35 pm'!
'Description '!
!provides: 'LayoutMorphDemos' 1 30!
!requires: 'Morf' 1 77 nil!
SystemOrganization addCategory: #LayoutMorphDemos!


!classDefinition: #ButtonDemo category: #LayoutMorphDemos!
Object subclass: #ButtonDemo
	instanceVariableNames: 'layout'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'ButtonDemo class' category: #LayoutMorphDemos!
ButtonDemo class
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

!classDefinition: #ListDemo category: #LayoutMorphDemos!
Object subclass: #ListDemo
	instanceVariableNames: 'colorList colors newColor newColorEntry selectedColorIndex selectedLabel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'ListDemo class' category: #LayoutMorphDemos!
ListDemo class
	instanceVariableNames: ''!

!classDefinition: #TextModelMorphDemo category: #LayoutMorphDemos!
Object subclass: #TextModelMorphDemo
	instanceVariableNames: 'text textModel'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'TextModelMorphDemo class' category: #LayoutMorphDemos!
TextModelMorphDemo class
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

!classDefinition: #TextModelMorphDemo3 category: #LayoutMorphDemos!
Object subclass: #TextModelMorphDemo3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'TextModelMorphDemo3 class' category: #LayoutMorphDemos!
TextModelMorphDemo3 class
	instanceVariableNames: ''!

!classDefinition: #UserInteractionDemo category: #LayoutMorphDemos!
Object subclass: #UserInteractionDemo
	instanceVariableNames: 'firstName greetLabel lastName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'UserInteractionDemo class' category: #LayoutMorphDemos!
UserInteractionDemo class
	instanceVariableNames: ''!

!classDefinition: #UserInteractionDemoOld category: #LayoutMorphDemos!
Object subclass: #UserInteractionDemoOld
	instanceVariableNames: 'greetLabel firstNameTMM lastNameTMM'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'UserInteractionDemoOld class' category: #LayoutMorphDemos!
UserInteractionDemoOld class
	instanceVariableNames: ''!


!ButtonDemo methodsFor: 'private' stamp: 'rmv 3/26/2025 15:09:02'!
toggleColor
	
	layout color: (
		layout color = Color red
			ifTrue: [ Color blue ]
			ifFalse: [ Color red ]
	)
! !

!ButtonDemo methodsFor: 'initialization' stamp: 'rmv 3/26/2025 15:16:37'!
initialize
	| button extent window |
	
	button := PluggableButtonMorph
		model: self
		action: #toggleColor
		label: 'Toggle'.
	button setBalloonText: 'toggle background color'.
	window := SystemWindow new.
	window
		setLabel: 'Button Demo';
		addMorph: button;
		openInWorld.
		
	extent := button morphExtent.
	button morphExtent: (extent x + 15) @ extent y.
		
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	layout := window layoutMorph.
	layout padding: 10.
	window morphExtent: 300 @ layout minimumExtent y.! !

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

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/26/2025 15:15:39'!
colors

	^ colors! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/26/2025 15:43:59'!
newColor

	^ newColor
! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/26/2025 16:02:13'!
newColor: aString

	newColor := aString
! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/26/2025 15:14:16'!
selectedColorIndex

	^ selectedColorIndex
! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/26/2025 15:54:25'!
selectedColorIndex: anIndex

	selectedColorIndex := anIndex.
	selectedLabel contents: ('You selected {1}.' format: { colors at: anIndex }).! !

!ListDemo methodsFor: 'initialization' stamp: 'rmv 3/26/2025 16:02:27'!
initialize
	| addButton deleteButton layout window |
	
	colors := SortedCollection newFrom: #(red green blue).
	selectedColorIndex := 0.
	newColor := ''.
	
	colorList := PluggableListMorph
		withModel: self
		listGetter: #colors
		indexGetter: #selectedColorIndex
		indexSetter: #selectedColorIndex:.
	newColorEntry :=  self textEntryOn: #newColor.
	addButton := PluggableButtonMorph model: self action: #addColor label: 'Add Color'.
	deleteButton := PluggableButtonMorph model: self action: #deleteColor label: 'Delete Selected Color'.
	selectedLabel := LabelMorph contents: ''.
	
	window := SystemWindow new.
	window
		setLabel: 'List Demo';
		addMorph: colorList;
		addMorph: newColorEntry;
		addMorph: addButton;
		addMorph: deleteButton;
		addMorph: selectedLabel;
		openInWorld.
		
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	layout := window layoutMorph.
	layout padding: 10.
	window morphExtent: 300 @ layout minimumExtent y.! !

!ListDemo methodsFor: 'private' stamp: 'rmv 3/26/2025 16:04:26'!
addColor

	newColor isEmpty ifFalse: [
		colors add: newColor string asSymbol.
		newColorEntry contents:​ ''.
		colorList updateList.
	]! !

!ListDemo methodsFor: 'private' stamp: 'rmv 3/26/2025 16:03:44'!
deleteColor

	selectedColorIndex = 0 ifFalse: [
		colors removeAt: selectedColorIndex.
		colorList updateList.
		selectedColorIndex := 0.
		selectedLabel contents: ''.
	]! !

!ListDemo methodsFor: 'private' stamp: 'rmv 3/26/2025 15:28:12'!
textEntryOn: aSymbol
	"Answer a TextModelMorph where aSymbol provides the name for the getter and setter."
	| entry |
		
	entry := TextModelMorph
		textProvider: self
		textGetter: aSymbol
		textSetter: (aSymbol, ':') asSymbol ::
		acceptOnAny: true;
		askBeforeDiscardingEdits: false;
		hideScrollBarsIndefinitely;
		"Width is made proportional below.
		Setting height to zero causes it to use minimum height for one line."
		morphExtent: 0 @ 0;
		tabToFocus: true;
		wrapFlag: false.
	entry layoutSpec proportionalWidth: 1.
	^ entry.
! !

!TextModelMorphDemo methodsFor: 'as yet unclassified' stamp: 'hlsf 3/22/2025 12:34:50'!
handleButtonClick
	textModel scroller acceptContents.
	self changed: #text:.
	self changed: #relabel! !

!TextModelMorphDemo methodsFor: 'as yet unclassified' stamp: 'hlsf 3/22/2025 12:42:11'!
initialize
	| button tm1 tm2 row window |
		
	text := 'initial value'.
	textModel := TextModelMorph textProvider: self textGetter: #text textSetter: #text:.
	button := PluggableButtonMorph model: self action: #handleButtonClick label: 'Click Me'.
	
	tm1 := TextModelMorph textProvider: self textGetter: #text textSetter:nil ::
		disableEditing. 
	tm2 := TextModelMorph textProvider: self textGetter: #text textSetter:nil ::
		disableEditing;
		morphExtent: 40@300 .  
	row := LayoutMorph newRow.
	row addMorph: tm2;
		addMorph: (LayoutMorph newColumn ::
			addMorph: textModel;
			addMorph: button;
			addMorph: tm1).
		
	window := SystemWindow new
		setLabel: 'TextModelMorphDemo';
		model: self;
		addMorph: row.
		
	"The observer pattern, better "
	self when: #relabel send: #relabel to: window.
	window openInWorld.
		
! !

!TextModelMorphDemo methodsFor: 'as yet unclassified' stamp: 'hlsf 3/22/2025 12:34:15'!
labelString
	^ text contractTo: 10! !

!TextModelMorphDemo methodsFor: 'as yet unclassified' stamp: 'RMV 3/20/2025 16:31:41'!
text

	^ text! !

!TextModelMorphDemo methodsFor: 'as yet unclassified' stamp: 'hlsf 3/22/2025 12:42:48'!
text: aString
	text := aString asString copy.
	self changed: #text.
	self changed: #clearUserEdits.
	self changed: #relabel "Same as self triggerEvent: #relabel"! !

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

!TextModelMorphDemo2 methodsFor: 'as yet unclassified' stamp: 'rmv 3/23/2025 08:22:55'!
handleButtonClick
	| message |
	
	message := 'Hello {1} {2}!!' format: { firstNameTMM text. lastNameTMM text }.
	message print.! !

!TextModelMorphDemo2 methodsFor: 'as yet unclassified' stamp: 'rmv 3/23/2025 16:20:00'!
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
	
	"This requires adding the following in InnerTextMorph acceptContents after accepted is set:
	accepted class = TextModel ifTrue: [ owner changed: owner ]."
	"firstNameTMM addDependent: self.
	lastNameTMM addDependent: self."
	"firstNameTMM model addDependent: self.
	lastNameTMM model addDependent: self."
	firstNameTMM model when: #actualContents send: #update to: self.
! !

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

!TextModelMorphDemo2 methodsFor: 'as yet unclassified' stamp: 'rmv 3/23/2025 16:18:44'!
update: sender
	
	sender logAs: 'sender'.
	
	"sender = firstNameTMM ifTrue: [
		value := sender model actualContents asString.
		'first name is now ', value :: print
	].
	sender = lastNameTMM ifTrue: [
		value := sender model actualContents asString.
		'last name is now ', value :: print
	]."
! !

!TextModelMorphDemo3 methodsFor: 'as yet unclassified' stamp: 'rmv 3/24/2025 14:34:46'!
initialize
	| tmm |
	
	tmm := TextModelMorph withText: '' ::
		acceptOnAny: true;
		askBeforeDiscardingEdits: false.
	tmm keystrokeAction: [:event |
		tmm text logAs: 'text'.
	].
"	scroller := tmm scroller.
	scroller addDependent: self.
	scroller setProperty: #keyStroke: toValue: [:event |
		scroller changed: scroller model actualContents string
	].
"
	SystemWindow new addMorph: tmm; openInWorld.
! !

!TextModelMorphDemo3 methodsFor: 'as yet unclassified' stamp: 'rmv 3/24/2025 07:50:54'!
update: arg
	
	arg logAs: 'arg'.
! !

!UserInteractionDemo methodsFor: 'accessing' stamp: 'rmv 3/25/2025 13:42:46'!
firstName

	^ firstName! !

!UserInteractionDemo methodsFor: 'accessing' stamp: 'rmv 3/25/2025 13:42:46'!
firstName: aString

	firstName := aString! !

!UserInteractionDemo methodsFor: 'accessing' stamp: 'rmv 3/25/2025 13:42:53'!
lastName

	^ lastName! !

!UserInteractionDemo methodsFor: 'accessing' stamp: 'rmv 3/25/2025 13:42:53'!
lastName: aString

	lastName := aString! !

!UserInteractionDemo methodsFor: 'private' stamp: 'rmv 3/26/2025 13:45:32'!
greet
	| greeting |

	greeting := firstName isEmpty
		ifTrue: ''
		ifFalse: [ 'Hello {1} {2}!!' format: {firstName. lastName} ].
	greetLabel contents: greeting.! !

!UserInteractionDemo methodsFor: 'private' stamp: 'rmv 3/25/2025 18:50:48'!
rowLabeled: aString for: aMorph
	"Answer a row LayoutMorph containing a LabelMorph and a given morph."
	| row |
		
	row := LayoutMorph newRow
		gap: 10;
		addMorph: (LabelMorph contents: aString);
		addMorph: aMorph.
	row layoutSpec proportionalHeight: 0.
	^ row.! !

!UserInteractionDemo methodsFor: 'private' stamp: 'rmv 3/26/2025 13:44:33'!
textEntryOn: aSymbol
	"Answer a TextModelMorph where aSymbol provides the name for the getter and setter."
	| entry |
		
	entry := TextModelMorph
		textProvider: self
		textGetter: aSymbol
		textSetter: (aSymbol, ':') asSymbol ::
		acceptOnAny: true;
		askBeforeDiscardingEdits: false;
		hideScrollBarsIndefinitely;
		"Width is made proportional below.
		Setting height to zero causes it to use minimum height for one line."
		morphExtent: 0 @ 0;
		tabToFocus: true;
		wrapFlag: false.
	entry layoutSpec proportionalWidth: 1.
	^ entry.
! !

!UserInteractionDemo methodsFor: 'initialization' stamp: 'rmv 3/26/2025 14:49:37'!
initialize
	| button extent firstNameEntry form image lastNameEntry window |
	
	firstName := ''.
	lastName := ''.
	
	"Relative file paths start from the Cuis-Smalltalk-Dev-UserFiles directory."
	form := Form fromFileNamed: './hot-air-balloon.png' :: magnifyBy: 0.5.
	image := ImageMorph newWith: form.
	
	firstNameEntry := self textEntryOn: #firstName.
	lastNameEntry := self textEntryOn: #lastName.
	button := PluggableButtonMorph model: self action: #greet label: 'Greet'.
	
	greetLabel := LabelMorph contents: ''.
	
	window := SystemWindow new.
	window layoutMorph separation: 10.
	window
		setLabel: 'User Interaction Demo';
		addMorph: image;
		addMorph: (self rowLabeled: 'First Name:' for: firstNameEntry);
		addMorph: (self rowLabeled: 'Last Name:' for: lastNameEntry);
		addMorph: button;
		addMorph: greetLabel;
		openInWorld.
		
	"Set a background color so it's clear where the TextModelMorphs
	are placed when they do not have focus."
	"TODO: Why must this be changed AFTER openInWorld?"
	window layoutMorph color: (Color blue alpha: 0.1).
			
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	extent := window layoutMorph minimumExtent.
	window morphExtent: 400 @ extent y.
	
! !

!UserInteractionDemoOld methodsFor: 'as yet unclassified' stamp: 'rmv 3/24/2025 16:30:40'!
greet
	| firstName greeting lastName |

	firstName := firstNameTMM text.
	lastName := lastNameTMM text.
	greeting := firstName isEmpty
		ifTrue: ''
		ifFalse: [ 'Hello {1} {2}!!' format: {firstName. lastName} ].
	greetLabel contents: greeting.! !

!UserInteractionDemoOld methodsFor: 'as yet unclassified' stamp: 'rmv 3/24/2025 16:43:55'!
initialize
	| button extent firstNameRow form image lastNameRow window |
	
	"Relative file paths start from the Cuis-Smalltalk-Dev-UserFiles directory."
	form := Form fromFileNamed: './hot-air-balloon.png' :: magnifyBy: 0.5.
	image := ImageMorph newWith: form.
	
	firstNameRow := self rowLabel: 'First Name:'.
	firstNameTMM := firstNameRow submorphs first.
	lastNameRow := self rowLabel: 'Last Name:'.
	lastNameTMM := lastNameRow submorphs first.
	button := PluggableButtonMorph model: self action: #greet label: 'Greet'.
	
	greetLabel := LabelMorph contents: ''.
	
	window := SystemWindow new.
	window layoutMorph separation: 10.
	window
		setLabel: 'User Interaction Demo';
		addMorph: image;
		addMorph: firstNameRow;
		addMorph: lastNameRow;
		addMorph: button;
		addMorph: greetLabel;
		openInWorld.
		
	"Set a background color so it's clear where the TextModelMorphs
	are placed when they do not have focus."
	"TODO: Why must this be changed AFTER openInWorld?"
	window layoutMorph color: (Color blue alpha: 0.1).
			
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	extent := window layoutMorph minimumExtent.
	window morphExtent: 400 @ extent y.
	
! !

!UserInteractionDemoOld methodsFor: 'as yet unclassified' stamp: 'rmv 3/24/2025 16:45:49'!
rowLabel: aString
	"Answer a row LayoutMorph containing a LabelMorph and a TextModelMorph."
	| row tmm |
		
	tmm := TextModelMorph withText: '' ::
		acceptOnAny: true;
		askBeforeDiscardingEdits: false;
		hideScrollBarsIndefinitely;
		"Width is made proportional below.
		Setting height to zero causes it to use minimum height for one line."
		morphExtent: 0 @ 0;
		tabToFocus: true;
		wrapFlag: false.
	tmm layoutSpec proportionalWidth: 1.
	row := LayoutMorph newRow
		gap: 10;
		addMorph: (LabelMorph contents: aString);
		addMorph: tmm.
	row layoutSpec proportionalHeight: 0.
	^ row.! !
