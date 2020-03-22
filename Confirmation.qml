Rectangle{
  id: confirmationBlock;
  visible: false;

  width: 400;
  height: 120;
  radius: 10;

  anchors.horizontalCenter: mainView.horizontalCenter;
  anchors.verticalCenter: mainView.verticalCenter;

  color: "#FBE9E7";
  borderWidth: 2;
  borderColor: "#000";
  Behavior on color { animation: Animation { duration: 500; } }

  SubheadText {
      id: textConfirm;

      anchors.horizontalCenter: confirmationBlock.horizontalCenter;
      anchors.top: confirmationBlock.top;
      anchors.topMargin: 5;

      horizontalAlignment: AlignHCenter;
      text: " Удалить эту задачу?";
      color: "#000";
  }

  Button{
    id: yesBtn;

    width: 150;
    height: 50;
    radius: 5;

    anchors.verticalCenter: confirmationBlock.verticalCenter;
    anchors.left: confirmationBlock.left;
    anchors.top: textConfirm.bottom;
    anchors.topMargin: 10;
    anchors.leftMargin: 15;

    text: "Да";

    onRightPressed: {
      log("right pressed");
      noBtn.setFocus();
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
      settingButton.opacity = 1;
    }

  }

  Button {
    id: noBtn;

    width: 150;
    height: 50;
    radius: 5;

    anchors.verticalCenter: confirmationBlock.verticalCenter;
    anchors.right: confirmationBlock.right;
    anchors.top: textConfirm.bottom;
    anchors.topMargin: 10;
    anchors.rightMargin: 15;

    text: "Нет";

    onLeftPressed: {
      log("left pressed");
      yesBtn.setFocus();
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
      settingButton.opacity = 1;
    }
  }

  onBackPressed: {
    menuList.setFocus();
    confirmationBlock.visible = false;

    casetimer.opacity = 1;
    activeTask.opacity = 1;
    musicButton.opacity = 1;
    redButton.opacity = 1;
    yellowButton.opacity = 1;
    blueButton.opacity = 1;
    faqButton.opacity = 1;
    settingButton.opacity = 1;
  }
}
