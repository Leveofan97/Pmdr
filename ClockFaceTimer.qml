import "TimersFunctions.js" as TimerFunc;
import "engine.js" as engine;
import controls.Player;

Item {
	id: casetimer;
	x: 510;
	y: 300;
	visible: true;

	Player {
		id: beepaudio;
		hideSpinner: true;
		disableControls: true;
		duration: 5000;
	}

	NotificatorManager {
		id: beep;
		text: "Таймер сработал!";
	}

	Rectangle {
		id: timercyrcle;

		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;

		color: "#FBE9E7";
		opacity: 1;
    width: 350;
		height: 350;
		radius: 175;
		borderWidth: 2;
		borderColor: "#000";
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

			Text {
				id: stateTimer;
				anchors.centerIn: parent;
				anchors.bottomMargin: 200;
				property var flagstate: 0; //0 - Work; 1 - Relax state; 2 - big break;
				text: (flagstate == 0 ? "Работа" : (flagstate == 1 ? "Отдых" : "Перерыв"));
				color: "#000000";
				font: titleFont;
				opacity: timePanel.active ? 1 : 0.4;

				Behavior on opacity { animation: Animation { duration: 250; } }
			}

			Text {
				id: clockFace;
				anchors.centerIn: parent;

				property var defworksec: 1500;
				property var defrelaxsec: 300;
				property var defbigrelsxsec: 900;

				property int seconds: defworksec;
				property int startseconds: 1500;
				property bool selectflag: false;
				property string delimiter: seconds % 60 < 10 ? ":0" : ":";
				text: Math.floor(seconds / 60) + delimiter + seconds % 60;
				color: "#000000";
				font: titleFont;
			}

			Timer{
				id: timer;
				interval: 1000;
				repeat: true;

				property var countbreak: 0;
				property var flagURL: 0;
				property var countaudio: TimerFunc.audiobeep.length;

				onTriggered: {
					if(clockFace.seconds > 0){
						clockFace.seconds--;
						TimerFunc.colorprocent();
					}else{
						log("Timer finish");
						TimerFunc.TimerStop();
						beep.addNotify();
						beepaudio.abort();
						beepaudio.playUrl(TimerFunc.audiobeep[flagURL]);
						if(!stateTimer.flagstate){
							engine.todayCountIncrement();
						}
						TimerFunc.ChangeTimerState(TimerFunc.CounterBreak());
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
				property string control: stateTimer.flagstate ?
																			(this.isTimerRun ? "cancel" : "play") :
																				(this.isTimerRun ? "pause" : "play");
				source: "apps/Pomodoro/img/"+control+".png";
				anchors.centerIn: parent;
			}

			onLeftPressed: {
				blueButton.setFocus();
			}

			onRightPressed: {
				resetButton.setFocus();
			}

			onSelectPressed: {
				if(!controltimer.isTimerRun && clockFace.seconds > 0){
					timePanel.timer.start();
					log("start");
				}else{
					if(stateTimer.flagstate){
						TimerFunc.TimerStop();
						TimerFunc.ChangeTimerState(TimerFunc.CounterBreak());
						isTimerRun = false;
						log("Time skip");
					}else{
						timePanel.timer.stop();
						log("pause");
					}
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

			onLeftPressed: {
				controltimerButton.setFocus();
			}

			onRightPressed: {
				menuList.setFocus();
			}

			onSelectPressed: {
				TimerFunc.TimerStop();
				log("Timer reset");
			}
		}
  }
}
