Item {
	x: 510;
	y: 500;

	Rectangle {
		id: timercyrcle;

		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: mainView.verticalCenter;

		color: "#FBE9E7";

    width: 350;
		height: 350;
		radius: 175;

		Text {
			anchors.horizontalCenter: timercyrcle.horizontalCenter;
			anchors.bottom: parent.top;
			anchors.bottomMargin: 20;

			font: titleFont;
			text: "Pomodoro";
			color: "#ffffff";
		}

		Text {
			anchors.centerIn: parent;

			text: "25:00";
			color: "#000000";
			font: titleFont;
		}

		FocusablePanel {
			id: pauseButton;

			anchors.horizontalCenter: parent.verticalCenter;
			anchors.top: parent.bottom;
			anchors.topMargin: 20;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			//opacity: 0.1;

			Image {
		 		id: pause;
	      anchors.centerIn: parent;
				source: "apps/Pomodoro/img/pause.png";
			}

			onLeftPressed: {
				error("left pressed");
				cancelButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				resetButton.setFocus();
			}

			onSelectPressed: {
				error("click pause!");
			}
		}

		FocusablePanel {
			id: resetButton;

			anchors.right: parent.right;
			anchors.bottom: parent.bottom;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			Image {
		 		id: reset;
				anchors.centerIn: parent;
				source: "apps/Pomodoro/img/reset.png";
			}

			onLeftPressed: {
				error("left pressed");
				pauseButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				menuList.setFocus();
			}

			onSelectPressed: {
				error("click reset!");
			}
		}

		FocusablePanel {
			id: cancelButton;

			anchors.left: parent.left;
			anchors.bottom: parent.bottom;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			Image {
		 		id: cancel;
				anchors.centerIn: parent;
				source: "apps/Pomodoro/img/cancel.png";
			}

			onLeftPressed: {
				error("left pressed");
				faqButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				pauseButton.setFocus();
			}

			onSelectPressed: {
				error("click cansel!");
			}
		}
  }
}
