Rectangle{
  id: confirmationBlock;
  visible: false;
  width: 400;
  height: 120;
  radius: 10;
  borderWidth: 2;
  borderColor: "#000";
  anchors.horizontalCenter: mainView.horizontalCenter;
  anchors.verticalCenter: mainView.verticalCenter;
  color: "#FBE9E7";
  Behavior on color { animation: Animation { duration: 500; } }

  SubheadText {
      id: textConfirm;
      anchors.horizontalCenter: confirmationBlock.horizontalCenter;
      anchors.top: confirmationBlock.top;
      anchors.topMargin: 5;
      horizontalAlignment: AlignHCenter;
      text: " Удалить эту задачу?";
      color: "#000";
      // width: 600;
      // wrapMode: WordWrap;

  }

  Button{
    id: yes;
    width: 150;
    height: 50;
    radius: 5;

    //anchors.horizontalCenter: parent.horizontalCenter;
    anchors.verticalCenter: confirmationBlock.verticalCenter;
    anchors.left: confirmationBlock.left;
    anchors.top: textConfirm.bottom;
    anchors.topMargin: 10;
    anchors.leftMargin: 15;
    text: "Yes";

    onRightPressed: {
      log("right pressed");
      no.setFocus();
    }

    onSelectPressed: {
      log("yes pressed");
      menuList.removeTask();
      menuList.setFocus();
      confirmationBlock.visible = false;
      casetimer.opacity = 1;
      activeTask.opacity = 1;
      musicButton.opacity = 1;
      redButton.opacity = 1;
      yellowButton.opacity = 1;
      blueButton.opacity = 1;
      faqButton.opacity = 1;
    }

  }

  Button{
    id: no;
    width: 150;
    height: 50;
    radius: 5;
    //anchors.horizontalCenter: parent.horizontalCenter;
    anchors.verticalCenter: confirmationBlock.verticalCenter;
    anchors.right: confirmationBlock.right;
    anchors.top: textConfirm.bottom;
    anchors.topMargin: 10;
    anchors.rightMargin: 15;
    text: "No";

    onLeftPressed: {
      log("left pressed");
      yes.setFocus();
    }
    onSelectPressed: {
      log("no pressed");
      menuList.setFocus();
      confirmationBlock.visible = false;
      casetimer.opacity = 1;
      activeTask.opacity = 1;
      musicButton.opacity = 1;
      redButton.opacity = 1;
      yellowButton.opacity = 1;
      blueButton.opacity = 1;
      faqButton.opacity = 1;
    }
  }
}
