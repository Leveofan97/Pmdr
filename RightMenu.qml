import "engine.js" as engine;

Rectangle {
	id: menu;

	width: 250;
	height: 600;

	anchors.verticalCenter: parent.verticalCenter;
	anchors.right: parent.right;

	radius: 10;
	rotation: 90;
	//color: "#CCC0B2";

	Gradient {
		FocusablePanel {
			id: addTaskButton;

			anchors.left: menu.left;
			anchors.top: menu.top;
			anchors.topMargin: 20;
			anchors.leftMargin: 20;

			width:140;
 		  height:40;
 		  radius: 10;

	    enabled: true;

			Rectangle {
				id: but;

				anchors.left: menu.left;
				anchors.top: menu.top;
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

					anchors.verticalCenter: but.verticalCenter;

					width:140;
					height:40;

					GradientStop {
						position: 0;
						color: addTaskButton.activeFocus ? "#434445" : "#ffffff";
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
				menuList.model.append({ text: "New Task" });
				engine.addTask("Content qwerty");
				log("Добавлена новая задача");
			}
		}



			Text {
				id: statist;
				anchors.horizontalCenter: menu.horizontalCenter;
				anchors.bottom: menu.bottom;
				anchors.bottomMargin: 30;
				//anchors.leftMargin: 20;


				text: "История...";
				font: bodyFont;
				color: "#ffffff";

				FocusablePanel {
					id: historyButton;
					anchors.horizontalCenter: statist.horizontalCenter;
					anchors.bottom: statist.bottom;
					anchors.topMargin: 10;
					//anchors.leftMargin: 20;

					width:110;
					height:1;
					//radius: 10;
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
						error("down pressed");
						addTaskButton.setFocus();
					}

					onSelectPressed: {
						log("Выбрана история");
					}
				}
			}



		orientation: Vertical;

		anchors.verticalCenter: menu.verticalCenter;

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
			//color: "#859398";
			Behavior on color { animation : Animation {duration: 2000; } }
		}
		GradientStop {
			position: 0.55;
			color: "#2a2a2a";
			//color: "#859398";
			Behavior on color { animation : Animation {duration: 2000; } }
		}
		GradientStop {
			position: 1;
			color: "#000000";
			//color: "#859398";
			Behavior on color { animation : Animation {duration: 1000; } }
		}
	}

	Resource {
		id: resJSON;
		url: "apps/Pomodoro/taskList.json";

		onDataChanged: {
		  engine.load(JSON.parse(this.data));
		}

		// onCompleted: {
		// 	menuList.load(JSON.parse(this.data));
		// 	error(engine.tasks[1].name);
		// }

	}

	ListView {
		id: menuList;

		width: 200;
		height: 400;

		//anchors.leftMargin: 50;
		anchors.centerIn: parent;

		focus: true;

		model: ListModel {}

		delegate: MenuDelegate {width: 150;}

		onCompleted: {
// TODO: добавить другие параметры из json
			engine.tasks.forEach(function (task){
				model.append( { text: task.name });
			});
		}

		onDownPressed: {
			error("up pressed");
			historyButton.setFocus();
		}

		onUpPressed: {
			error("up pressed");
			addTaskButton.setFocus();
		}

		onLeftPressed: {
			error("left pressed");
			resetButton.setFocus();
		}

		onRightPressed: {
			error("right pressed");
			blueButton.setFocus();
		}

		onRedPressed: {
			error("red1");
			error(model.count);
			if(model.count != 0){model.remove(this.currentIndex,1);
				engine.deleteTask(this.currentIndex);
				if (this.currentIndex == taskName.elem){
					taskName.text = "";
					taskContent.text = "";
				}
			}
			error("red2");
		}

		onGreenPressed: {
			error("green1");
			// engine.saveTasks();
			// engine.tasks[1].name = "sosi";
			// engine.loadf();
			// engine.tasks.forEach(function (task){
			// 	model.append( { text: task.name });
			// });


			//engine.createFile();

			error("green2");
		}

		onYellowPressed: {
			error("yellow1");
			model.set(1,{text: "123"});
			engine.tasks[1].name = "123";
			error("yellow2");
		}

		onSelectPressed: {
			// switch (this.currentIndex) {
			// case 0:
				taskName.elem = this.currentIndex;
				taskName.text = engine.tasks[this.currentIndex].name;
				taskContent.text = engine.tasks[this.currentIndex].content;
			// 	error("0");
			// 	break;
			// case 1:
			// 	error("1");
			// 	break;
			// case 2:
			// 	error("2");
			// 	break;
			// }
		}
	}

}
