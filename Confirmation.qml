Rectangle{
  id: confirmationBlock;
  visible: false;
  width: 400;
  height: 150;
  radius: 10;
  anchors.horizontalCenter: mainView.horizontalCenter;
  anchors.verticalCenter: mainView.verticalCenter;
  color: "#05878A";

  SubheadText {
      id: textConfirm;
      anchors.horizontalCenter: confirmationBlock.horizontalCenter;
  		anchors.topMargin: 25;
      horizontalAlignment: AlignHCenter;
      text: "Delete this task?";
      color: "#00f";
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
    }
  }
}
