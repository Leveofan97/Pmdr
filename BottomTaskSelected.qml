SubheadText {
    id: taskName;

    property int elem: 0;
    anchors.horizontalCenter: timercyrcle.horizontalCenter;
		//anchors.top: controltimerButton.bottom;
		anchors.topMargin: 20;

    //font: bodyFont;
    horizontalAlignment: AlignHCenter;

    text: "NameTask";
    color: "#ffffff";

    width: 600;
    wrapMode: WordWrap;

  SecondaryText {
    id: taskContent;
    anchors.horizontalCenter: taskName.horizontalCenter;
		anchors.top: taskName.bottom;

    //font: bodyFont;
    horizontalAlignment: AlignHCenter;

    text: "Красивый дизайн +";
    color: "#ffffff";
    width: 1000;
    //height: 50;
    //contentWidth: 110.5;
    //contentHeight: 110.5;
    wrapMode: WordWrap;
    //wrapMode: WrapAnywhere;

  }
  // onLineLaidOut: { }
}
