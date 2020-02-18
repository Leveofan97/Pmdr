Item {
  id: custom;

  width: 50;
  height: 400;

  anchors.verticalCenter: parent.verticalCenter;
  anchors.left: parent.left;

  FocusablePanel {
    id: blueButton;

    anchors.right: custom.right;

    width: 50;
    height: 50;
    radius: 25;

    enabled: true;


    Rectangle {
      id: blue;

      anchors.right: custom.right;

      width: 40;
      height: 40;

      radius: 20;

      color: "#0017FD"; // blue
    }

    onUpPressed: {
      error("up pressed");
      faqButton.setFocus();
    }

    onDownPressed: {
      error("down pressed");
      yellowButton.setFocus();
    }

    onRightPressed: {
      error("right pressed");
      cancelButton.setFocus();
    }

    onLeftPressed: {
      error("left pressed");
      menuList.setFocus();
    }

    onSelectPressed: {
      error("click blue!");
    }

  }



  FocusablePanel {
    id: yellowButton;

    anchors.top: blue.bottom;
    anchors.topMargin: 20;
    anchors.right: custom.right;

    width: 50;
    height: 50;
    radius: 25;

    enabled: true;

    Rectangle {
      id: yellow;

      anchors.top: blue.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;

      width: 40;
      height: 40;
      radius: 20;

      color: "#FDDE00"; // yellow
    }

    onUpPressed: {
      error("up pressed");
      blueButton.setFocus();
    }

    onDownPressed: {
      error("down pressed");
      blackButton.setFocus();
    }

    onRightPressed: {
      error("right pressed");
      cancelButton.setFocus();
    }

    onLeftPressed: {
      error("left pressed");
      menuList.setFocus();
    }

    onSelectPressed: {
      error("click yellow!");
    }

  }



  FocusablePanel {
    id: blackButton;

    anchors.top: yellow.bottom;
    anchors.topMargin: 20;
    anchors.right: custom.right;

    width: 50;
    height: 50;
    radius: 25;

    enabled: true;

    Rectangle {
      id: black;

      anchors.top: yellow.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;

      width: 40;
      height: 40;
      radius: 20;

      color: "#121212"; // black
    }

    onUpPressed: {
      error("up pressed");
      yellowButton.setFocus();
    }

    onDownPressed: {
      error("down pressed");
      redButton.setFocus();
    }

    onRightPressed: {
      error("right pressed");
      cancelButton.setFocus();
    }

    onLeftPressed: {
      error("left pressed");
      menuList.setFocus();
    }

    onSelectPressed: {
      error("click black!");
    }
  }



  FocusablePanel {
    id: redButton;

    anchors.top: black.bottom;
    anchors.topMargin: 20;
    anchors.right: custom.right;

    width: 50;
    height: 50;
    radius: 25;

    enabled: true;

    Rectangle {
      id: red;

      anchors.top: black.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;

      width: 40;
      height: 40;
      radius: 20;

      color: "#ff0000"; // red
    }

    onUpPressed: {
      error("up pressed");
      blackButton.setFocus();
    }

    onDownPressed: {
      error("down pressed");
      musicButton.setFocus();
    }

    onRightPressed: {
      error("right pressed");
      cancelButton.setFocus();
    }

    onLeftPressed: {
      error("left pressed");
      menuList.setFocus();
    }

    onSelectPressed: {
      error("click red!");
    }

  }



  FocusablePanel {
    id: musicButton;

    anchors.top: red.bottom;
    anchors.topMargin: 20;
    anchors.right: custom.right;

    width: 50;
    height: 50;
    radius: 25;

    enabled: true;

    Image {
      id: musicImage;

      anchors.top: red.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;

      source: "apps/Pomodoro/img/music.png";
    }

    onUpPressed: {
      error("up pressed");
      redButton.setFocus();
    }

    onDownPressed: {
      error("down pressed");
      faqButton.setFocus();
    }

    onRightPressed: {
      error("right pressed");
      cancelButton.setFocus();
    }

    onLeftPressed: {
      error("left pressed");
      menuList.setFocus();
    }

    onSelectPressed: {
      error("click music!");
    }

  }



  FocusablePanel {
    id: faqButton;

    anchors.top: musicImage.bottom;
    anchors.topMargin: 20;
    anchors.right: custom.right;

    width: 50;
    height: 50;
    radius: 25;

    enabled: true;

    Image {
      id: faqImage;

      anchors.top: musicImage.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;

      source: "apps/Pomodoro/img/faq.png";
    }

    onUpPressed: {
      error("up pressed");
      musicButton.setFocus();
    }

    onDownPressed: {
      error("down pressed");
      blueButton.setFocus();
    }

    onRightPressed: {
      error("right pressed");
      cancelButton.setFocus();
    }

    onLeftPressed: {
      error("left pressed");
      menuList.setFocus();
    }

    onSelectPressed: {
      error("click faq!");
    }

  }
}
