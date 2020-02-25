Item{
  id: activeTask;
  visible: true;
SubheadText {
    id: taskName;

    property int elem: 0;
    anchors.horizontalCenter: timercyrcle.horizontalCenter;
		anchors.top: controltimerButton.bottom;
		anchors.topMargin: 20;
    horizontalAlignment: AlignHCenter;
    text: "NameTask";
    color: "#ffffff";
    width: 600;
    wrapMode: WordWrap;

  SecondaryText {
    id: taskContent;
    anchors.horizontalCenter: taskName.horizontalCenter;
		anchors.top: taskName.bottom;
    horizontalAlignment: AlignHCenter;
    text: "Красивый дизайн +";
    color: "#ffffff";
    width: 900;
    wrapMode: WordWrap;
  }
}
}
