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
					color: "#ffffff";
					Behavior on color { animation : Animation {duration: 500; } }
				}
				GradientStop {
					position: 1;
					color: "#434445";
					Behavior on color { animation : Animation {duration: 500; } }
				}
			}
		}

		Text {
			anchors.horizontalCenter: menu.horizontalCenter;
			anchors.bottom: menu.bottom;
			anchors.bottomMargin: 15;

			text: "История...";
			font: bodyFont;
			color: "#ffffff";
		}

		orientation: Vertical;

		anchors.verticalCenter: menu.verticalCenter;

		width:200;
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

	ListView {
		id: menuList;

		width: 200;
		height: 400;

		anchors.leftMargin: 50;
		anchors.centerIn: parent;

		focus: true;

		model: ListModel {
			ListElement { text: "Task1"; }
			ListElement { text: "Task2"; }
			ListElement { text: "Task3"; }
			ListElement { text: "Task4"; }
			ListElement { text: "Task5"; }
			ListElement { text: "Task6"; }
			ListElement { text: "Task7"; }
			ListElement { text: "Task8"; }
			ListElement { text: "Task9"; }
			ListElement { text: "Task10"; }
			ListElement { text: "Task11"; }
			ListElement { text: "Task12"; }
			ListElement { text: "Task13"; }
		}

		delegate: MenuDelegate {width: 150;}

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
