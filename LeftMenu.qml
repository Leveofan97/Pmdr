import "SettingsWindow.qml";

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

    Rectangle {
      id: blue;
      anchors.horizontalCenter: blueButton.horizontalCenter;
      anchors.verticalCenter: blueButton.verticalCenter;
      width: 40;
      height: 40;
      radius: 20;
      color: "#0017FD";
      FocusablePanel {
        id: innerblueButton;
        anchors.horizontalCenter: blue.horizontalCenter;
        anchors.verticalCenter: blue.verticalCenter;
        width: 6;
        height: 6;
        radius: 3;
        color: active ? "#fff" : "#0017FD";
        enabled: true;
        Behavior on color { animation: Animation { duration: 500; } }
      }
    }

    onUpPressed: {
      log("up pressed");
      faqButton.setFocus();
    }

    onDownPressed: {
      log("down pressed");
      yellowButton.setFocus();
    }

    onRightPressed: {
      log("right pressed");
      casetimer.controltimerButton.setFocus();
    }

    onLeftPressed: {
      log("left pressed");
      menuList.setFocus();
    }

    onSelectPressed: {
      log("Выбрана другая тема");
      blu.visible = true;
      blu.opacity = 1;
      activeTask.taskName.color = "#000";
      activeTask.taskContent.color = "#000";
      yel.visible = false;
      redcolor.visible = false;
      mainback.visible = false;
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

          FocusablePanel {
            id: inneryellowButton;
            anchors.horizontalCenter: yellow.horizontalCenter;
            anchors.verticalCenter: yellow.verticalCenter;
            width: 6;
            height: 6;
            radius: 3;
            color: active ? "#121212" : "#FDDE00";
            enabled: true;
            Behavior on color { animation: Animation { duration: 500; } }
          }
        }

        onUpPressed:
        {
          log("up pressed");
          blueButton.setFocus();
        }

        onDownPressed:
        {
          log("down pressed");
          blackButton.setFocus();
        }

        onRightPressed:
        {
          log("right pressed");
          casetimer.controltimerButton.setFocus();
        }

        onLeftPressed:
        {
          log("left pressed");
          menuList.setFocus();
        }

        onSelectPressed:
        {
          log("Выбрана другая тема");
          yel.visible = true;
          yel.opacity = 1;
          activeTask.taskName.color = "#000";
          activeTask.taskContent.color = "#000";
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
          FocusablePanel {
            id: innerblackButton;
            anchors.horizontalCenter: black.horizontalCenter;
            anchors.verticalCenter: black.verticalCenter;
            width: 6;
            height: 6;
            radius: 3;
            color: active ? "#fff" : "#121212";
            enabled: true;
            Behavior on color { animation: Animation { duration: 500; } }
          }
        }

        onUpPressed:
        {
          log("up pressed");
          yellowButton.setFocus();
        }

        onDownPressed: {
          log("down pressed");
          redButton.setFocus();
        }

        onRightPressed:
        {
          log("right pressed");
          casetimer.controltimerButton.setFocus();
          focus: false;
        }

        onLeftPressed:
        {
          log("left pressed");
          menuList.setFocus();
          focus: false;
        }

        onSelectPressed:
        {
          log("Выбрана другая тема!");
          mainback.visible = true;
          mainback.opacity = 1;
          activeTask.taskName.color = "#fff";
          activeTask.taskContent.color = "#fff";
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

        FocusablePanel {
            id: innerredButton;
            anchors.horizontalCenter: red.horizontalCenter;
            anchors.verticalCenter: red.verticalCenter;
            width: 6;
            height: 6;
            radius: 3;
            color: active ? "#fff" : "#ff0000";
            enabled: true;
            Behavior on color { animation: Animation { duration: 500; } }
          }
        }

        onUpPressed:
        {
          log("up pressed");
          blackButton.setFocus();
        }

        onDownPressed:
        {
          log("down pressed");
          musicButton.setFocus();
        }

        onRightPressed:
        {
          log("right pressed");
          casetimer.controltimerButton.setFocus();
        }

        onLeftPressed:
        {
          log("left pressed");
          menuList.setFocus();
        }

        onSelectPressed:
        {
          log("Выбрана другая тема!");
          redcolor.visible = true;
          redcolor.opacity = 1;
          activeTask.taskName.color = "#fff";
          activeTask.taskContent.color = "#fff";
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
        borderWidth: 1;
  			borderColor: active ? "#000" : "#121212";
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
          log("up pressed");
          redButton.setFocus();
        }

        onDownPressed:
        {
          log("down pressed");
          settingButton.setFocus();
        }

        onRightPressed:
        {
          log("right pressed");
          casetimer.controltimerButton.setFocus();
        }

        onLeftPressed:
        {
          log("left pressed");
          menuList.setFocus();
        }

        onSelectPressed:
        {
          if(timer.flagURL >= timer.countaudio - 1){
            timer.flagURL = 0;
          }else{
            timer.flagURL++;
          }
          log("Мелодия сменилась на " + timer.flagURL);
        }

  }

  FocusablePanel
  {
        id: settingButton;
        anchors.right: custom.right;
        anchors.horizontalCenter: settImage.horizontalCenter;
        anchors.verticalCenter: settImage.verticalCenter;
        width: 45;
        height: 45;
        radius: 23;
        opacity: 1;
        color: active ? "#8FBC8B" : "#121212";
        enabled: true;
        Behavior on color { animation: Animation { duration: 500; } }

        Image
        {
          id:settImage;
          anchors.top: musicImage.bottom;
          anchors.topMargin: 20;
          anchors.horizontalCenter: settingButton.horizontalCenter;
          source: "apps/Pomodoro/img/setting.png";
        }

        onUpPressed:
        {
          log("up pressed");
          musicButton.setFocus();
        }

        onDownPressed:
        {
          log("down pressed");
          faqButton.setFocus();
        }

        onRightPressed:
        {
          log("right pressed");
          casetimer.controltimerButton.setFocus();
        }

        onLeftPressed:
        {
          log("left pressed");
          menuList.setFocus();
        }

        onSelectPressed:
        {
          log("PressSettings");
          settingsWin.visible = true;
          log("Visible");
  				casetimer.opacity = 0.1;
  				activeTask.opacity = 0.1;
  				musicButton.opacity = 0.1;
  				redButton.opacity = 0.1;
  				yellowButton.opacity = 0.1;
  				blueButton.opacity = 0.1;
  				faqButton.opacity = 0.1;
  				settingButton.opacity = 0.1;
  				headlineSetting.text = "Настройки";
          closeButton.setFocus();
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
          anchors.top: settImage.bottom;
          anchors.topMargin: 20;
          anchors.horizontalCenter: faqButton.horizontalCenter;
          source: "apps/Pomodoro/img/faq.png";
        }

        onUpPressed:
        {
          log("up pressed");
          settingButton.setFocus();
        }

        onDownPressed:
        {
          log("down pressed");
          blueButton.setFocus();
        }

        onRightPressed:
        {
          log("right pressed");
          casetimer.controltimerButton.setFocus();
        }

        onLeftPressed:
        {
          log("left pressed");
          menuList.setFocus();
        }

        onSelectPressed:
        {
        log("Вызвано окно FAQ");
          faq.visible = true;
          descriptionText.setFocus();
          casetimer.visible = false;
          rightMenu.opacity = 0.1;
          activeTask.visible = false;
          musicButton.opacity = 0.1;
          redButton.opacity = 0.1;
          yellowButton.opacity = 0.1;
          blueButton.opacity = 0.1;
  				settingButton.opacity = 0.1;
          faqButton.opacity = 0.1;
        }

  }

  SettingsWindow{}

}
