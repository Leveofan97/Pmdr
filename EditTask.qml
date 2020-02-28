import controls.Edit;
import "KeyboardModel.qml";
import "KeyItem.qml";

Item {
		id: ePlayerNamePanelItem;

		anchors.horizontalCenter: mainView.horizontalCenter;
		anchors.verticalCenter: mainView.verticalCenter;

		focus: true;
		property alias hint: edit.hint;
		height: 220;
		width: 400;
		property variant keysModel;
		property bool isUpper;

		signal accepted(text);

		Rectangle {
			anchors.fill: test;
			opacity: 0.2;
			color: "#000";
		}

		Rectangle {
			anchors.fill: parent;
			color: "#000";
			radius: 8;
			borderWidth: 2;
			borderColor: "#555";
			opacity: 0.7;
		}

		Edit {
			id: edit;
			height: 30;
			anchors.top: parent.top;
			anchors.left: parent.left;
			anchors.right: backSpace.left;
			anchors.margins: 10;
			focus: true;
			property alias hint: edit.hint;
			height: 300;
			width: 400;
			property variant keysModel;
			property bool isUpper;

			signal accepted(text);

			/*Rectangle {
				anchors.fill: test;
				opacity: 1;
				color: "#fff";
			}*/

//		Рамка фона окна редактирования
			Rectangle {
				anchors.fill: parent;
				color: "#000";
				radius: 8;
				borderWidth: 2;
				borderColor: "#555";
				opacity: 0.7;
			}

			Edit {
				id: subedit;
				height: 30;
				radius: 5;
				anchors.top: parent.top;
				anchors.left: parent.left;
				anchors.right: backSpace.left;
				anchors.margins: 5;
				focus: true;

				onRightPressed: {
					backSpaceSub.setFocus();
				}

				onDownPressed: {
					edit.setFocus();
				}

				onSelectPressed: {
					ePlayerNamePanelItem.accepted(edit.text);
				}
			}
			KeyItem {
				id: backSpaceSub;
				height: 30;
				anchors.top: subedit.top;
				anchors.bottom: subedit.bottom;
				anchors.right: parent.right;
				anchors.rightMargin: 5;
				text: "<-";
				width: keyView.cellHeight * 2;
				radius: 5;
				borderColor: activeFocus ? colorTheme.activeBorderColor : "#EA2022";

				onLeftPressed: {
					subedit.setFocus();
				}

				onSelectPressed: {
					subedit.removeChar();
				}

				onDownPressed: {
					backSpace.setFocus();
				}
			}
			Edit {
				id: edit;
				height: 80;
				radius: 5;
				anchors.top: subedit.bottom;
				anchors.left: parent.left;
				anchors.right: backSpace.left;
				anchors.margins: 5;
				focus: true;

				wrapMode: WordWrap;

				onRightPressed: {
					backSpace.setFocus();
				}

				onDownPressed: {
					keyView.setFocus();
				}
				onUpPressed: {
					subedit.setFocus();
				}
				onSelectPressed: {
					ePlayerNamePanelItem.accepted(edit.text);
				}
			}

			KeyItem {
				id: backSpace;
				height: 30;
				anchors.top: edit.top;
				anchors.bottom: edit.bottom;
				anchors.right: parent.right;
				anchors.rightMargin: 5;
				text: "<-";
				width: keyView.cellHeight * 2;
				radius: 5;
				borderColor: activeFocus ? colorTheme.activeBorderColor : "#EA2022";

				onLeftPressed: {
					edit.setFocus();
				}
				onUpPressed: {
					backSpaceSub.setFocus();
				}
				onSelectPressed: {
					edit.removeChar();
				}

				onDownPressed: {
					keyView.setFocus();
				}
			}
	/*______________________КЛАВИАТУРА____________________________*/
			GridView {
				id: keyView;
				anchors.top: edit.bottom;
				anchors.left: parent.left;
				anchors.right: parent.right;
				anchors.rightMargin: 5;
				anchors.leftMargin: 10;
				anchors.topMargin: 10;
				height: cellHeight * 4;
				cellWidth: width / 12;
				cellHeight: cellWidth;
				clip: true;
				keyNavigationWraps: true;
				model: ListModel { }
				delegate: KeyItem {
					text: model.text;
					focus: true;
				}

				onSelectPressed: {
					edit.text += keyView.model.get(keyView.currentIndex).text;
				}

				onUpPressed: {
					if (keyView.currentIndex < 12) {
						var row = keyView.currentIndex % 12;
						if (row < 10)
							edit.setFocus();
						else
							backSpace.setFocus();
					} else
						keyView.moveCurrentIndexUp();
				}

				onDownPressed: {
					if (keyView.currentIndex >= 12 * 3) {
						var row = keyView.currentIndex % 12;
						log(keyView.currentIndex);
						log(row);
						if (row < 2)
							langBtn.setFocus();
						else if (row < 4)
							upperCase.setFocus();
						else
							spaceBtn.setFocus();
					} else {
						keyView.moveCurrentIndexDown();
					}
				}
			}

			Row {
				anchors.left: parent.left;
				anchors.right: parent.right;
				anchors.bottom: parent.bottom;
				anchors.margins: 10;
				spacing: 4;
//------------------------Русская/Английская раскладка--------------------------
				KeyItem {
					id: langBtn;
					width: height * 2 + parent.spacing;
					text: "ru";
					borderColor: activeFocus ? colorTheme.activeBorderColor : "#22AB00";

					onSelectPressed: {
						langBtn.text = langBtn.text == "ru" ? "en" : "ru";
						ePlayerNamePanelItem.updateLang();
					}
				}
//-----------------------------------------------------------------------------

//----------------------------Клавиша зашлавных буква--------------------------
				KeyItem {
					id: upperCase;
					width: height * 2 + parent.spacing;
					//text: ePlayerNamePanelItem.isUpper ? "↥" : "⇧";
					text: ePlayerNamePanelItem.isUpper ? "|^|" : "^";
					borderColor: activeFocus ? colorTheme.activeBorderColor : "#F9BD29";

					onSelectPressed: {
						ePlayerNamePanelItem.isUpper = !ePlayerNamePanelItem.isUpper;
						ePlayerNamePanelItem.updateLang();
					}
				}
//-----------------------------------------------------------------------------

//----------------------------Пробел-------------------------------------------
				KeyItem {
					id: spaceBtn;
					width: (height + parent.spacing) * 6 - parent.spacing;
					text: "Space";

					onSelectPressed: {
						edit.text += " ";
					}
				}
//-----------------------------------------------------------------------------

//------------------------------Enter-------------------------------------------
				KeyItem {
					id: enterKey;
					width: keyView.cellWidth * 2 + parent.spacing;
					text: "Enter";
					borderColor: activeFocus ? colorTheme.activeBorderColor : "#003DD9";

					onSelectPressed: {
						ePlayerNamePanelItem.accepted(edit.text);
					}
				}

				onUpPressed: {
					keyView.setFocus();
				}
			}
//-----------------------------------------------------------------------------

//_______________________________КЛАВИАТУРА_END_________________________________
			function updateLang() {
				var prevIndex = keyView.count > 0 ? keyView.currentIndex : 0;
				keyView.model.reset();

				for (var i in ePlayerNamePanelItem.keysModel) {
					if (ePlayerNamePanelItem.keysModel[i].langCode == langBtn.text) {
						ePlayerNamePanelItem.keysModel[i].keys.forEach(function (key) {
							keyView.model.append({text: key[ePlayerNamePanelItem.isUpper ? 1 : 0]});
						});
						break;
					}
				}
				keyView.currentIndex = prevIndex;
			}

			show: {
				ePlayerNamePanelItem.visible = true;
				edit.text = "";
				edit.setFocus();
			}

			onKeyPressed: {
				log("key pressed " + key);
				if (!visible)
					return false;
				log("key pressed " + key);

				if (key == "Red") {
					edit.removeChar();
				} else if (key == "Green") {
					langBtn.text = langBtn.text == "ru" ? "en" : "ru";
					ePlayerNamePanelItem.updateLang();
				} else if (key == "Yellow") {
					ePlayerNamePanelItem.isUpper = !ePlayerNamePanelItem.isUpper;
					ePlayerNamePanelItem.updateLang();
				} else if (key == "Blue") {
					ePlayerNamePanelItem.accepted(edit.text);
				} else
					return false;

				return true;
			}

			onCompleted: {
				ePlayerNamePanelItem.keysModel = [
					{
						langCode: "ru",
						keys: [
							["1", "!"], ["2", "\""], ["3", "№"], ["4", ":"], ["5", "%"], ["6", ";"], ["7", "?"], ["8", "*"], ["9", "("], ["0", ")"], ["-", "_"], ["=", "+"],
							["й", "Й"], ["ц", "Ц"], ["у", "У"], ["к", "К"], ["е", "Е"], ["н", "Н"], ["г", "Г"], ["ш", "Ш"], ["щ", "Щ"], ["з", "З"], ["х", "Х"], ["ъ", "Ъ"],
							["ф", "Ф"], ["ы", "Ы"], ["в", "В"], ["а", "А"], ["п", "П"], ["р", "Р"], ["о", "О"], ["л", "Л"], ["д", "Д"], ["ж", "Ж"], ["э", "Э"], ["\\", "/"],
							["я", "Я"], ["ч", "Ч"], ["с", "С"], ["м", "М"], ["и", "И"], ["т", "Т"], ["ь", "Ь"], ["б", "Б"], ["ю", "Ю"], [".", ","], ["`", "~"], ["/", "|"]
						]
					},
					{
						langCode: "en",
						keys: [
							["1", "!"], ["2", "@"], ["3", "#"], ["4", "$"], ["5", "%"], ["6", "^"], ["7", "&"], ["8", "*"], ["9", "("], ["0", ")"], ["-", "_"], ["=", "+"],
							["q", "Q"], ["w", "W"], ["e", "E"], ["r", "R"], ["t", "T"], ["y", "Y"], ["u", "U"], ["i", "I"], ["o", "O"], ["p", "P"], ["[", "{"], ["]", "}"],
							["a", "A"], ["s", "S"], ["d", "D"], ["f", "F"], ["g", "G"], ["h", "H"], ["j", "J"], ["k", "K"], ["l", "L"], [";", ":"], ["'", "\""], ["\\", "/"],
							["z", "Z"], ["x", "X"], ["c", "C"], ["v", "V"], ["b", "B"], ["n", "N"], ["m", "M"], [",", "<"], [".", ">"], ["/", "?"], ["`", "~"], ["/", "|"]
						]
					}
				];
				ePlayerNamePanelItem.updateLang();
				edit.setFocus();
			}
	}

}
