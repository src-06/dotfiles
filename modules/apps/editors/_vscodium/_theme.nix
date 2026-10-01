{
  lib,
  linkFarm,
}: {
  base00,
  base01,
  base02,
  base03,
  base04,
  base05,
  base06,
  base07,
  base08,
  base09,
  base0A,
  base0B,
  base0C,
  base0D,
  base0E,
  base0F,
}: publisher: label: name: let
  inherit (builtins) toJSON toFile;
  version = "0.0.0";
  uniqueId = "${publisher}.${name}";
  dir = "share/vscode/extensions/${uniqueId}";
  themes = {
    "theme/base16.json" = toJSON {
      "$schema" = "vscode://schemas/color-theme";
      name = label;
      type = "dark";
      colors = {
        # Global foregrounds, selections, focus rings, and resize handles
        "descriptionForeground" = base04;
        "disabledForeground" = base04;
        "errorForeground" = base08;
        "focusBorder" = base0D;
        "foreground" = base05;
        "icon.foreground" = base04;
        "sash.hoverBorder" = base0D;
        "selection.background" = base02;
        "widget.shadow" = base00;

        # Text presentation outside the code editor
        "textBlockQuote.background" = base01;
        "textBlockQuote.border" = base0D;
        "textCodeBlock.background" = base00;
        "textLink.activeForeground" = base0C;
        "textLink.foreground" = base0D;
        "textPreformat.foreground" = base0D;
        "textSeparator.foreground" = base02;

        # Toolbars, buttons, and form controls
        "button.background" = base02;
        "button.foreground" = base07;
        "button.hoverBackground" = base03;
        "button.secondaryBackground" = base01;
        "button.secondaryForeground" = base07;
        "button.secondaryHoverBackground" = base02;
        "checkbox.background" = base01;
        "checkbox.border" = base03;
        "checkbox.foreground" = base05;
        "dropdown.background" = base01;
        "dropdown.border" = base02;
        "dropdown.foreground" = base05;
        "dropdown.listBackground" = base00;
        "input.background" = base01;
        "input.border" = base02;
        "input.foreground" = base05;
        "input.placeholderForeground" = base04;
        "inputOption.activeBackground" = base02;
        "inputOption.activeBorder" = base0D;
        "inputOption.activeForeground" = base05;
        "inputValidation.errorBackground" = base01;
        "inputValidation.errorBorder" = base08;
        "inputValidation.errorForeground" = base05;
        "inputValidation.infoBackground" = base01;
        "inputValidation.infoBorder" = base0D;
        "inputValidation.infoForeground" = base05;
        "inputValidation.warningBackground" = base01;
        "inputValidation.warningBorder" = base0A;
        "inputValidation.warningForeground" = base05;
        "toolbar.activeBackground" = base03;
        "toolbar.hoverBackground" = base02;

        # Scrollbars, badges, and progress indicators
        "badge.background" = base00;
        "badge.foreground" = base05;
        "progressBar.background" = base03;
        "scrollbar.shadow" = base01;
        "scrollbarSlider.activeBackground" = "${base04}6F";
        "scrollbarSlider.background" = "${base02}6F";
        "scrollbarSlider.hoverBackground" = "${base03}6F";

        # Lists, trees, and list filtering
        "list.activeSelectionBackground" = base01;
        "list.activeSelectionForeground" = base07;
        "list.dropBackground" = "${base0D}33";
        "list.errorForeground" = base08;
        "list.filterMatchBackground" = base02;
        "list.focusAndSelectionOutline" = base0D;
        "list.focusBackground" = base01;
        "list.focusForeground" = base05;
        "list.focusOutline" = base0D;
        "list.highlightForeground" = base07;
        "list.hoverBackground" = base01;
        "list.hoverForeground" = base05;
        "list.inactiveFocusBackground" = base02;
        "list.inactiveFocusOutline" = base0D;
        "list.inactiveSelectionBackground" = base01;
        "list.inactiveSelectionForeground" = base05;
        "list.invalidItemForeground" = base08;
        "list.warningForeground" = base0A;
        "listFilterWidget.background" = base00;
        "listFilterWidget.noMatchesOutline" = base08;
        "tree.inactiveIndentGuidesStroke" = base01;
        "tree.indentGuidesStroke" = base02;

        # Activity bar and activity badges
        "activityBar.activeBackground" = "${base0D}1F";
        "activityBar.activeBorder" = base0D;
        "activityBar.activeFocusBorder" = base0D;
        "activityBar.background" = base00;
        "activityBar.border" = base02;
        "activityBar.dropBackground" = base07;
        "activityBar.foreground" = base07;
        "activityBar.inactiveForeground" = base04;
        "activityBarBadge.background" = base02;
        "activityBarBadge.foreground" = base06;
        "activityBarTop.activeBorder" = base0D;

        # Primary and secondary side bars
        "sideBar.background" = base00;
        "sideBar.border" = base02;
        "sideBar.dropBackground" = "${base02}6F";
        "sideBar.foreground" = base05;
        "sideBarSectionHeader.background" = base00;
        "sideBarSectionHeader.border" = base02;
        "sideBarSectionHeader.foreground" = base05;
        "sideBarTitle.foreground" = base05;

        # Editor minimap and minimap gutter
        "minimap.background" = base00;
        "minimap.errorHighlight" = base08;
        "minimap.findMatchHighlight" = "${base0A}6F";
        "minimap.selectionHighlight" = "${base02}6F";
        "minimap.selectionOccurrenceHighlight" = base03;
        "minimap.warningHighlight" = base0A;
        "minimapGutter.addedBackground" = base0B;
        "minimapGutter.deletedBackground" = base08;
        "minimapGutter.modifiedBackground" = base0E;

        # Editor groups, panes, and tabs
        "editorGroup.background" = base00;
        "editorGroup.border" = base02;
        "editorGroup.dropBackground" = "${base02}6F";
        "editorGroup.dropIntoPromptBackground" = base00;
        "editorGroup.dropIntoPromptForeground" = base06;
        "editorGroup.emptyBackground" = base00;
        "editorGroup.focusedEmptyBorder" = base0D;
        "editorGroupHeader.noTabsBackground" = base01;
        "editorGroupHeader.tabsBackground" = base00;
        "editorGroupHeader.tabsBorder" = "${base00}00";
        "editorPane.background" = base00;
        "tab.activeBackground" = base01;
        "tab.activeBorder" = base0D;
        "tab.activeBorderTop" = "${base00}00";
        "tab.activeForeground" = base07;
        "tab.activeModifiedBorder" = base09;
        "tab.border" = "${base00}00";
        "tab.hoverBackground" = base01;
        "tab.inactiveBackground" = base00;
        "tab.inactiveForeground" = base04;
        "tab.inactiveModifiedBorder" = base03;
        "tab.unfocusedActiveBackground" = base00;
        "tab.unfocusedActiveBorder" = "${base0D}80";
        "tab.unfocusedActiveBorderTop" = "${base00}00";
        "tab.unfocusedActiveForeground" = base04;
        "tab.unfocusedActiveModifiedBorder" = base0D;
        "tab.unfocusedHoverBackground" = base02;
        "tab.unfocusedInactiveForeground" = base04;
        "tab.unfocusedInactiveModifiedBorder" = base0D;

        # Editor text, selections, guides, hints, and brackets
        "editor.background" = base00;
        "editor.findMatchBackground" = "${base0A}66";
        "editor.findMatchHighlightBackground" = "${base09}40";
        "editor.findRangeHighlightBackground" = "${base01}6F";
        "editor.foreground" = base05;
        "editor.hoverHighlightBackground" = "${base02}6F";
        "editor.inactiveSelectionBackground" = base01;
        "editor.lineHighlightBackground" = "${base01}80";
        "editor.rangeHighlightBackground" = "${base01}6F";
        "editor.selectionBackground" = base02;
        "editor.selectionHighlightBackground" = base01;
        "editor.snippetFinalTabstopHighlightBackground" = base03;
        "editor.snippetTabstopHighlightBackground" = base02;
        "editor.wordHighlightBackground" = "${base0C}1F";
        "editor.wordHighlightStrongBackground" = "${base0C}33";
        "editorBracketHighlight.foreground1" = base09;
        "editorBracketHighlight.foreground2" = base0E;
        "editorBracketHighlight.foreground3" = base0C;
        "editorBracketHighlight.foreground4" = base0B;
        "editorBracketHighlight.foreground5" = base0A;
        "editorBracketHighlight.foreground6" = base0D;
        "editorBracketHighlight.unexpectedBracket.foreground" = base08;
        "editorBracketMatch.background" = "${base0D}26";
        "editorBracketMatch.border" = base0D;
        "editorCodeLens.foreground" = base03;
        "editorCursor.foreground" = base05;
        "editorIndentGuide.activeBackground" = base04;
        "editorIndentGuide.activeBackground1" = base03;
        "editorIndentGuide.background" = base03;
        "editorIndentGuide.background1" = base02;
        "editorInlayHint.background" = "${base00}00";
        "editorInlayHint.foreground" = base03;
        "editorInlayHint.parameterBackground" = "${base00}00";
        "editorInlayHint.parameterForeground" = base03;
        "editorInlayHint.typeBackground" = "${base00}00";
        "editorInlayHint.typeForeground" = base03;
        "editorLightBulb.foreground" = base0A;
        "editorLightBulbAutoFix.foreground" = base0D;
        "editorLineNumber.activeForeground" = base04;
        "editorLineNumber.foreground" = base03;
        "editorLink.activeForeground" = base0D;
        "editorRuler.foreground" = base01;
        "editorWhitespace.foreground" = base02;
        "searchEditor.findMatchBackground" = "${base0A}6F";

        # Editor diagnostics, overview ruler, and gutter indicators
        "editorError.foreground" = base08;
        "editorGutter.addedBackground" = base0B;
        "editorGutter.background" = base00;
        "editorGutter.commentRangeForeground" = base04;
        "editorGutter.deletedBackground" = base08;
        "editorGutter.foldingControlForeground" = base05;
        "editorGutter.modifiedBackground" = base0E;
        "editorHint.foreground" = base0D;
        "editorInfo.foreground" = base0C;
        "editorOverviewRuler.addedForeground" = base0B;
        "editorOverviewRuler.bracketMatchForeground" = base06;
        "editorOverviewRuler.deletedForeground" = base08;
        "editorOverviewRuler.errorForeground" = base08;
        "editorOverviewRuler.findMatchForeground" = "${base0A}6F";
        "editorOverviewRuler.infoForeground" = base0C;
        "editorOverviewRuler.modifiedForeground" = base0E;
        "editorOverviewRuler.rangeHighlightForeground" = "${base03}6F";
        "editorOverviewRuler.selectionHighlightForeground" = "${base02}6F";
        "editorOverviewRuler.warningForeground" = base0A;
        "editorOverviewRuler.wordHighlightForeground" = "${base07}6F";
        "editorOverviewRuler.wordHighlightStrongForeground" = "${base0D}6F";
        "editorWarning.foreground" = base0A;
        "problemsErrorIcon.foreground" = base08;
        "problemsInfoIcon.foreground" = base0C;
        "problemsWarningIcon.foreground" = base0A;

        # Diff and merge editors
        "diffEditor.diagonalFill" = base02;
        "diffEditor.insertedLineBackground" = "${base0B}18";
        "diffEditor.insertedTextBackground" = "${base0B}20";
        "diffEditor.removedLineBackground" = "${base08}22";
        "diffEditor.removedTextBackground" = "${base08}2c";
        "diffEditorGutter.insertedLineBackground" = "${base0B}40";
        "diffEditorGutter.removedLineBackground" = "${base08}56";
        "editorOverviewRuler.commonContentForeground" = base0F;
        "editorOverviewRuler.currentContentForeground" = base0D;
        "editorOverviewRuler.incomingContentForeground" = base0B;
        "merge.currentContentBackground" = "${base0D}40";
        "merge.currentHeaderBackground" = "${base0D}40";
        "merge.incomingContentBackground" = "${base0B}60";
        "merge.incomingHeaderBackground" = "${base0B}60";

        # Editor widgets, suggestions, navigation, and peek views
        "debugExceptionWidget.background" = base01;
        "editorHoverWidget.background" = base00;
        "editorHoverWidget.border" = base02;
        "editorHoverWidget.foreground" = base05;
        "editorMarkerNavigation.background" = base01;
        "editorMarkerNavigationError.background" = base08;
        "editorMarkerNavigationError.headerBackground" = "${base08}20";
        "editorMarkerNavigationInfo.background" = base0D;
        "editorMarkerNavigationInfo.headerBackground" = "${base0C}20";
        "editorMarkerNavigationWarning.background" = base0A;
        "editorMarkerNavigationWarning.headerBackground" = "${base0A}20";
        "editorSuggestWidget.background" = base01;
        "editorSuggestWidget.border" = base02;
        "editorSuggestWidget.focusHighlightForeground" = base07;
        "editorSuggestWidget.foreground" = base05;
        "editorSuggestWidget.highlightForeground" = base0D;
        "editorSuggestWidget.selectedBackground" = base02;
        "editorSuggestWidget.selectedForeground" = base06;
        "editorWidget.background" = base00;
        "editorWidget.border" = base02;
        "editorWidget.foreground" = base05;
        "peekViewEditor.background" = base01;
        "peekViewEditor.matchHighlightBackground" = "${base09}6F";
        "peekViewEditorGutter.background" = base01;
        "peekViewResult.background" = base00;
        "peekViewResult.fileForeground" = base05;
        "peekViewResult.lineForeground" = base03;
        "peekViewResult.matchHighlightBackground" = "${base09}6F";
        "peekViewResult.selectionBackground" = base02;
        "peekViewResult.selectionForeground" = base05;
        "peekViewTitle.background" = base02;
        "peekViewTitleDescription.foreground" = base03;
        "peekViewTitleLabel.foreground" = base05;

        # Panels and panel headings
        "panel.background" = base00;
        "panel.dropBackground" = "${base01}6F";
        "panel.dropBorder" = "${base01}6F";
        "panelTitle.activeForeground" = base05;
        "panelTitle.inactiveForeground" = base04;

        # Status bar and status bar items
        "statusBar.background" = base00;
        "statusBar.border" = base01;
        "statusBar.debuggingBackground" = base09;
        "statusBar.debuggingForeground" = base00;
        "statusBar.focusBorder" = base0D;
        "statusBar.foreground" = base05;
        "statusBar.noFolderBackground" = base00;
        "statusBar.noFolderForeground" = base05;
        "statusBarItem.activeBackground" = base02;
        "statusBarItem.errorBackground" = base08;
        "statusBarItem.errorForeground" = base07;
        "statusBarItem.focusBorder" = base0D;
        "statusBarItem.hoverBackground" = base01;
        "statusBarItem.prominentBackground" = base00;
        "statusBarItem.prominentForeground" = base06;
        "statusBarItem.prominentHoverBackground" = base01;
        "statusBarItem.remoteBackground" = base00;
        "statusBarItem.remoteForeground" = base05;
        "statusBarItem.warningBackground" = base0A;
        "statusBarItem.warningForeground" = base00;

        # Title bar, menus, and command center
        "commandCenter.activeBackground" = base01;
        "commandCenter.activeBorder" = base0D;
        "commandCenter.activeForeground" = base07;
        "commandCenter.background" = base00;
        "commandCenter.border" = base02;
        "commandCenter.foreground" = base05;
        "menu.background" = base01;
        "menu.border" = base02;
        "menu.foreground" = base05;
        "menu.selectionBackground" = base02;
        "menu.selectionBorder" = base0D;
        "menu.selectionForeground" = base05;
        "menu.separatorBackground" = base02;
        "menubar.selectionBackground" = base01;
        "menubar.selectionBorder" = base0D;
        "menubar.selectionForeground" = base05;
        "titleBar.activeBackground" = base00;
        "titleBar.activeForeground" = base05;
        "titleBar.inactiveBackground" = base01;
        "titleBar.inactiveForeground" = base03;

        # Notifications, notification center, and banners
        "banner.background" = base02;
        "banner.foreground" = base05;
        "banner.iconForeground" = base0D;
        "notification.background" = base02;
        "notification.buttonBackground" = base0D;
        "notification.buttonForeground" = base07;
        "notification.buttonHoverBackground" = base02;
        "notification.errorBackground" = base08;
        "notification.errorForeground" = base07;
        "notification.foreground" = base05;
        "notification.infoBackground" = base0C;
        "notification.infoForeground" = base07;
        "notification.warningBackground" = base0A;
        "notification.warningForeground" = base07;
        "notificationCenter.border" = base02;
        "notificationCenterHeader.background" = base01;
        "notificationCenterHeader.foreground" = base05;
        "notificationLink.foreground" = base0D;
        "notificationToast.border" = base02;
        "notifications.background" = base02;
        "notifications.border" = base02;
        "notifications.foreground" = base05;
        "notificationsErrorIcon.foreground" = base08;
        "notificationsInfoIcon.foreground" = base0D;
        "notificationsWarningIcon.foreground" = base0A;

        # Extensions view buttons, badges, and icons
        "extensionBadge.remoteBackground" = base09;
        "extensionBadge.remoteForeground" = base07;
        "extensionButton.prominentBackground" = base0B;
        "extensionButton.prominentForeground" = base03;
        "extensionButton.prominentHoverBackground" = base09;
        "extensionIcon.preReleaseForeground" = base09;
        "extensionIcon.starForeground" = base0A;
        "extensionIcon.verifiedForeground" = base0D;

        # Quick input, pickers, and keybinding labels
        "keybindingLabel.background" = base02;
        "keybindingLabel.foreground" = base05;
        "keybindingTable.headerBackground" = base02;
        "keybindingTable.rowsBackground" = base01;
        "pickerGroup.border" = base02;
        "pickerGroup.foreground" = base04;
        "quickInput.background" = base01;
        "quickInput.foreground" = base05;
        "quickInputList.focusBackground" = base02;
        "quickInputList.focusForeground" = base07;
        "quickInputList.focusIconForeground" = base07;

        # Integrated terminal and terminal command decorations
        "terminal.ansiBlack" = base00;
        "terminal.ansiBlue" = base0D;
        "terminal.ansiBrightBlack" = base03;
        "terminal.ansiBrightBlue" = base0D;
        "terminal.ansiBrightCyan" = base0C;
        "terminal.ansiBrightGreen" = base0B;
        "terminal.ansiBrightMagenta" = base0E;
        "terminal.ansiBrightRed" = base08;
        "terminal.ansiBrightWhite" = base07;
        "terminal.ansiBrightYellow" = base0A;
        "terminal.ansiCyan" = base0C;
        "terminal.ansiGreen" = base0B;
        "terminal.ansiMagenta" = base0E;
        "terminal.ansiRed" = base08;
        "terminal.ansiWhite" = base05;
        "terminal.ansiYellow" = base0A;
        "terminal.background" = base00;
        "terminal.foreground" = base05;
        "terminal.tab.activeBorder" = base0D;
        "terminalCommandDecoration.defaultBackground" = base03;
        "terminalCommandDecoration.errorBackground" = base08;
        "terminalCommandDecoration.successBackground" = base0B;
        "terminalCursor.foreground" = base05;
        "terminalOverviewRuler.cursorForeground" = base05;
        "terminalOverviewRuler.findMatchForeground" = base0A;

        # Debugger controls, expressions, icons, and console
        "debugConsole.errorForeground" = base08;
        "debugConsole.infoForeground" = base05;
        "debugConsole.sourceForeground" = base05;
        "debugConsole.warningForeground" = base0A;
        "debugConsoleInputIcon.foreground" = base05;
        "debugIcon.breakpointCurrentStackframeForeground" = base0A;
        "debugIcon.breakpointDisabledForeground" = base04;
        "debugIcon.breakpointForeground" = base08;
        "debugIcon.breakpointStackframeForeground" = base0F;
        "debugIcon.breakpointUnverifiedForeground" = base02;
        "debugIcon.continueForeground" = base0B;
        "debugIcon.disconnectForeground" = base08;
        "debugIcon.pauseForeground" = base0D;
        "debugIcon.restartForeground" = base0B;
        "debugIcon.startForeground" = base0B;
        "debugIcon.stepBackForeground" = base0F;
        "debugIcon.stepIntoForeground" = base0C;
        "debugIcon.stepOutForeground" = base0E;
        "debugIcon.stepOverForeground" = base0D;
        "debugIcon.stopForeground" = base08;
        "debugTokenExpression.boolean" = base09;
        "debugTokenExpression.error" = base08;
        "debugTokenExpression.name" = base0E;
        "debugTokenExpression.number" = base09;
        "debugTokenExpression.string" = base0B;
        "debugTokenExpression.value" = base05;
        "debugToolBar.background" = base01;
        "debugView.stateLabelBackground" = base0D;
        "debugView.stateLabelForeground" = base07;
        "debugView.valueChangedHighlight" = base0D;

        # Test explorer states and messages
        "testing.iconErrored" = base0F;
        "testing.iconFailed" = base08;
        "testing.iconPassed" = base0B;
        "testing.iconQueued" = base0A;
        "testing.iconSkipped" = base0E;
        "testing.iconUnset" = base04;
        "testing.message.error.decorationForeground" = base05;
        "testing.message.error.lineBackground" = "${base08}20";
        "testing.message.info.decorationForeground" = base05;
        "testing.message.info.lineBackground" = "${base0D}20";
        "testing.peekHeaderBackground" = base01;
        "testing.runAction" = base04;

        # Welcome page and walkthroughs
        "walkThrough.embeddedEditorBackground" = base00;
        "walkthrough.stepTitle.foreground" = base05;
        "welcomePage.background" = base00;
        "welcomePage.buttonBackground" = base01;
        "welcomePage.buttonHoverBackground" = base02;
        "welcomePage.progress.background" = base03;
        "welcomePage.progress.foreground" = base0D;
        "welcomePage.tileBackground" = base01;
        "welcomePage.tileBorder" = base03;
        "welcomePage.tileHoverBackground" = base02;

        # Source control resource decorations
        "gitDecoration.addedResourceForeground" = base0B;
        "gitDecoration.conflictingResourceForeground" = base0A;
        "gitDecoration.deletedResourceForeground" = base08;
        "gitDecoration.ignoredResourceForeground" = base03;
        "gitDecoration.modifiedResourceForeground" = base0E;
        "gitDecoration.renamedResourceForeground" = base0C;
        "gitDecoration.stageDeletedResourceForeground" = base08;
        "gitDecoration.stageModifiedResourceForeground" = base0E;
        "gitDecoration.submoduleResourceForeground" = base0F;
        "gitDecoration.untrackedResourceForeground" = base09;

        # Settings editor and breadcrumbs
        "breadcrumb.activeSelectionForeground" = base07;
        "breadcrumb.background" = base01;
        "breadcrumb.focusForeground" = base06;
        "breadcrumb.foreground" = base05;
        "breadcrumbPicker.background" = base01;
        "settings.checkboxBackground" = base01;
        "settings.checkboxForeground" = base05;
        "settings.dropdownBackground" = base01;
        "settings.dropdownForeground" = base05;
        "settings.focusedRowBackground" = base02;
        "settings.focusedRowBorder" = base0D;
        "settings.headerBorder" = base02;
        "settings.headerForeground" = base05;
        "settings.modifiedItemForeground" = base0B;
        "settings.modifiedItemIndicator" = base0D;
        "settings.numberInputBackground" = base01;
        "settings.numberInputForeground" = base05;
        "settings.rowHoverBackground" = base02;
        "settings.sashBorder" = base02;
        "settings.textInputBackground" = base01;
        "settings.textInputForeground" = base05;

        # Symbol icons shown in outlines and suggestions
        "symbolIcon.arrayForeground" = base05;
        "symbolIcon.booleanForeground" = base09;
        "symbolIcon.classForeground" = base0A;
        "symbolIcon.colorForeground" = base0C;
        "symbolIcon.constantForeground" = base09;
        "symbolIcon.constructorForeground" = base0D;
        "symbolIcon.enumeratorForeground" = base09;
        "symbolIcon.enumeratorMemberForeground" = base0D;
        "symbolIcon.eventForeground" = base0A;
        "symbolIcon.fieldForeground" = base05;
        "symbolIcon.fileForeground" = base05;
        "symbolIcon.folderForeground" = base05;
        "symbolIcon.functionForeground" = base0D;
        "symbolIcon.interfaceForeground" = base0D;
        "symbolIcon.keyForeground" = base04;
        "symbolIcon.keywordForeground" = base0E;
        "symbolIcon.methodForeground" = base0D;
        "symbolIcon.moduleForeground" = base05;
        "symbolIcon.namespaceForeground" = base05;
        "symbolIcon.nullForeground" = base0F;
        "symbolIcon.numberForeground" = base09;
        "symbolIcon.objectForeground" = base04;
        "symbolIcon.operatorForeground" = base04;
        "symbolIcon.packageForeground" = base04;
        "symbolIcon.propertyForeground" = base05;
        "symbolIcon.referenceForeground" = base04;
        "symbolIcon.snippetForeground" = base05;
        "symbolIcon.stringForeground" = base0B;
        "symbolIcon.structForeground" = base0A;
        "symbolIcon.textForeground" = base05;
        "symbolIcon.typeParameterForeground" = base0A;
        "symbolIcon.unitForeground" = base09;
        "symbolIcon.variableForeground" = base05;

        # Notebook cells, editors, and status icons
        "notebook.cellBorderColor" = base03;
        "notebook.cellEditorBackground" = base00;
        "notebook.cellHoverBackground" = base01;
        "notebook.cellToolbarSeparator" = base02;
        "notebook.editorBackground" = base00;
        "notebook.focusedCellBackground" = base02;
        "notebook.focusedCellBorder" = base0D;
        "notebook.focusedEditorBorder" = base0D;
        "notebook.inactiveFocusedCellBorder" = base03;
        "notebook.selectedCellBackground" = base02;
        "notebookStatusErrorIcon.foreground" = base08;
        "notebookStatusRunningIcon.foreground" = base0C;
        "notebookStatusSuccessIcon.foreground" = base0B;

        # Charts and forwarded ports
        "charts.blue" = base0D;
        "charts.foreground" = base05;
        "charts.green" = base0B;
        "charts.lines" = base05;
        "charts.orange" = base09;
        "charts.purple" = base0E;
        "charts.red" = base08;
        "charts.yellow" = base0A;
        "ports.iconRunningProcessForeground" = base09;

        # Error Lens diagnostics and status indicators
        "errorLens.errorBackground" = "${base08}20";
        "errorLens.errorBackgroundLight" = "${base08}20";
        "errorLens.errorForeground" = base08;
        "errorLens.errorForegroundLight" = base08;
        "errorLens.errorMessageBackground" = "${base08}19";
        "errorLens.errorRangeBackground" = "${base08}19";
        "errorLens.hintBackground" = "${base0D}20";
        "errorLens.hintBackgroundLight" = "${base0D}20";
        "errorLens.hintForeground" = base0D;
        "errorLens.hintForegroundLight" = base0D;
        "errorLens.hintMessageBackground" = "${base0D}19";
        "errorLens.hintRangeBackground" = "${base0D}19";
        "errorLens.infoBackground" = "${base0C}20";
        "errorLens.infoBackgroundLight" = "${base0C}20";
        "errorLens.infoForeground" = base0C;
        "errorLens.infoForegroundLight" = base0C;
        "errorLens.infoMessageBackground" = "${base0C}19";
        "errorLens.infoRangeBackground" = "${base0C}19";
        "errorLens.statusBarErrorForeground" = base08;
        "errorLens.statusBarHintForeground" = base0D;
        "errorLens.statusBarIconErrorForeground" = base08;
        "errorLens.statusBarIconWarningForeground" = base0A;
        "errorLens.statusBarInfoForeground" = base0C;
        "errorLens.statusBarWarningForeground" = base0A;
        "errorLens.warningBackground" = "${base0A}20";
        "errorLens.warningBackgroundLight" = "${base0A}20";
        "errorLens.warningForeground" = base0A;
        "errorLens.warningForegroundLight" = base0A;
        "errorLens.warningMessageBackground" = "${base0A}19";
        "errorLens.warningRangeBackground" = "${base0A}19";

        # SQLTools current-query decoration
        "sqltools.currentQueryBg" = "${base0D}1F";
        "sqltools.currentQueryOutline" = "${base0D}40";
      };

      # TextMate scopes control language syntax highlighting
      tokenColors = [
        {
          name = "Comment";
          scope = [
            "comment"
            "punctuation.definition.comment"
          ];
          settings = {
            fontStyle = "italic";
            foreground = base04;
          };
        }
        {
          name = "Variables, Parameters";
          scope = [
            "variable"
            "string constant.other.placeholder"
            "entity.name.variable.parameter"
            "entity.name.variable.local"
            "variable.parameter"
          ];
          settings.foreground = base08;
        }
        {
          name = "Properties";
          scope = ["variable.other.object.property"];
          settings.foreground = base0D;
        }
        {
          name = "Colors";
          scope = ["constant.other.color"];
          settings.foreground = base0B;
        }
        {
          name = "Invalid";
          scope = [
            "invalid"
            "invalid.illegal"
          ];
          settings.foreground = base08;
        }
        {
          name = "Invalid - Deprecated";
          scope = ["invalid.deprecated"];
          settings.foreground = base0F;
        }
        {
          name = "Keyword, Storage";
          scope = [
            "keyword"
            "storage.modifier"
          ];
          settings.foreground = base0E;
        }
        {
          name = "Keyword Control";
          scope = [
            "keyword.control"
            "keyword.control.flow"
            "keyword.control.from"
            "keyword.control.import"
            "keyword.control.as"
          ];
          settings.foreground = base0E;
        }
        {
          name = "Keyword";
          scope = [
            "keyword.other.using"
            "keyword.other.namespace"
            "keyword.other.class"
            "keyword.other.new"
            "keyword.other.event"
            "keyword.other.this"
            "keyword.other.await"
            "keyword.other.var"
            "keyword.other.package"
            "keyword.other.import"
            "variable.language.this"
            "storage.type.ts"
          ];
          settings.foreground = base0E;
        }
        {
          name = "Types, Primitives";
          scope = [
            "keyword.type"
            "storage.type.primitive"
          ];
          settings.foreground = base0C;
        }
        {
          name = "Function";
          scope = ["storage.type.function"];
          settings.foreground = base0D;
        }
        {
          name = "Operator, Misc";
          scope = [
            "constant.other.color"
            "punctuation"
            "punctuation.section.class.end"
            "meta.tag"
            "punctuation.definition.tag"
            "punctuation.separator.inheritance.php"
            "punctuation.definition.tag.html"
            "punctuation.definition.tag.begin.html"
            "punctuation.definition.tag.end.html"
            "keyword.other.template"
            "keyword.other.substitution"
          ];
          settings.foreground = base05;
        }
        {
          name = "Embedded";
          scope = [
            "punctuation.section.embedded"
            "variable.interpolation"
          ];
          settings.foreground = base0F;
        }
        {
          name = "Tag";
          scope = [
            "entity.name.tag"
            "meta.tag.sgml"
            "markup.deleted.git_gutter"
          ];
          settings.foreground = base08;
        }
        {
          name = "Function, Special Method";
          scope = [
            "entity.name.function"
            "meta.function-call"
            "variable.function"
            "support.function"
            "keyword.other.special-method"
          ];
          settings.foreground = base0D;
        }
        {
          name = "Block Level Variables";
          scope = ["meta.block variable.other"];
          settings.foreground = base08;
        }
        {
          name = "Other Variable, String Link";
          scope = [
            "support.other.variable"
            "string.other.link"
          ];
          settings.foreground = base08;
        }
        {
          name = "Number, Constant, Function Argument, Tag Attribute, Embedded";
          scope = [
            "constant.numeric"
            "constant.language"
            "support.constant"
            "constant.character"
            "constant.escape"
            "keyword.other.unit"
            "keyword.other"
          ];
          settings.foreground = base09;
        }
        {
          name = "String, Symbols, Inherited Class, Markup Heading";
          scope = [
            "string"
            "constant.other.symbol"
            "constant.other.key"
            "entity.other.inherited-class"
            "markup.heading"
            "markup.inserted.git_gutter"
            "meta.group.braces.curly constant.other.object.key.js string.unquoted.label.js"
          ];
          settings = {
            fontStyle = "";
            foreground = base0B;
          };
        }
        {
          name = "Class, Support";
          scope = [
            "entity.name"
            "support.type"
            "support.class"
            "support.other.namespace.use.php"
            "meta.use.php"
            "support.other.namespace.php"
            "markup.changed.git_gutter"
            "support.type.sys-types"
          ];
          settings.foreground = base0A;
        }
        {
          name = "Storage Type, Import Class";
          scope = [
            "storage.type"
            "storage.modifier.package"
            "storage.modifier.import"
          ];
          settings.foreground = base0A;
        }
        {
          name = "Fields";
          scope = ["entity.name.variable.field"];
          settings.foreground = base0D;
        }
        {
          name = "Entity Types";
          scope = ["support.type"];
          settings.foreground = base0C;
        }
        {
          name = "CSS Class and Support";
          scope = [
            "source.css support.type.property-name"
            "source.sass support.type.property-name"
            "source.scss support.type.property-name"
            "source.less support.type.property-name"
            "source.stylus support.type.property-name"
            "source.postcss support.type.property-name"
          ];
          settings.foreground = base0C;
        }
        {
          name = "Sub-methods";
          scope = [
            "entity.name.module.js"
            "variable.import.parameter.js"
            "variable.other.class.js"
          ];
          settings.foreground = base08;
        }
        {
          name = "Language methods";
          scope = ["variable.language"];
          settings = {
            "fontStyle" = "italic";
            "foreground" = base08;
          };
        }
        {
          name = "entity.name.method.js";
          scope = ["entity.name.method.js"];
          settings = {
            fontStyle = "italic";
            foreground = base0D;
          };
        }
        {
          name = "meta.method.js";
          scope = [
            "meta.class-method.js entity.name.function.js"
            "variable.function.constructor"
          ];
          settings.foreground = base0D;
        }
        {
          name = "Attributes";
          scope = ["entity.other.attribute-name"];
          settings.foreground = base0D;
        }
        {
          name = "HTML Attributes";
          scope = [
            "text.html.basic entity.other.attribute-name.html"
            "text.html.basic entity.other.attribute-name"
          ];
          settings = {
            fontStyle = "italic";
            foreground = base0A;
          };
        }
        {
          name = "CSS Classes";
          scope = ["entity.other.attribute-name.class"];
          settings."foreground" = base0A;
        }
        {
          name = "CSS ID's";
          scope = ["source.sass keyword.control"];
          settings.foreground = base0D;
        }
        {
          name = "Inserted";
          scope = ["markup.inserted"];
          settings.foreground = base0B;
        }
        {
          name = "Deleted";
          scope = ["markup.deleted"];
          settings.foreground = base08;
        }
        {
          name = "Changed";
          scope = ["markup.changed"];
          settings.foreground = base0E;
        }
        {
          name = "Regular Expressions";
          scope = ["string.regexp"];
          settings.foreground = base0C;
        }
        {
          name = "Escape Characters";
          scope = ["constant.character.escape"];
          settings.foreground = base0C;
        }
        {
          name = "URL";
          scope = [
            "*url*"
            "*link*"
            "*uri*"
          ];
          settings.fontStyle = "underline";
        }
        {
          name = "Decorators";
          scope = [
            "tag.decorator.js entity.name.tag.js"
            "tag.decorator.js punctuation.definition.tag.js"
          ];
          settings = {
            fontStyle = "italic";
            foreground = base0D;
          };
        }
        {
          name = "ES7 Bind Operator";
          scope = ["source.js constant.other.object.key.js string.unquoted.label.js"];
          settings = {
            fontStyle = "italic";
            foreground = base0E;
          };
        }
        {
          name = "JSON Key - Level 0";
          scope = ["source.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 1";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 2";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 3";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 4";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 5";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 6";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 7";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "JSON Key - Level 8";
          scope = ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"];
          settings.foreground = base0D;
        }
        {
          name = "Markdown - Plain";
          scope = [
            "text.html.markdown"
            "punctuation.definition.list_item.markdown"
          ];
          settings.foreground = base05;
        }
        {
          name = "Markdown - Markup Raw Inline";
          scope = ["text.html.markdown markup.inline.raw.markdown"];
          settings.foreground = base0E;
        }
        {
          name = "Markdown - Markup Raw Inline Punctuation";
          scope = ["text.html.markdown markup.inline.raw.markdown punctuation.definition.raw.markdown"];
          settings.foreground = base0C;
        }
        {
          name = "Markdown - Line Break";
          scope = ["text.html.markdown meta.dummy.line-break"];
          settings.foreground = base03;
        }
        {
          name = "Markdown - Heading";
          scope = [
            "markdown.heading"
            "markup.heading | markup.heading entity.name"
            "markup.heading.markdown punctuation.definition.heading.markdown"
          ];
          settings.foreground = base0D;
        }
        {
          name = "Markup - Italic";
          scope = ["markup.italic"];
          settings = {
            fontStyle = "italic";
            foreground = base08;
          };
        }
        {
          name = "Markup - Bold";
          scope = [
            "markup.bold"
            "markup.bold string"
          ];
          settings = {
            fontStyle = "bold";
            foreground = base08;
          };
        }
        {
          name = "Markup - Bold-Italic";
          scope = [
            "markup.bold markup.italic"
            "markup.italic markup.bold"
            "markup.quote markup.bold"
            "markup.bold markup.italic string"
            "markup.italic markup.bold string"
            "markup.quote markup.bold string"
          ];
          settings = {
            fontStyle = "bold";
            foreground = base08;
          };
        }
        {
          name = "Markup - Underline";
          scope = ["markup.underline"];
          settings = {
            fontStyle = "underline";
            foreground = base09;
          };
        }
        {
          name = "Markdown - Blockquote";
          scope = ["markup.quote punctuation.definition.blockquote.markdown"];
          settings.foreground = base0C;
        }
        {
          name = "Markup - Quote";
          scope = ["markup.quote"];
          settings.fontStyle = "italic";
        }
        {
          name = "Markdown - Link";
          scope = ["string.other.link.title.markdown"];
          settings.foreground = base0D;
        }
        {
          name = "Markdown - Link Description";
          scope = ["string.other.link.description.title.markdown"];
          settings.foreground = base0E;
        }
        {
          name = "Markdown - Link Anchor";
          scope = ["constant.other.reference.link.markdown"];
          settings.foreground = base0A;
        }
        {
          name = "Markup - Raw Block";
          scope = ["markup.raw.block"];
          settings.foreground = base0E;
        }
        {
          name = "Markdown - Raw Block Fenced";
          scope = ["markup.raw.block.fenced.markdown"];
          settings.foreground = "${base00}50";
        }
        {
          name = "Markdown - Fenced Bode Block";
          scope = ["punctuation.definition.fenced.markdown"];
          settings.foreground = "${base00}50";
        }
        {
          name = "Markdown - Fenced Code Block Variable";
          scope = [
            "markup.raw.block.fenced.markdown"
            "variable.language.fenced.markdown"
          ];
          settings.foreground = base0E;
        }
        {
          name = "Markdown - Fenced Language";
          scope = ["variable.language.fenced.markdown"];
          settings.foreground = base08;
        }
        {
          name = "Markdown - Separator";
          scope = ["meta.separator"];
          settings = {
            fontStyle = "bold";
            foreground = base0C;
          };
        }
        {
          name = "Markup - Table";
          scope = ["markup.table"];
          settings.foreground = base0E;
        }
        {
          scope = "token.info-token";
          settings.foreground = base0D;
        }
        {
          scope = "token.warn-token";
          settings.foreground = base0A;
        }
        {
          scope = "token.error-token";
          settings.foreground = base08;
        }
        {
          scope = "token.debug-token";
          settings.foreground = base0E;
        }
      ];
    };
    "package.json" = toJSON {
      inherit name publisher version;
      displayName = label;
      engines.vscode = "^1.22.0";
      contributes.themes = [
        {
          inherit label;
          uiTheme = "vs-dark";
          path = "./theme/base16.json";
        }
      ];
      capabilities = {
        untrustedWorkspaces.supported = true;
        virtualWorkspaces = true;
      };
    };
  };
in
  linkFarm "${uniqueId}" (
    lib.mapAttrs' (file: json: {
      name = "${dir}/${file}";
      value = toFile (baseNameOf file) json;
    })
    themes
  )
  // {
    inherit version;
    vscodeExtPublisher = publisher;
    vscodeExtName = name;
    vscodeExtUniqueId = "${uniqueId}";
  }
