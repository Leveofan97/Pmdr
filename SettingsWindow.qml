import controls.Edit;
import "KeyItem.qml";
import "TimersFunctions.js" as TimeFunc;

Item {
	id: settingsWin;

	focus: true;
	visible: false;

	property int curIndex;

	height: 300;
	width: 400;
  anchors.horizontalCenter: mainView.horizontalCenter;
  anchors.verticalCenter: mainView.verticalCenter;


	Rectangle {
		anchors.fill: parent;
		color: "#000";
		opacity: 0.7;
		radius: 8;
		borderWidth: 1;
		borderColor: "#555";
	}

	Text {
		id: headlineSetting;

		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: parent.top;
		anchors.topMargin: 5;

		text: "";
		font: bodyFont;
		color: "#fff";
	}

	Text {
		id: settingTimeWorkLine;

		anchors.left: parent.left;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: parent.top;
		anchors.topMargin: 50;
		anchors.leftMargin: 10;

		text: "Время работы: ";
		font: bodyFont;
		color: "#fff";
	}

	Text {
		id: settingTimeRelaxLine;

		anchors.left: parent.left;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: parent.top;
		anchors.topMargin: 90;
		anchors.leftMargin: 10;

		text: "Время отдыха: ";
		font: bodyFont;
		color: "#fff";
	}

	Text {
		id: settingTimeBreakLine;

		anchors.left: parent.left;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: parent.top;
		anchors.topMargin: 130;
		anchors.leftMargin: 10;

		text: "Время перерыва: ";
		font: bodyFont;
		color: "#fff";
	}

	FocusablePanel{
		id: settingTimeWorkFocus;

		anchors.top: settingTimeWorkLine.top;
		anchors.horizontalCenter: settingTimeWorkLine.horizontalCenter;
		anchors.leftMargin: 350;


		width: 70;
		height: 28;
		color: active ? "#FFAA33" : "#121212";
		opacity: active ? 0.9 : 0.8;

		Text {
			id: settingTimeWorkFocusText;

			anchors.top: parent.top;
			anchors.horizontalCenter: settingTimeWorkLine.horizontalCenter;
			anchors.leftMargin: 350;


			property string delimiter: clockFace.defworksec % 60 < 10 ? ":0" : ":";
			text: Math.floor(clockFace.defworksec / 60) + delimiter + clockFace.defworksec % 60;
			font: bodyFont;
			color: "#fff";
		}

		onDownPressed: {
			settingTimeRelaxFocus.setFocus();
		}

		onLeftPressed: {
			TimeFunc.DownTimerBySec(clockFace.defworksec, 0);
		}

		onRightPressed: {
			TimeFunc.UpTimerBySec(clockFace.defworksec, 0);
		}
	}

	FocusablePanel{
		id: settingTimeRelaxFocus;

		anchors.top: settingTimeRelaxLine.top;
		anchors.horizontalCenter: settingTimeRelaxLine.horizontalCenter;
		anchors.leftMargin: 350;


		width: 70;
		height: 28;
		color: active ? "#FFAA33" : "#121212";
		opacity: active ? 0.9 : 0.8;

		Text {
			id: settingTimeRelaxFocusText;

			anchors.top: parent.top;
			anchors.horizontalCenter: settingTimeRelaxLine.horizontalCenter;
			anchors.leftMargin: 355;

			property string delimiter: clockFace.defrelaxsec % 60 < 10 ? ":0" : ":";
			text: Math.floor(clockFace.defrelaxsec / 60) + delimiter + clockFace.defrelaxsec % 60;
			font: bodyFont;
			color: "#fff";
		}

		onDownPressed: {
			settingTimeBreakFocus.setFocus();
		}

		onUpPressed: {
			settingTimeWorkFocus.setFocus();
		}

		onLeftPressed: {
			TimeFunc.DownTimerBySec(clockFace.defrelaxsec, 1);
		}

		onRightPressed: {
			TimeFunc.UpTimerBySec(clockFace.defrelaxsec, 1);
		}
	}

	FocusablePanel{
		id: settingTimeBreakFocus;

		anchors.top: settingTimeBreakLine.top;
		anchors.horizontalCenter: settingTimeBreakLine.horizontalCenter;
		anchors.leftMargin: 330;


		width: 70;
		height: 28;
		color: active ? "#FFAA33" : "#121212";
		opacity: active ? 0.9 : 0.8;

		Text {
			id: settingTimeBreakFocusText;

			anchors.top: parent.top;
			anchors.horizontalCenter: settingTimeBreakLine.horizontalCenter;
			anchors.leftMargin: 335;

			property string delimiter: clockFace.defbigrelsxsec % 60 < 10 ? ":0" : ":";
			text: Math.floor(clockFace.defbigrelsxsec / 60) + delimiter + clockFace.defbigrelsxsec % 60;
			font: bodyFont;
			color: "#fff";
		}

		onLeftPressed: {
			TimeFunc.DownTimerBySec(clockFace.defbigrelsxsec, 2);
		}

		onRightPressed: {
			TimeFunc.UpTimerBySec(clockFace.defbigrelsxsec, 2);
		}

		onDownPressed: {
			closeButton.setFocus();
		}

		onUpPressed: {
			settingTimeRelaxFocus.setFocus();
		}
	}

	Row {
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		anchors.margins: 10;

		spacing: 4;

		KeyItem {
			id: closeButton;

			width: height * 6.75 + parent.spacing;
			text: "Закрыть";
			borderColor: activeFocus ? colorTheme.activeBorderColor : "#EA2022";

			onUpPressed: {
				settingTimeBreakFocus.setFocus();
			}

			onUpPressed: {
				settingTimeBreakFocus.setFocus();
			}

			onSelectPressed: {
				settingsWin.visible = false;
				settingButton.setFocus();
				casetimer.opacity = 1;
				activeTask.opacity = 1;
				musicButton.opacity = 1;
				redButton.opacity = 1;
				yellowButton.opacity = 1;
				blueButton.opacity = 1;
				faqButton.opacity = 1;
				settingButton.opacity = 1;
				clockFace.seconds = stateTimer.flagstate == 0 ?
									clockFace.defworksec : stateTimer.flagstate == 1 ?
												clockFace.defrelaxsec : clockFace.defbigrelsxsec;
			}
		}
	}

	onKeyPressed: {
		if (!visible)
			return false;
		log("key pressed " + key);

		if (key == "Red") {
			log("Red");
			closeButton.onSelectPressed();
		} else return false;

		return true;
	}

}
