import "WeeklyStats.qml";
import "DaylyStats.qml";
import "MonthlyStats.qml";

Item {
	id: statSwitcher;
	visible: false;
	anchors.left: parent.left;
	anchors.top: parent.top;
	anchors.right: parent.right;
	anchors.bottom: parent.bottom;

	Item {
		id: statistics;
		anchors.left: parent.left;
		anchors.top: parent.top;
		anchors.right: historyL.left;

		anchors.topMargin: 15;
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

				// onBackPressed: {
				// 	mainView.color = "#010101";
				// 	switcher.visible = true;
		    //   historyButton.setFocus();
		    //   statSwitcher.visible = false;
		    // }

				onSelectPressed: {
					weeklyStats.opacity = 0;
					daylyStats.opacity = 1;
					monthlyStats.opacity = 0;

					engine.loadDay();
					record.max = engine.weekMaxProgress;
					average.mid = engine.dayProgress.count;
					refreshDay();
					log("dayly");
				}

				function refreshDay(){
					dayBar.ttextUnderBar = engine.dayProgress.day;
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

				// onBackPressed: {
				// 	mainView.color = "#010101";
				// 	switcher.visible = true;
		    //   historyButton.setFocus();
		    //   statSwitcher.visible = false;
		    // }

				onSelectPressed: {
					weeklyStats.opacity = 1;
					daylyStats.opacity = 0;
					monthlyStats.opacity = 0;
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

			    bar.ttextUnderBar = weeklyBtn.Today(engine.weekProgress[6].day);
			    bar.progress = engine.weekProgress[6].count/engine.weekMaxProgress;
		      bar1.ttextUnderBar = weeklyBtn.Today(engine.weekProgress[5].day);
		      bar1.progress = engine.weekProgress[5].count/engine.weekMaxProgress;
					bar2.ttextUnderBar = weeklyBtn.Today(engine.weekProgress[4].day);
			    bar2.progress = engine.weekProgress[4].count/engine.weekMaxProgress;
		      bar3.ttextUnderBar = weeklyBtn.Today(engine.weekProgress[3].day);
		      bar3.progress = engine.weekProgress[3].count/engine.weekMaxProgress;
					bar4.ttextUnderBar = weeklyBtn.Today(engine.weekProgress[2].day);
			    bar4.progress = engine.weekProgress[2].count/engine.weekMaxProgress;
		      bar5.ttextUnderBar = weeklyBtn.Today(engine.weekProgress[1].day);
		      bar5.progress = engine.weekProgress[1].count/engine.weekMaxProgress;
					bar6.ttextUnderBar = weeklyBtn.Today(engine.weekProgress[0].day);
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

				onRightPressed: {
					historyList.setFocus();
				}

				// onBackPressed: {
				// 	mainView.color = "#010101";
				// 	switcher.visible = true;
		    //   historyButton.setFocus();
		    //   statSwitcher.visible = false;
		    // }

				onSelectPressed:{
					weeklyStats.opacity = 0;
					daylyStats.opacity = 0;
					monthlyStats.opacity = 1;
					engine.loadMonth();
					refreshMonth();
					log("monthly");
				}

				function Today(dateString) {
					let date = new Date(dateString);
					let days = ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"];
					return days[date.getDay()];
				}

				function refreshMonth() {
					average.mid = engine.monthMidProgress;
					record.max = engine.monthMaxProgress;

			    monthlyStats.st = engine.monthMaxProgress/4;

			    mbar.ttextUnderBar = Today(engine.monthProgress[30].day);
			    mbar.progress = engine.monthProgress[30].count/engine.monthMaxProgress;
		      mbar1.ttextUnderBar = Today(engine.monthProgress[29].day);
		      mbar1.progress = engine.monthProgress[29].count/engine.monthMaxProgress;
					mbar2.ttextUnderBar = Today(engine.monthProgress[28].day);
			    mbar2.progress = engine.monthProgress[28].count/engine.monthMaxProgress;
		      mbar3.ttextUnderBar = Today(engine.monthProgress[27].day);
		      mbar3.progress = engine.monthProgress[27].count/engine.monthMaxProgress;
					mbar4.ttextUnderBar = Today(engine.monthProgress[26].day);
			    mbar4.progress = engine.monthProgress[26].count/engine.monthMaxProgress;
		      mbar5.ttextUnderBar = Today(engine.monthProgress[25].day);
		      mbar5.progress = engine.monthProgress[25].count/engine.monthMaxProgress;
					mbar6.ttextUnderBar = Today(engine.monthProgress[24].day);
		      mbar6.progress = engine.monthProgress[24].count/engine.monthMaxProgress;
					mbar7.ttextUnderBar = Today(engine.monthProgress[23].day);
			    mbar7.progress = engine.monthProgress[23].count/engine.monthMaxProgress;
		      mbar8.ttextUnderBar = Today(engine.monthProgress[22].day);
		      mbar8.progress = engine.monthProgress[22].count/engine.monthMaxProgress;
					mbar9.ttextUnderBar = Today(engine.monthProgress[21].day);
			    mbar9.progress = engine.monthProgress[21].count/engine.monthMaxProgress;
					mbar10.ttextUnderBar = Today(engine.monthProgress[20].day);
			    mbar10.progress = engine.monthProgress[20].count/engine.monthMaxProgress;
		      mbar11.ttextUnderBar = Today(engine.monthProgress[19].day);
		      mbar11.progress = engine.monthProgress[19].count/engine.monthMaxProgress;
					mbar12.ttextUnderBar = Today(engine.monthProgress[18].day);
			    mbar12.progress = engine.monthProgress[18].count/engine.monthMaxProgress;
		      mbar13.ttextUnderBar = Today(engine.monthProgress[17].day);
		      mbar13.progress = engine.monthProgress[17].count/engine.monthMaxProgress;
					mbar14.ttextUnderBar = Today(engine.monthProgress[16].day);
		      mbar14.progress = engine.monthProgress[16].count/engine.monthMaxProgress;
					mbar15.ttextUnderBar = Today(engine.monthProgress[15].day);
			    mbar15.progress = engine.monthProgress[15].count/engine.monthMaxProgress;
		      mbar16.ttextUnderBar = Today(engine.monthProgress[14].day);
		      mbar16.progress = engine.monthProgress[14].count/engine.monthMaxProgress;
					mbar17.ttextUnderBar = Today(engine.monthProgress[13].day);
			    mbar17.progress = engine.monthProgress[13].count/engine.monthMaxProgress;
		      mbar18.ttextUnderBar = Today(engine.monthProgress[12].day);
		      mbar18.progress = engine.monthProgress[12].count/engine.monthMaxProgress;
					mbar19.ttextUnderBar = Today(engine.monthProgress[11].day);
			    mbar19.progress = engine.monthProgress[11].count/engine.monthMaxProgress;
		      mbar20.ttextUnderBar = Today(engine.monthProgress[10].day);
		      mbar20.progress = engine.monthProgress[10].count/engine.monthMaxProgress;
					mbar21.ttextUnderBar = Today(engine.monthProgress[9].day);
		      mbar21.progress = engine.monthProgress[9].count/engine.monthMaxProgress;
					mbar22.ttextUnderBar = Today(engine.monthProgress[8].day);
		      mbar22.progress = engine.monthProgress[8].count/engine.monthMaxProgress;
					mbar23.ttextUnderBar = Today(engine.monthProgress[7].day);
		      mbar23.progress = engine.monthProgress[7].count/engine.monthMaxProgress;
					mbar24.ttextUnderBar = Today(engine.monthProgress[6].day);
		      mbar24.progress = engine.monthProgress[6].count/engine.monthMaxProgress;
					mbar25.ttextUnderBar = Today(engine.monthProgress[5].day);
		      mbar25.progress = engine.monthProgress[5].count/engine.monthMaxProgress;
					mbar26.ttextUnderBar = Today(engine.monthProgress[4].day);
		      mbar26.progress = engine.monthProgress[4].count/engine.monthMaxProgress;
					mbar27.ttextUnderBar = Today(engine.monthProgress[3].day);
		      mbar27.progress = engine.monthProgress[3].count/engine.monthMaxProgress;
					mbar28.ttextUnderBar = Today(engine.monthProgress[2].day);
		      mbar28.progress = engine.monthProgress[2].count/engine.monthMaxProgress;
					mbar29.ttextUnderBar = Today(engine.monthProgress[1].day);
		      mbar29.progress = engine.monthProgress[1].count/engine.monthMaxProgress;
					mbar30.ttextUnderBar = Today(engine.monthProgress[0].day);
		      mbar30.progress = engine.monthProgress[0].count/engine.monthMaxProgress;

				}

			}
		}

		DaylyStats{}
		WeeklyStats{}
		MonthlyStats{}

	}

	Item {
		  id: activeTaskH;
			anchors.left: parent.left;
			anchors.top: statistics.bottom;
			anchors.right: historyL.left;
			anchors.bottom: parent.bottom;
			anchors.topMargin: 15;
			anchors.rightMargin: 30;
			anchors.bottomMargin: 15;

			Rectangle {
				anchors.fill: parent;
				color: "#f0f0f0";
				radius: 15;
				borderWidth: 1;
				borderColor: "#707070";
			}

			SubheadText {
					id: taskNameH;

					property int elem: 0;

					width: 600;
					anchors.horizontalCenter: parent.horizontalCenter;
					anchors.top: parent.top;
					anchors.topMargin: 5;

					horizontalAlignment: AlignHCenter;
					text: "Здравствуйте!";
					color: "#000";
					wrapMode: WordWrap;

				SecondaryText {
					id: taskContentH;
					width: 900;
					anchors.horizontalCenter: taskNameH.horizontalCenter;
					anchors.top: taskNameH.bottom;

					horizontalAlignment: AlignHCenter;
					text: "Тут находится история выполненых задач и графики!";
					color: "#000";
					wrapMode: WordWrap;

				}
			}

	}

	Item {
		id: historyL;
	  focus: true;
		//visible: false;
		width: 250;
		height: 630;

		anchors.verticalCenter: parent.verticalCenter;
		anchors.right: parent.right;

	  Rectangle {
			anchors.fill: parent;
			color: "#000";
			opacity: 0.7;
			radius: 15;
			borderWidth: 2;
			borderColor: historyList.activeFocus? "#f00":"#f55";
		}

	  ListView {
	    id: historyList;

	    width: 200;
	    height: 400;

	    anchors.centerIn: parent;

	    focus: true;
	    model: ListModel {width: 200;}
	    delegate: TaskDelegate {width: 250; }

	    onGreenPressed: {
	      progressBarItem.reset();
	    }

			onLeftPressed: {
				monthlyBtn.setFocus();
			}



	    onSelectPressed: {
	      taskNameH.elem = this.currentIndex;
	      taskNameH.text = engine.history[this.currentIndex].name;
	      taskContentH.text = engine.history[this.currentIndex].content;
	    }

	  }
	}
	onBackPressed: {
		mainView.color = "#010101";
		switcher.visible = true;
		historyButton.setFocus();
		statSwitcher.visible = false;
	}
}
