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
      text: "Здравствуйте!";
      color: "#ffffff";
      width: 600;
      wrapMode: WordWrap;

    SecondaryText {
      id: taskContent;
      anchors.horizontalCenter: taskName.horizontalCenter;
  		anchors.top: taskName.bottom;
      horizontalAlignment: AlignHCenter;
      text: "Команда Wassup_team приветствует вас!";
      color: "#ffffff";
      width: 900;
      wrapMode: WordWrap;

    }
  }
}
