Item {
  id: custom;

  width: 50;
  height: 400;

  anchors.verticalCenter: parent.verticalCenter;
  anchors.left: parent.left;

  FocusablePanel {
    id: blueButton;
    anchors.right: custom.right;
    anchors.horizontalCenter: blue.horizontalCenter;
    anchors.verticalCenter: blue.verticalCenter;
    width: 44;
    height: 44;
    radius: 22;
    color: active ? "#fff" : "#0017FD";
    enabled: true;
    Behavior on color { animation: Animation { duration: 500; } }
    //Behavior on borderColor { animation: Animation { duration: 500; } }

    Rectangle {
      id: blue;
      //property bool active: activeFocus;
      anchors.horizontalCenter: blueButton.horizontalCenter;
      anchors.verticalCenter: blueButton.verticalCenter;
      width: 40;
      height: 40;
      radius: 20;
      color: "#0017FD";
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
      blu.visible = true;
      blu.opacity = 1;
      yel.visible = false;
      redcolor.visible = false;
      mainback.visible = false;
      log("Выбрана синяя тема");
    }

  }


FocusablePanel
{
      id: yellowButton;
      anchors.right: custom.right;
      anchors.horizontalCenter: yellow.horizontalCenter;
      anchors.verticalCenter: yellow.verticalCenter;
      width: 44;
      height: 44;
      radius: 22;
      color: active ? "#fff" : "#FDDE00";
      enabled: true;
      Behavior on color { animation: Animation { duration: 500; } }
      //Behavior on borderColor { animation: Animation { duration: 500; } }

        Rectangle
        {
          id: yellow;
          anchors.top: blue.bottom;
          anchors.topMargin: 20;
          anchors.horizontalCenter: yellowButton.horizontalCenter;
          width: 40;
          height: 40;
          radius: 20;
          color: "#FDDE00"; // yellow
        }

      onUpPressed:
      {
        error("up pressed");
        blueButton.setFocus();
      }

      onDownPressed:
      {
        error("down pressed");
        blackButton.setFocus();
      }

      onRightPressed:
      {
        error("right pressed");
        cancelButton.setFocus();
      }

      onLeftPressed:
      {
        error("left pressed");
        menuList.setFocus();
      }

      onSelectPressed:
      {
        log("Выбрана синяя тема");
        yel.visible = true;
        yel.opacity = 1;
        blu.visible = false;
        mainback.visible = false;
        redcolor.visible = false;
      }
}


FocusablePanel
{
      id: blackButton;
      anchors.right: custom.right;
      anchors.horizontalCenter: black.horizontalCenter;
      anchors.verticalCenter: black.verticalCenter;
      width: 44;
      height: 44;
      radius: 22;
      color: active ? "#fff" : "#121212";
      enabled: true;
      Behavior on color { animation: Animation { duration: 500; } }

        Rectangle
        {
          id: black;
          anchors.top: yellow.bottom;
          anchors.topMargin: 20;
          anchors.horizontalCenter: blackButton.horizontalCenter;
          width: 40;
          height: 40;
          radius: 20;
          color: "#121212"; // black
        }

      onUpPressed:
      {
        error("up pressed");
        yellowButton.setFocus();
      }

        onDownPressed: {
          error("down pressed");
          redButton.setFocus();
        }

      onRightPressed:
      {
        error("right pressed");
        cancelButton.setFocus();
        focus: false;
      }

      onLeftPressed:
      {
        error("left pressed");
        menuList.setFocus();
        focus: false;
      }

      onSelectPressed:
      {
        log("Выбрана другая тема!");
        mainback.visible = true;
        mainback.opacity = 1;
        blu.visible = false;
        yel.visible = false;
        redcolor.visible = false;
      }
}

FocusablePanel
{
      id: redButton;
      anchors.right: custom.right;
      anchors.horizontalCenter: red.horizontalCenter;
      anchors.verticalCenter: red.verticalCenter;
      width: 44;
      height: 44;
      radius: 22;
      color: active ? "#fff" : "#ff0000";
      enabled: true;
      Behavior on color { animation: Animation { duration: 500; } }

      Rectangle
      {
        id: red;
        anchors.top: black.bottom;
        anchors.topMargin: 20;
        anchors.horizontalCenter: redButton.horizontalCenter;
        width: 40;
        height: 40;
        radius: 20;
        color: "#ff0000"; // red
      }

      onUpPressed:
      {
        error("up pressed");
        blackButton.setFocus();
      }

      onDownPressed:
      {
        error("down pressed");
        musicButton.setFocus();
      }

      onRightPressed:
      {
        error("right pressed");
        cancelButton.setFocus();
      }

      onLeftPressed:
      {
        error("left pressed");
        menuList.setFocus();
      }

      onSelectPressed:
      {
        log("Выбрана другая тема!");
        redcolor.visible = true;
        redcolor.opacity = 1;
        blu.visible = false;
        yel.visible = false;
        mainback.visible = false;
      }

}

FocusablePanel
{
      id: musicButton;
      anchors.right: custom.right;
      anchors.horizontalCenter: musicImage.horizontalCenter;
      anchors.verticalCenter: musicImage.verticalCenter;
      width: 45;
      height: 45;
      radius: 23;
      color: active ? "#8FBC8B" : "#121212";
      enabled: true;
      Behavior on color { animation: Animation { duration: 500; } }

      Image
      {
        id: musicImage;
        anchors.top: red.bottom;
        anchors.topMargin: 20;
        anchors.horizontalCenter: musicButton.horizontalCenter;
        source: "apps/Pomodoro/img/music.png";
      }

      onUpPressed:
      {
        error("up pressed");
        redButton.setFocus();
      }

      onDownPressed:
      {
        error("down pressed");
        faqButton.setFocus();
      }

      onRightPressed:
      {
        error("right pressed");
        cancelButton.setFocus();
      }

      onLeftPressed:
      {
        error("left pressed");
        menuList.setFocus();
      }

      onSelectPressed:
      {
        error("click music!");
      }

}

FocusablePanel
{
      id: faqButton;
      anchors.right: custom.right;
      anchors.horizontalCenter: faqImage.horizontalCenter;
      anchors.verticalCenter: faqImage.verticalCenter;
      width: 44;
      height: 44;
      radius: 22;
      color: active ? "#8FBC8B" : "#121212";
      enabled: true;
      Behavior on color { animation: Animation { duration: 500; } }


        Image
        {
          id: faqImage;
          anchors.top: musicImage.bottom;
          anchors.topMargin: 20;
          anchors.horizontalCenter: faqButton.horizontalCenter;
          source: "apps/Pomodoro/img/faq.png";
        }

      onUpPressed:
      {
        error("up pressed");
        musicButton.setFocus();
      }

      onDownPressed:
      {
        error("down pressed");
        blueButton.setFocus();
      }

      onRightPressed:
      {
        error("right pressed");
        cancelButton.setFocus();
      }

      onLeftPressed:
      {
        error("left pressed");
        menuList.setFocus();
      }

      onSelectPressed:
      {
        error("click faq!");
      }

}
}
