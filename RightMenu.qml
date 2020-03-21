import "engine.js" as engine;
import "TaskDelegate.qml";
import "Confirmation.qml";
import "EditTask.qml";
import "HistoryList.qml";

Rectangle {
	id: rightMenu;

	width: 250;
	height: 600;

	anchors.verticalCenter: parent.verticalCenter;
	anchors.right: parent.right;

	radius: 10;
	rotation: 90;

	Gradient {
		FocusablePanel {
			id: addTaskButton;

			anchors.left: rightMenu.left;
			anchors.top: rightMenu.top;
			anchors.topMargin: 20;
			anchors.leftMargin: 20;

			width:140;
 		  height:40;
 		  radius: 10;

	    enabled: true;

			Rectangle {
				id: plusAdd;

				anchors.left: rightMenu.left;
				anchors.top: rightMenu.top;
				anchors.topMargin: 20;
				anchors.leftMargin: 20;

				width:140;
				height:40;
				radius: 10;

				Gradient {
					Text {
						anchors.centerIn: parent;

						text: "+ Добавить";
						font: bodyFont;
						color: "#000000";
						pixelSize: 10;
					}

					orientation: Horizonral;

					anchors.verticalCenter: plusAdd.verticalCenter;

					width:140;
					height:40;

					GradientStop {
						position: 0;
						color: addTaskButton.activeFocus ? "#05878A" : "#ffffff";
						Behavior on color { animation : Animation {duration: 300; } }
					}

					GradientStop {
						position: 1;
						color: addTaskButton.activeFocus ? "#ffffff" : "#434445";
						Behavior on color { animation : Animation {duration: 300; } }
					}
				}
			}

			onRightPressed: {
				log("Выбрана синяя кнопка изменения фона");
				blueButton.setFocus();
			}

			onLeftPressed: {
				log("Выбрана кнопка управления сбросом таймера");
				resetButton.setFocus();
			}

			onUpPressed: {
				log("Выбрана кнопка истории");
				historyButton.setFocus();
			}

			onDownPressed: {
				log("Выбран список задач");
				menuList.setFocus();
			}

			onSelectPressed: {
				eForm.visible = true;

				casetimer.opacity = 0.1;
				activeTask.opacity = 0.1;
				musicButton.opacity = 0.1;
				redButton.opacity = 0.1;
				yellowButton.opacity = 0.1;
				blueButton.opacity = 0.1;
				faqButton.opacity = 0.1;

				eForm.curIndex = -1;
				headline.text = "Добавление задачи";
				taskNameEdit.text = "";
				taskContentEdit.text = "";
				taskNameEdit.setFocus();

				log("Добавлена новая задача");
			}
		}



			Text {
				id: history;

				anchors.horizontalCenter: rightMenu.horizontalCenter;
				anchors.bottom: rightMenu.bottom;
				anchors.bottomMargin: 30;

				text: "История...";
				font: bodyFont;
				color: "#ffffff";

				FocusablePanel {
					id: historyButton;
					anchors.horizontalCenter: history.horizontalCenter;
					anchors.bottom: history.bottom;
					anchors.topMargin: 10;

					width:110;
					height:1;

					opacity: active ? 1 : 0;
					color: "#ffffff";

					enabled: true;

					onRightPressed: {
						log("Выбрана синяя кнопка изменения фона");
						blueButton.setFocus();
					}

					onLeftPressed: {
						log("Выбрана кнопка сброса таймера");
						resetButton.setFocus();
					}

					onUpPressed: {
						log("Выбран список задач");
						menuList.setFocus();
					}

					onDownPressed: {
						log("down pressed");
						addTaskButton.setFocus();
					}

					onSelectPressed: {
						log("Выбрана история");
						if (historyList.model.count != 0){
							historyList.model.remove(0, historyList.model.count);
						}

						engine.history.forEach(function (task){
							historyList.model.append( { text: task.name, isdone: task.isDone });
						});
						mainView.color = "#909090";
						switcher.visible = false;
						statSwitcher.visible = true;
						weeklyStats.opacity = 1;
						daylyStats.opacity = 0;
						//historyList.setFocus();
						weeklyBtn.visible = true;
						weeklyBtn.setFocus();
						bar.reset();
						log("Выбрана история");
					}
				}
			}

		orientation: Vertical;

		anchors.verticalCenter: rightMenu.verticalCenter;

		width: 250;
		height: 400;

		GradientStop {
			position: 0;
			color: "#000000";
			Behavior on color { animation : Animation {duration: 1000; } }
		}
		GradientStop {
			position: 0.45;
			color: "#2a2a2a";
			Behavior on color { animation : Animation {duration: 2000; } }
		}
		GradientStop {
			position: 0.55;
			color: "#2a2a2a";
			Behavior on color { animation : Animation {duration: 2000; } }
		}
		GradientStop {
			position: 1;
			color: "#000000";
			Behavior on color { animation : Animation {duration: 1000; } }
		}
	}

	Resource {
		id: resJSON;
		url: "apps/Pomodoro/startTaskList.json";

		onDataChanged: {
		  engine.load(JSON.parse(this.data));
			engine.loadAllStats(JSON.parse(this.data));
		}
	}

	Text {
			id: today;
			property int td;
			anchors.left: rightMenu.left;
			anchors.top: plusAdd.bottom;
			anchors.leftMargin: 20;
			anchors.topMargin: 20;

			text: td;
			font: bodyFont;
			color: "#ffffff";
		}

	ListView {
		id: menuList;

		width: 200;
		height: 400;

		anchors.left: rightMenu.left;
		anchors.top: today.bottom;
		anchors.leftMargin: 20;
		anchors.topMargin: 20;

		focus: true;
		model: ListModel {width: 200;}
		delegate: TaskDelegate {width: 250; }

		onCompleted: {
			engine.tasks.forEach(function (task){
				model.append( { text: task.name, isdone: task.isDone });
			});
		}

		onDownPressed: {
			log("up pressed");
			historyButton.setFocus();
		}

		onUpPressed: {
			log("up pressed");
			addTaskButton.setFocus();
		}

		onLeftPressed: {
			log("left pressed");
			resetButton.setFocus();
		}

		onRightPressed: {
			log("right pressed");
			blueButton.setFocus();
		}

		onRedPressed: {
			log("red1");
			if(model.count != 0){
				confirmationBlock.visible = true;

				casetimer.opacity = 0.1;
				activeTask.opacity = 0.1;
				musicButton.opacity = 0.1;
				redButton.opacity = 0.1;
				yellowButton.opacity = 0.1;
				blueButton.opacity = 0.1;
				faqButton.opacity = 0.1;
				yesBtn.setFocus();
			}
			log("red2");
		}

		onGreenPressed: {
			log("green1");
			model.remove(0, model.count);
			engine.addDoneTask(this.currentIndex);
			engine.tasks.forEach(function (task){
				model.append( { text: task.name, isdone: task.isDone });
			});
			log("green2");
		}

		onYellowPressed: {
			log("yellow1");
			eForm.visible = true;

			casetimer.opacity = 0.1;
			activeTask.opacity = 0.1;
			musicButton.opacity = 0.1;
			redButton.opacity = 0.1;
			yellowButton.opacity = 0.1;
			blueButton.opacity = 0.1;
			faqButton.opacity = 0.1;

			eForm.curIndex = this.currentIndex;
			headline.text = "Редактирование задачи";
			taskNameEdit.text = engine.tasks[this.currentIndex].name;
			taskContentEdit.text = engine.tasks[this.currentIndex].content;
			taskNameEdit.setFocus();

			log("yellow2");
		}

		onBluePressed: {
			log("blue1");

			log("blue2");
		}

		onSelectPressed: {
			taskName.elem = this.currentIndex;
			taskName.text = engine.tasks[this.currentIndex].name;
			taskContent.text = engine.tasks[this.currentIndex].content;
		}

		function removeTask() {
			menuList.model.remove(this.currentIndex,1);
			engine.deleteTask(this.currentIndex);
			if (this.currentIndex == taskName.elem){
				taskName.text = "";
				taskContent.text = "";
			}
		}

	}

	Confirmation{}

	EditTask{}



}
