Rectangle {
	id: taskSelected;

	width: 300;
	height: 100;

  anchors.horizontalCenter: mainView.horizontalCenter;
  anchors.verticalCenter: mainView.verticalCenter;
	anchors.bottom: parent.bottom;

  color: "#f00";

  Text {
    id: taskName;
    anchors.horizontalCenter: parent.horizontalCenter;
    anchors.top: parent.top;

    font: titleFont;
    text: "Pomodoro";
    color: "#ffffff";
  }

  Text {
    id: taskContent;
    anchors.horizontalCenter: parent.horizontalCenter;
    anchors.top: taskName.bottom;

    font: titleFont;
    text: "Pomodoro123123";
    color: "#ffffff";
  }
}
