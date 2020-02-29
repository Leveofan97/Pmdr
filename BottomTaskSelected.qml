Item {
  id: activeTask;
  visible: true;

  SubheadText {
      id: taskName;

      property int elem: 0;

      width: 600;
      anchors.horizontalCenter: timercyrcle.horizontalCenter;
  		anchors.top: controltimerButton.bottom;
  		anchors.topMargin: 20;

      horizontalAlignment: AlignHCenter;
      text: "Здравствуйте!";
      color: "#ffffff";
      wrapMode: WordWrap;

    SecondaryText {
      id: taskContent;
      width: 900;
      anchors.horizontalCenter: taskName.horizontalCenter;
  		anchors.top: taskName.bottom;

      horizontalAlignment: AlignHCenter;
      text: "Команда Wassup_team приветствует вас!";
      color: "#ffffff";
      wrapMode: WordWrap;

    }
  }
}
