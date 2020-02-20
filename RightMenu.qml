import "engine.js" as engine;

Rectangle {
	id: menu;

	width: 200;
	height: 600;

	anchors.verticalCenter: parent.verticalCenter;
	anchors.right: parent.right;

	radius: 10;
	rotation: 90;
	//color: "#CCC0B2";

	Gradient {
		FocusablePanel {
			id: addTaskButton;

			anchors.horizontalCenter: menu.horizontalCenter;
			anchors.top: menu.top;
			anchors.topMargin: 20;

			width:140;
 		  height:40;
 		  radius: 10;

	    enabled: true;

			Rectangle {
				id: but;

				anchors.horizontalCenter: menu.horizontalCenter;
				anchors.top: menu.top;
				anchors.topMargin: 20;

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
				error("right pressed");
				blueButton.setFocus();
			}

			onLeftPressed: {
				error("left pressed");
				resetButton.setFocus();
			}

			onUpPressed: {
				error("up pressed");
				historyButton.setFocus();
			}

			onDownPressed: {
				error("down pressed");
				menuList.setFocus();
			}

			onSelectPressed: {
				error("Add Task!");
			}
		}



			Text {
				id: statist;
				anchors.horizontalCenter: menu.horizontalCenter;
				anchors.bottom: menu.bottom;
				anchors.bottomMargin: 30;


				text: "История...";
				font: bodyFont;
				color: "#ffffff";

				FocusablePanel {
					id: historyButton;
					anchors.horizontalCenter: statist.horizontalCenter;
					anchors.bottom: statist.bottom;
					anchors.topMargin: 10;

					width:110;
					height:1;
					//radius: 10;
					opacity: active ? 1 : 0;
					color: "#ffffff";

					enabled: true;

					onRightPressed: {
						error("right pressed");
						blueButton.setFocus();
					}

					onLeftPressed: {
						error("left pressed");
						resetButton.setFocus();
					}

					onUpPressed: {
						error("up pressed");
						menuList.setFocus();
					}

					onDownPressed: {
						error("down pressed");
						addTaskButton.setFocus();
					}

					onSelectPressed: {
						error("History!");
					}
				}
			}



		orientation: Vertical;

		anchors.verticalCenter: menu.verticalCenter;

		width: 200;
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
		id: f123;
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

		anchors.leftMargin: 50;
		anchors.centerIn: parent;

		focus: true;

		model: ListModel {}

		delegate: MenuDelegate {width: 150;}

		onCompleted: {
// TODO: добавить другие параметры из json
			engine.tasks.forEach(function (task){
				model.append( { text: task.name });
			})
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

		onSelectPressed: {
			switch (this.currentIndex) {
			case 0:
				error("0");
				break;
			case 1:
				error("1");
				break;
			case 2:
				error("2");
				break;
			}
		}
	}

}
