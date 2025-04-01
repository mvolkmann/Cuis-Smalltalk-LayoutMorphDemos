'From Cuis7.3 [latest update: #7092] on 1 April 2025 at 3:04:41 pm'!
'Description '!
!provides: 'LayoutMorphDemos' 1 56!
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

!classDefinition: #CheckboxMenu category: #LayoutMorphDemos!
Object subclass: #CheckboxMenu
	instanceVariableNames: 'items menu selectedItems'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'CheckboxMenu class' category: #LayoutMorphDemos!
CheckboxMenu class
	instanceVariableNames: 'items'!

!classDefinition: #CheckboxMenuDemo category: #LayoutMorphDemos!
Object subclass: #CheckboxMenuDemo
	instanceVariableNames: 'colorButton colorMenu colors messageLabel window'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'CheckboxMenuDemo class' category: #LayoutMorphDemos!
CheckboxMenuDemo class
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
	instanceVariableNames: 'colorList colors deleteButton newColorEntry selectedColorIndex selectedLabel window'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'ListDemo class' category: #LayoutMorphDemos!
ListDemo class
	instanceVariableNames: ''!

!classDefinition: #MenuDemo category: #LayoutMorphDemos!
Object subclass: #MenuDemo
	instanceVariableNames: 'colorButton colorMenu colors window'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'LayoutMorphDemos'!
!classDefinition: 'MenuDemo class' category: #LayoutMorphDemos!
MenuDemo class
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


!ButtonDemo methodsFor: 'private' stamp: 'rmv 3/26/2025 15:09:02'!
toggleColor
	
	layout color: (
		layout color = Color red
			ifTrue: [ Color blue ]
			ifFalse: [ Color red ]
	)
! !

!ButtonDemo methodsFor: 'initialization' stamp: 'rmv 4/1/2025 14:37:29'!
initialize
	| button extent window |
	
	button := PluggableButtonMorph
		model: self
		action: #toggleColor
		label: 'Toggle'.
	button setBalloonText: 'toggle background color'.
	window := SystemWindow new.
	window setLabel: 'Button Demo'; addMorph: button.
		
	extent := button morphExtent.
	button morphExtent: (extent x + 15) @ extent y.
		
	"Set window size to the smallest height that contains its submorphs."
	layout := window layoutMorph.
	layout padding: 10.
	window
		morphExtent: 300 @ layout minimumExtent y;
		openInWorld.
! !

!CheckboxMenu methodsFor: 'accessing' stamp: 'rmv 4/1/2025 14:13:41'!
items: aCollection

	items := aCollection! !

!CheckboxMenu methodsFor: 'accessing' stamp: 'rmv 4/1/2025 14:07:26'!
selectedItems

	^ selectedItems! !

!CheckboxMenu methodsFor: 'initialization' stamp: 'rmv 4/1/2025 14:18:59'!
initialize
	
	selectedItems := Set new! !

!CheckboxMenu methodsFor: 'user interface' stamp: 'rmv 4/1/2025 14:18:47'!
open
	| index item |

	self updateMenuLabels.
	index := menu startUpMenu.
	index = 0 ifFalse: [
		item := items at: index.
		selectedItems includes: item ::
			ifTrue: [ selectedItems remove: item ]
			ifFalse: [ selectedItems add: item ].
	].! !

!CheckboxMenu methodsFor: 'private' stamp: 'rmv 4/1/2025 14:30:23'!
updateMenuLabels
	| labels prefix |

	"Create label strings that have prefixes that indicate whether each item is selected."
	labels := items collect: [ :item |
		prefix := selectedItems includes: item :: ifTrue: '<on>' ifFalse: '<off>'.
		"Alternative can use <yes> and <no>."
		prefix, item asString
	].
	
	menu := SelectionMenu labels: labels lines: #().! !

!CheckboxMenu class methodsFor: 'as yet unclassified' stamp: 'rmv 4/1/2025 14:13:26'!
items: aCollection

	^ self new items: aCollection! !

!CheckboxMenuDemo methodsFor: 'user interface' stamp: 'rmv 4/1/2025 14:23:18'!
openMenu
	| index message |

	index := colorMenu open.
	index = 0 ifFalse: [ self updateMessage ].! !

!CheckboxMenuDemo methodsFor: 'user interface' stamp: 'rmv 4/1/2025 14:22:31'!
updateMessage
	| message selectedColors |

	selectedColors := colorMenu selectedItems.
	message := selectedColors isEmpty
		ifTrue: 'No colors are selected.'
		ifFalse: [
			'You selected {1}.' format:
				{ selectedColors asSortedCollection asOxfordCommaStringAnd }
		].
	messageLabel contents: message.! !

!CheckboxMenuDemo methodsFor: 'initialization' stamp: 'rmv 4/1/2025 14:33:20'!
initialize
	| layout |
	
	colors := #(red orange yellow green blue purple).
	colorMenu := CheckboxMenu items:​ colors.
		
	colorButton := PluggableButtonMorph
		model: self
		action: #openMenu
		label: 'Select Color'.
	messageLabel := LabelMorph contents: ''.
	self updateMessage.
	
	window := SystemWindow new.
	window
		setLabel: 'Checkbox Menu Demo';
		addMorph: colorButton;
		addMorph: messageLabel.
		
	"Set window size to the smallest height that contains its submorphs."
	layout := window layoutMorph.
	layout separation: 10.
	window
		morphExtent: 500 @ layout minimumExtent y;
		openInWorld.
! !

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

!ListDemo methodsFor: 'callback-ui' stamp: 'rmv 3/28/2025 13:55:45'!
addColor
	
	self newColor: newColorEntry text! !

!ListDemo methodsFor: 'callback-ui' stamp: 'rmv 3/28/2025 14:25:30'!
colors

	^ colors! !

!ListDemo methodsFor: 'callback-ui' stamp: 'rmv 3/27/2025 13:49:39'!
deleteColor

	selectedColorIndex = 0 ifFalse: [
		colors removeAt: selectedColorIndex.
		self selectedColorIndex: 0.
		colorList updateList.
		selectedLabel contents: ''.
	]! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/28/2025 14:21:30'!
newColor
	"In this app there is no need to retrieve this value
	or even hold it in an instance variable, but
	TextModelMorph requires that this method exists."
	
	^ ''! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/28/2025 16:30:40'!
newColor: aText
	| potentialColor |

	potentialColor := aText asString withBlanksTrimmed.
	potentialColor ifNotEmpty: [
		colors add: potentialColor asSymbol.
		colorList updateList.
		self selectedColorIndex: (colors indexOf: potentialColor ).
		self changed: #clearUserEdits.
		self changed: #newColor.
	].
! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 3/26/2025 15:14:16'!
selectedColorIndex

	^ selectedColorIndex
! !

!ListDemo methodsFor: 'accessing' stamp: 'rmv 4/1/2025 14:41:24'!
selectedColorIndex: anIndex
	| color colorName selected |
	
	selectedColorIndex := anIndex.

	selected := anIndex ~= 0.
	deleteButton enable: selected.
	colorName := selected ifTrue: [ colors at: anIndex ].
	
	selectedLabel contents: (colorName
		ifNil: ''
		ifNotNil: [ 'You selected {1}.' format: { colorName } ]
	).

	color := colorName
		ifNil: [ Color gray ]
		ifNotNil: [
			[ Color perform: colorName ]
				on: MessageNotUnderstood
				do: [ Color gray ]
		].
	window layoutMorph color: (color alpha: 0.6).! !

!ListDemo methodsFor: 'morphic' stamp: 'rmv 3/28/2025 16:27:48'!
textEntryOn: aSymbol
	"Answer a TextModelMorph where aSymbol provides the name for the getter and setter."
	| entry |
		
	entry := TextModelMorph
		textProvider: self
		textGetter: aSymbol 
		textSetter: (aSymbol, ':') asSymbol ::
		acceptOnCR: true;
		askBeforeDiscardingEdits: false;
		hideScrollBarsIndefinitely;
		"Width is made proportional below.
		Setting height to zero causes it to use minimum height for one line."
		morphExtent: 0 @ 0.
	entry layoutSpec proportionalWidth: 1.
	^ entry.
! !

!ListDemo methodsFor: 'initialization' stamp: 'rmv 4/1/2025 14:43:00'!
initialize
	| addButton layout row |
	
	colors := SortedCollection newFrom: #(red orange yellow green blue purple).
	selectedColorIndex := 0.
	colorList := PluggableListMorph
		withModel: self
		listGetter: #colors
		indexGetter: #selectedColorIndex
		indexSetter: #selectedColorIndex:.
	colorList layoutSpec proportionalWidth: 1.
	
	newColorEntry :=  self textEntryOn: #newColor.
	newColorEntry emptyTextDisplayMessage: 'new color'.
	
	addButton := PluggableButtonMorph model: self action: #addColor label: 'Add'.
	
	row := LayoutMorph newRow
		gap: 10;
		addMorph: newColorEntry;
		addMorph: addButton.

	deleteButton := PluggableButtonMorph
		model: self
		action: #deleteColor
		label: 'Delete Selected Color'.
		
	selectedLabel := LabelMorph contents: ''.
	
	window := SystemWindow new.
	window
		setLabel: 'List Demo';
		addMorph: colorList;
		addMorph: row;
		addMorph: deleteButton;
		addMorph: selectedLabel.

	"Set window size to the smallest height that contains its submorphs."
	layout := window layoutMorph.
	layout separation: 10.
	window
		morphExtent: 250 @ layout minimumExtent y;
		openInWorld.
	
	self selectedColorIndex: 0. "sets initial background color"! !

!MenuDemo methodsFor: 'as yet unclassified' stamp: 'rmv 4/1/2025 14:44:28'!
initialize
	| layout |
	
	colorButton := PluggableButtonMorph
		model: self
		action: #openMenu
		label: 'Select Color'.
	
	colors := #(red orange yellow green blue purple).
	colorMenu := SelectionMenu labels: colors lines: #().
		
	window := SystemWindow new.
	window setLabel: 'Menu Demo'; addMorph: colorButton.

	"Set window size to the smallest height that contains its submorphs."
	layout := window layoutMorph.
	layout separation: 10.
	window
		morphExtent: 300 @ layout minimumExtent y;
		openInWorld.
! !

!MenuDemo methodsFor: 'as yet unclassified' stamp: 'rmv 3/28/2025 10:18:58'!
openMenu
	| color colorName index |

	index := colorMenu startUpMenu.
	index = 0 ifFalse: [
		colorName := colors at: index.
		colorButton label: colorName.
		
		color := colorName
			ifNil: [ Color gray ]
			ifNotNil: [ [ Color perform: colorName ] on: MessageNotUnderstood do: [ Color gray ] ].
		window layoutMorph color: (color alpha: 0.6).
	].! !

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

!UserInteractionDemo methodsFor: 'initialization' stamp: 'rmv 4/1/2025 14:58:13'!
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
		addMorph: greetLabel.
			
	"Set window size to the smallest height that contains its submorphs.
	This must be done AFTER the window is opened."
	extent := window layoutMorph minimumExtent.
	window
		morphExtent: 400 @ extent y;
		openInWorld.
		
	"Set a background color so it's clear where the TextModelMorphs
	are placed when they do not have focus."
	"TODO: Why must this be changed AFTER openInWorld?"
	window layoutMorph color: (Color blue alpha: 0.1).! !
