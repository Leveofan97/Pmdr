Text {
    id: taskName;
    property int elem: 0;
    anchors.horizontalCenter: timercyrcle.horizontalCenter;
		anchors.top: pauseButton.bottom;
		anchors.topMargin: 20;
    font: bodyFont;
    text: "NameTask";
    color: "#ffffff";


  Text {
    id: taskContent;
    anchors.horizontalCenter: taskName.horizontalCenter;
		anchors.top: taskName.bottom;

    font: bodyFont;
    text: "Красивый дизайн +";
    color: "#ffffff";
  }
}
