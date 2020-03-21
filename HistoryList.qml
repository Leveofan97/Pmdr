import "WeeklyStats.qml";
import "DaylyStats.qml";
Item {
	id: statSwitcher;
	visible: true;
	anchors.left: parent.left;
	anchors.top: parent.top;
	anchors.right: parent.right;
	anchors.bottom: parent.bottom;

	Item {
		id: statistics;
		anchors.left: parent.left;
		anchors.top: parent.top;
		anchors.right: historyL.left;

		anchors.topMargin: 30;
		anchors.rightMargin: 30;

		height: 500;

		Rectangle {
			anchors.fill: parent;
			color: "#f0f0f0";
			radius: 15;
			borderWidth: 1;
			borderColor: "#707070";
		}

		SubheadText {
      id: promotion;

			anchors.left: parent.left;
			anchors.top: parent.top;

			anchors.topMargin: 15;
			anchors.leftMargin: 20;

			font: bodyFont;
      text: "График томатов";
      color: "#000";
		}

		SecondaryText {
			id: record;
			property int max;
			anchors.left: parent.left;
			anchors.top: promotion.bottom;

			anchors.topMargin: 5;
			anchors.leftMargin: 20;

			text: "Топ: " + max;
			color: "#505050";
			onCompleted: {
				this.max = engine.weekMaxProgress;
			}
		}

		SecondaryText {
			id: average;
			property string mid;
			anchors.left: record.right;
			anchors.top: promotion.bottom;

			anchors.topMargin: 5;
			anchors.leftMargin: 15;

			text: "Среднее значение: " + mid;
			color: "#505050";
			onCompleted: {
				this.mid = engine.weekMidProgress;
			}
		}

		Rectangle{
			id: line;

			anchors.left: parent.left;
			anchors.right: parent.right;
			anchors.top: record.bottom;

			height: 1;
			anchors.topMargin: 5;
			anchors.leftMargin: 15;
			anchors.rightMargin: 15;

			color: "#505050";
		}

		Rectangle{
			id: buttonSpace;

			anchors.left: parent.left;
			anchors.right: parent.right;
			anchors.top: line.bottom;

			height: 35;
			radius: height/5;

			anchors.topMargin: 5;
			anchors.leftMargin: 225;
			anchors.rightMargin: 225;

			color: "#505050";

			Button{
				id: daylyBtn;

				width: 150;
				height: 50;
				radius: height/5;

				anchors.left: parent.left;
				anchors.top: parent.top;
				anchors.right: weeklyBtn.left;
				anchors.bottom: parent.bottom;

				anchors.bottomMargin: 3;
				anchors.topMargin: 3;
				anchors.leftMargin: 3;
				anchors.rightMargin: 3;

				text: "Dayly";

				onRightPressed: {
					weeklyBtn.setFocus();
				}

				onSelectPressed: {
					weeklyStats.opacity = 0;
					daylyStats.opacity = 1;

					engine.loadDay();
					record.max = engine.weekMaxProgress;
					average.mid = engine.dayProgress.count;
					refreshDay();
					log("weekly");
				}

			}

			Button{
				id: weeklyBtn;

		    width: 150;
		    height: 50;
		    radius: height/5;


				anchors.left: daylyBtn.right;
				anchors.top: parent.top;
				anchors.right: monthlyBtn.left;
				anchors.bottom: parent.bottom;

				anchors.bottomMargin: 3;
		    anchors.topMargin: 3;
		    anchors.leftMargin: 3;
				anchors.rightMargin: 3;

		    text: "Weekly";

				onLeftPressed: {
					daylyBtn.setFocus();
				}

				onRightPressed: {
					monthlyBtn.setFocus();
				}

				onSelectPressed: {
					weeklyStats.opacity = 1;
					daylyStats.opacity = 0;
					engine.loadWeek();
					refreshWeek();
					log("weekly");
				}

				function Today(dateString) {
					let date = new Date(dateString);
					let days = ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"];
				  return days[date.getDay()];
				}

				function refreshWeek() {
					average.mid = engine.weekMidProgress;
					record.max = engine.weekMaxProgress;

			    weeklyStats.st = engine.weekMaxProgress/4;

			    bar.ttextUnderBar = Today(engine.weekProgress[6].day);
			    bar.progress = engine.weekProgress[6].count/engine.weekMaxProgress;
		      bar1.ttextUnderBar = Today(engine.weekProgress[5].day);
		      bar1.progress = engine.weekProgress[5].count/engine.weekMaxProgress;
					bar2.ttextUnderBar = Today(engine.weekProgress[4].day);
			    bar2.progress = engine.weekProgress[4].count/engine.weekMaxProgress;
		      bar3.ttextUnderBar = Today(engine.weekProgress[3].day);
		      bar3.progress = engine.weekProgress[3].count/engine.weekMaxProgress;
					bar4.ttextUnderBar = Today(engine.weekProgress[2].day);
			    bar4.progress = engine.weekProgress[2].count/engine.weekMaxProgress;
		      bar5.ttextUnderBar = Today(engine.weekProgress[1].day);
		      bar5.progress = engine.weekProgress[1].count/engine.weekMaxProgress;
					bar6.ttextUnderBar = Today(engine.weekProgress[0].day);
		      bar6.progress = engine.weekProgress[0].count/engine.weekMaxProgress;
				}

			}

			Button{
				id: monthlyBtn;

		    width: 150;
		    height: 50;
		    radius: height/5;

				anchors.left: weeklyBtn.right;
				anchors.top: parent.top;
				anchors.right: parent.right;
				anchors.bottom: parent.bottom;

				anchors.bottomMargin: 3;
		    anchors.topMargin: 3;
		    anchors.leftMargin: 3;
				anchors.rightMargin: 3;

		    text: "Monthly";

				onLeftPressed: {
					weeklyBtn.setFocus();
				}

			}
		}

		DaylyStats{}
		WeeklyStats{}

	}

	Item {
		  id: activeTask2;
			anchors.left: parent.left;
			anchors.top: statistics.bottom;
			anchors.right: historyL.left;
			anchors.bottom: parent.bottom;
			anchors.topMargin: 15;
			anchors.rightMargin: 30;
			anchors.bottomMargin: 30;

			Rectangle {
				anchors.fill: parent;
				color: "#f0f0f0";
				radius: 15;
				borderWidth: 1;
				borderColor: "#707070";
			}
	}

	Item {
		id: historyL;
	  focus: true;
		//visible: false;
		width: 250;
		height: 600;

		anchors.verticalCenter: parent.verticalCenter;
		anchors.right: parent.right;

	  Rectangle {
			anchors.fill: parent;
			color: "#000";
			opacity: 0.7;
			radius: 8;
			borderWidth: 1;
			borderColor: "#f55";
		}

	  ListView {
	    id: historyList;

	    width: 200;
	    height: 400;

	    anchors.centerIn: parent;

	    focus: true;
	    model: ListModel {width: 200;}
	    delegate: TaskDelegate {width: 250; }

	    // onCompleted: {
	    //   engine.history.forEach(function (task){
	    //     model.append( { text: task.name, isdone: task.isDone });
	    //   });
	    // }

	    onGreenPressed: {
	      progressBarItem.reset();
	    }

	    onRedPressed: {
				mainView.color = "#010101";
				switcher.visible = true;
	      historyButton.setFocus();
	      stat.visible = false;
	    }

	    onSelectPressed: {
	      taskName.elem = this.currentIndex;
	      taskName.text = engine.history[this.currentIndex].name;
	      taskContent.text = engine.history[this.currentIndex].content;
	    }

	  }

	  onCompleted: {

	  }

	}
}
