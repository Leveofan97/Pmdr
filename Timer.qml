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



	FocusablePanel {
		id: timePanel;

		anchors.centerIn: parent;

		width: 125;
		height: 50;
		radius: 25;

		enabled: true;
		property string focusselect: (clockFace.selectflag ? "#EBBAB5" : "#96CEB4");
		property string colorfocus: active ? focusselect : "#FBE9E7";
		color: colorfocus;

		Behavior on color { animation: Animation { duration: 500; } }
		Behavior on borderColor { animation: Animation { duration: 500; } }

		Text {
			id: clockFace;
			anchors.centerIn: parent;
			property int seconds;
			property int startseconds;
			property bool selectflag: false;
			property string delimiter: seconds % 60 < 10 ? ":0" : ":";
			text: Math.floor(seconds / 60) + delimiter + seconds % 60;
			color: "#000000";
			font: titleFont;
		}

		onDownPressed: {
			if(clockFace.selectflag){
				if(clockFace.seconds > 0){
					clockFace.seconds-=30;
				}else{
					error("Minimum or not selected");
				}
			}else{
				controltimerButton.setFocus();
			}
		}

		onSelectPressed: {
			if(!controltimer.isTimerRun){
				clockFace.selectflag = clockFace.selectflag ? false : true;
				log(clockFace.selectflag);
			}else{
				error("Timer started");
			}
		}

		onLeftPressed: {
			if(clockFace.seconds > 299 && clockFace.selectflag){
				clockFace.seconds-=300;
			}else{
				error("Minimum or not selected");
			}
		}

		onRightPressed: {
			if(clockFace.seconds<5101  && clockFace.selectflag){
				clockFace.seconds+=300;
			}else{
				error("Maximum or not selected");
			}
		}

		onUpPressed: {
			if(clockFace.selectflag){
				if(clockFace.seconds<5400){
					clockFace.seconds+=30;
				}else{
					error("Maximum or not selected");
				}
			}
		}

	}


		FocusablePanel {
			id: controltimerButton;
			anchors.horizontalCenter: parent.verticalCenter;
			anchors.top: parent.bottom;
			anchors.topMargin: 20;


			width: 46;
			height: 46;
			enabled: true;
			radius: 23;
			opacity: active ? 1 : 0.7;
			color: active ? "#05878A" : "#121212";

			Behavior on color { animation: Animation { duration: 500; } }
			Behavior on borderColor { animation: Animation { duration: 500; } }

			Image {
		 		id: controltimer;
				property bool isTimerRun: false;
				property string control: (this.isTimerRun ? "pause" : "play");
				source: "apps/Pomodoro/img/"+control+".png";
				anchors.centerIn: parent;
			}

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
				if(!controltimer.isTimerRun){
					clockFace.startseconds = clockFace.seconds;
					log("Start time: " + clockFace.startseconds);
				}
				controltimer.isTimerRun = (controltimer.isTimerRun ? false : true);
				log("Timer run: " + controltimer.isTimerRun);
			}
		}


		FocusablePanel {
			id: resetButton;
			anchors.right: parent.right;
			anchors.bottom: parent.bottom;
			opacity: active ? 1 : 0.7;
			color: active ? "#05878A" : "#121212";

			width: 46;
			height: 46;
			enabled: true;
			radius: 23;

			Behavior on color { animation: Animation { duration: 500; } }
			Behavior on borderColor { animation: Animation { duration: 500; } }

			Image {
		 		id: reset;
				source: "apps/Pomodoro/img/reset.png";
				anchors.centerIn: parent;
			}

			onUpPressed: {
				error("up pressed");
				timePanel.setFocus();
			}

			onLeftPressed: {
				error("left pressed");
				controltimerButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				menuList.setFocus();
			}

			onSelectPressed: {
				clockFace.seconds = clockFace.startseconds;
				controltimer.isTimerRun = false;
				log("Timer reset");
			}
		}



		FocusablePanel {
			id: cancelButton;
			anchors.left: parent.left;
			anchors.bottom: parent.bottom;
			opacity: active ? 1 : 0.7;
			color: active ? "#05878A" : "#121212";

			width: 46;
			height: 46;
			enabled: true;
			radius: 23;

			Behavior on color { animation: Animation { duration: 500; } }
			Behavior on borderColor { animation: Animation { duration: 500; } }

			Image {
		 		id: cancel;
				source: "apps/Pomodoro/img/cancel.png";
				anchors.centerIn: parent;
			}

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
				controltimerButton.setFocus();
			}

			onSelectPressed: {
				clockFace.seconds = 0;
				controltimer.isTimerRun = false;
				log("Timer cancel");
			}
		}
  }
}
