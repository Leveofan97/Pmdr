Item {
	id: casetimer;
	x: 510;
	y: 300;
	visible: true;
	Rectangle {
		id: timercyrcle;

		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;

		color: "#FBE9E7";
		opacity: 1;
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

		Behavior on color { animation : Animation {duration: 2000; } }


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

		Audio {
			id: timefinish;
			source: "Beep.wav";

			onPlaying: {
				log("Beep");
			}
		}

		NotificatorManager {
			id: beep;
			text: "Таймер сработал!";
		}

		Text {
			id: stateTimer;
			anchors.centerIn: parent;
			anchors.bottomMargin: 200;
			property bool flagstate: true; //true - Work; false - Relax state;
			text: (flagstate ? "Рабора" : "Отдых");
			color: "#000000";
			font: titleFont;
			opacity: timePanel.active ? 1 : 0;

			Behavior on opacity { animation: Animation { duration: 250; } }
		}

		Text {
			id: clockFace;
			anchors.centerIn: parent;

			property var defworksec: 1500;
			property var defrelaxsec: 300;

			property int seconds: 1500;
			property int startseconds: 1500;
			property bool selectflag: false;
			property string delimiter: seconds % 60 < 10 ? ":0" : ":";
			text: Math.floor(seconds / 60) + delimiter + seconds % 60;
			color: "#000000";
			font: titleFont;
		}

		function colorprocent() {
				var delitel = (clockFace.startseconds < 0 ? 1 : clockFace.startseconds);
		    var proc = (clockFace.seconds/delitel) * 100;

				//"#64eef9" NOT
				if(proc > 0 && proc < 10){
					timercyrcle.color = "#ff0000";
				}
				if(proc > 10 && proc < 20){
					timercyrcle.color = "#c23d01";
				}
				if(proc > 20 && proc < 30){
					timercyrcle.color = "#a85702";
				}
				if(proc > 30 && proc < 40){
					timercyrcle.color = "#966903";
				}
				if(proc > 40 && proc < 50){
					timercyrcle.color = "#708f04";
				}
				if(proc > 50 && proc < 60){
					timercyrcle.color = "#5ea105";
				}
				if(proc > 60 && proc < 70){
					timercyrcle.color = "#45ba06";
				}
				if(proc > 70 && proc < 80){
					timercyrcle.color = "#26d907";
				}
				if(proc > 80 && proc < 90){
					timercyrcle.color = "#13ec08";
				}
				if(proc > 90 && proc < 100){
					timercyrcle.color = "#00ff08";
				}
		}

		Timer{
			id: timer;
			interval: 1000;
			repeat: true;

			onTriggered: {
				if(clockFace.seconds > 0){
					clockFace.seconds--;
					this.timePanel.colorprocent();
				}else{
					log("Timer finish");
					this.stop();
					controltimer.isTimerRun = false;
					timefinish.play();
					beep.addNotify();
					stateTimer.flagstate = stateTimer.flagstate ? false : true;
					if(stateTimer.flagstate){
						clockFace.startseconds = clockFace.seconds = clockFace.defworksec;
					}else{
						clockFace.startseconds = clockFace.seconds = clockFace.defrelaxsec;
					}
				}
			}
		}

		onDownPressed: {
			if(clockFace.selectflag){
				if(clockFace.seconds > 29){
					clockFace.seconds -= 30;
				}else{
					clockFace.seconds = 0;
					error("Minimum or not selected");
				}

				if(stateTimer.flagstate){
					clockFace.defworksec = clockFace.seconds;
				}else{
					clockFace.defrelaxsec = clockFace.seconds;
				}
			}else{
				controltimerButton.setFocus();
			}
		}

		onSelectPressed: {
			if(!controltimer.isTimerRun){
				clockFace.selectflag = clockFace.selectflag ? false : true;
				clockFace.seconds = stateTimer.flagstate ? clockFace.defworksec : clockFace.defrelaxsec;
				if(!clockFace.selectflag){
					clockFace.startseconds = clockFace.seconds;
				}
				log(clockFace.selectflag);
			}else{
				error("Timer started");
			}
		}

		onLeftPressed: {
			if(clockFace.selectflag){
				if(clockFace.seconds > 299){
					clockFace.seconds -= 300;
				}else{
					clockFace.seconds = 0;
					error("Minimum or not selected");
				}

				if(stateTimer.flagstate){
					clockFace.defworksec = clockFace.seconds;
				}else{
					clockFace.defrelaxsec = clockFace.seconds;
				}
			}else{
				if(!controltimer.isTimerRun){
					stateTimer.flagstate = stateTimer.flagstate ? false : true;
					if(stateTimer.flagstate){
						clockFace.startseconds = clockFace.seconds = clockFace.defworksec;
					}else{
						clockFace.startseconds = clockFace.seconds = clockFace.defrelaxsec;
					}
				}
			}

		}

		onRightPressed: {
			if(clockFace.selectflag){
				if(clockFace.seconds < 5101){
					clockFace.seconds += 300;
				}else{
					clockFace.seconds = 5400;
					error("Maximum or not selected");
				}

				if(stateTimer.flagstate){
					clockFace.defworksec = clockFace.seconds;
				}else{
					clockFace.defrelaxsec = clockFace.seconds;
				}
			}else{
				if(!controltimer.isTimerRun){
					stateTimer.flagstate = stateTimer.flagstate ? false : true;
					if(stateTimer.flagstate){
						clockFace.startseconds = clockFace.seconds = clockFace.defworksec;
					}else{
						clockFace.startseconds = clockFace.seconds = clockFace.defrelaxsec;
					}
				}
			}
		}

		onUpPressed: {
			if(clockFace.selectflag){
				if(clockFace.seconds < 5329){
					clockFace.seconds += 30;
				}else{
					clockFace.seconds = 5400;
					error("Maximum or not selected");
				}

				if(stateTimer.flagstate){
					clockFace.defworksec = clockFace.seconds;
				}else{
					clockFace.defrelaxsec = clockFace.seconds;
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
				if(!controltimer.isTimerRun && clockFace.seconds > 0){
					timePanel.timer.start();
					log("timer started");
				}else{
					timePanel.timer.stop();
					log("timer stop");
				}
				if(clockFace.seconds > 0){
					controltimer.isTimerRun = (controltimer.isTimerRun ? false : true);
				}
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
				clockFace.seconds = stateTimer.flagstate ? clockFace.defworksec : clockFace.defrelaxsec;
				controltimer.isTimerRun = false;
				timePanel.timer.stop();
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
				controltimer.isTimerRun = false;
				timePanel.timer.stop();
				stateTimer.flagstate = stateTimer.flagstate ? false : true;
				clockFace.seconds = stateTimer.flagstate ? clockFace.defworksec : clockFace.defrelaxsec;
				log("Timer cancel");
			}
		}
  }
}
