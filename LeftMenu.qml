Item {
  id: custom;

  width: 50;
  height: 400;

  anchors.verticalCenter: parent.verticalCenter;
  anchors.left: parent.left;


    Rectangle {
      id: blue;
      anchors.right: custom.right;
      width: 40;
      height: 40;
      radius: 20;
      color: "#0017FD"; // blue

      FocusablePanel {
        id: blueButton;

        anchors.horizontalCenter: blue.horizontalCenter;
        anchors.verticalCenter: blue.verticalCenter;

        width: 46;
        height: 46;
        radius: 23;
        opacity: active ? 1 : 0;
				color: active ? "#0017FD" : "#000";
        borderWidth: 2;
        borderColor: active ? "#fff" : "#0017FD";
        enabled: true;
        Behavior on color { animation: Animation { duration: 500; } }
				Behavior on borderColor { animation: Animation { duration: 500; } }

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
    }
    
    Rectangle {
      id: yellow;
      anchors.top: blue.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;
      width: 40;
      height: 40;
      radius: 20;
      color: "#FDDE00"; // yellow

      FocusablePanel {
        id: yellowButton;
        anchors.horizontalCenter: yellow.horizontalCenter;
        anchors.verticalCenter: yellow.verticalCenter;

        width: 46;
        height: 46;
        radius: 23;
        opacity: active ? 1 : 0;
        color: active ? "#FDDE00" : "#000";
        borderWidth: 2;
        borderColor: active ? "#fff" : "#FDDE00";
        enabled: true;

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
    }





    Rectangle {
      id: black;

      anchors.top: yellow.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;
      width: 40;
      height: 40;
      radius: 20;
      color: "#121212"; // black

      FocusablePanel {
        id: blackButton;
        anchors.horizontalCenter: black.horizontalCenter;
        anchors.verticalCenter: black.verticalCenter;

        width: 46;
        height: 46;
        radius: 23;
        opacity: active ? 1 : 0;
        color: active ? "#121212" : "#000";
        borderWidth: 2;
        borderColor: active ? "#fff" : "#121212";
        enabled: true;


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
    }





    Rectangle {
      id: red;
      anchors.top: black.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;
      width: 40;
      height: 40;
      radius: 20;
      color: "#ff0000"; // red

      FocusablePanel {
        id: redButton;

        anchors.horizontalCenter: red.horizontalCenter;
        anchors.verticalCenter: red.verticalCenter;

        width: 46;
        height: 46;
        radius: 23;
        opacity: active ? 1 : 0;
        color: active ? "#ff0000" : "#000";
        borderWidth: 2;
        borderColor: active ? "#fff" : "#ff0000";
        enabled: true;



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

    }




    Image {
      id: musicImage;
      anchors.top: red.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;
      source: "apps/Pomodoro/img/music.png";

      FocusablePanel {
        id: musicButton;
        anchors.horizontalCenter: musicImage.horizontalCenter;
        anchors.verticalCenter: musicImage.verticalCenter;
        width: 46;
        height: 46;
        enabled: true;
        radius: 23;
        opacity: active ? 0.2 : 0;
        color: active ? "#fff" : "#000";
        Behavior on color { animation: Animation { duration: 500; } }
        Behavior on borderColor { animation: Animation { duration: 500; } }

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
    }





    Image {
      id: faqImage;
      anchors.top: musicImage.bottom;
      anchors.topMargin: 20;
      anchors.right: custom.right;
      source: "apps/Pomodoro/img/faq.png";

      FocusablePanel {
        id: faqButton;
        anchors.horizontalCenter: faqImage.horizontalCenter;
        anchors.verticalCenter: faqImage.verticalCenter;
        width: 46;
        height: 46;
        enabled: true;
        radius: 23;
        opacity: active ? 0.2 : 0;
        color: active ? "#fff" : "#000";
        Behavior on color { animation: Animation { duration: 500; } }
        Behavior on borderColor { animation: Animation { duration: 500; } }


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

}
