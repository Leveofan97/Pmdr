import controls.Edit;
import "KeyboardModel.qml";
import "KeyItem.qml";

Item {
	id: ePlayerNamePanelItem;
	focus: true;
	//property alias hint: edit.hint;
  anchors.horizontalCenter: mainView.horizontalCenter;
  anchors.verticalCenter: mainView.verticalCenter;
	height: 220;
	width: 400;
	visible: false;
	//property variant keysModel;
	//property bool isUpper;

	//signal accepted(text);

	Rectangle {
		anchors.fill: parent;
		color: "#000";
		radius: 8;
		borderWidth: 1;
		borderColor: "#555";
		opacity: 0.7;
	}

	Edit {
		id: edit;
		height: 30; // 60
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.margins: 10;
		focus: true;

		onDownPressed: {
			edit2.setFocus();
		}

		onSelectPressed: {
			//ePlayerNamePanelItem.accepted(edit.text);
		}

    onCompleted: {
      editText.wrapMode = "WordWrap";
    }
	}

  Edit {
    id: edit2;
    anchors.top: edit.bottom;
    anchors.bottom: saveButtom.top;
    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.margins: 10;
    focus: true;

    onUpPressed: {
      edit.setFocus();
    }

    onDownPressed: {
      saveButtom.setFocus();
    }

    onSelectPressed: {
      //ePlayerNamePanelItem.accepted(edit.text);
    }

    onCompleted: {
      editText.wrapMode = "WordWrap";
    }

  }

	Row {
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		anchors.margins: 10;
		spacing: 4;

    KeyItem {
			id: saveButtom;
			width: height * 6.8 + parent.spacing;
			text: "Save";
			borderColor: activeFocus ? colorTheme.activeBorderColor : "#22AB00";

			onSelectPressed: {

			}
		}

    KeyItem {
      id: cancelButton;
      // height: 30;
      // anchors.top: edit.top;
      // anchors.bottom: edit.bottom;
      // anchors.right: parent.right;
      // anchors.rightMargin: 10;
      text: "Cancel";
      width: height * 6.8 + parent.spacing;
      borderColor: activeFocus ? colorTheme.activeBorderColor : "#EA2022";

      onUpPressed: {
        edit2.setFocus();
      }

      onSelectPressed: {
        //edit.removeChar();
      }

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
			log("Red");
		} else if (key == "Green") {
			log("Green");
		} else return false;

		return true;
	}

	onCompleted: {}
  }
}
