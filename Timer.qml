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

			FocusablePanel {
				id: timePanel;

				anchors.centerIn: parent;

				width: 125;
				height: 50;
				radius: 25;

				enabled: true;
				opacity: active ? 0.5 : 0;
				color: active ? "#00f" : "#f00";

				Behavior on color { animation: Animation { duration: 500; } }
				Behavior on borderColor { animation: Animation { duration: 500; } }

				onDownPressed: {
					error("down pressed");
					pauseButton.setFocus();
				}

				onSelectPressed: {
					error("25:00!");
				}

			}
		}



		Image {
	 		id: pause;
			anchors.horizontalCenter: parent.verticalCenter;
			anchors.top: parent.bottom;
			anchors.topMargin: 20;
			source: "apps/Pomodoro/img/pause.png";

			FocusablePanel {
				id: pauseButton;
				anchors.centerIn: parent;


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
					timePanel.setFocus();
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
		}

		Image {
	 		id: reset;
			anchors.right: parent.right;
			anchors.bottom: parent.bottom;

			source: "apps/Pomodoro/img/reset.png";

			FocusablePanel {
				id: resetButton;

				anchors.centerIn: parent;

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
					timePanel.setFocus();
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
		}


		Image {
	 		id: cancel;
			anchors.left: parent.left;
			anchors.bottom: parent.bottom;
			source: "apps/Pomodoro/img/cancel.png";

			FocusablePanel {
				id: cancelButton;
				anchors.centerIn: parent;

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
					timePanel.setFocus();
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
}
