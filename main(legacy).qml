import controls.Button;
import controls.Edit;
import controls.SelectionGradient;
import controls.Utils;
import controls.HighlightListView;
import controls.FocusablePanel;
import controls.Panel;
import "MenuDelegate.qml";
// import controls.FloatingText;
//import controls.ProgressBar;
Application {

	id: qwerty;
	color: "#3383CC";

	Rectangle {
			id: circleClock;
			width: 360;
			height: 360;
			anchors.centerIn: parent;
			color: "#FF6259";
			radius: 160;
			borderWidth: 5;
			borderColor: "#fff44f";

			ListView {
			id: menuList;

			width: 390;
			height: 270;

			anchors.centerIn: parent;

			focus: true;

			model: ListModel {
				ListElement { text: "Start playing alone"; }
				ListElement { text: "Start playing together"; }
				// ListElement { Checkbox {
				// 	id: fir;
				// 	anchors.centerIn: parent;
				// 	text: "WTF";
				// 	font: "#123456";
				// 	textColor: "#654321";
				// 	iconWidth: 15;
				// 	handleNavigationKeys: true;
				// }}
				// ListElement { Checkbox {
				// 	id: dir;
				// 	anchors.top: parent.top;
				// 	text: "WTF2";
				// 	font: "#fff";
				// 	textColor: "#000";
				// 	iconWidth: 15;
				// 	handleNavigationKeys: false;
				// }}
				// ListElement { Checkbox {
				// 	id: tir;
				// 	anchors.bottom: parent.bottom;
				// 	text: "WTF3";
				// 	font: "#006";
				// 	textColor: "#600";
				// 	iconWidth: 15;
				// 	handleNavigationKeys: false;
				// }}
			}


				delegate: MenuDelegate {width: 300;}
				onSelectPressed: {
					switch (this.currentIndex)
					{
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

		// onUpPressed: { // работает
		// 	error("wft");
		// }

		// Text {
		// 	id: word;
		// 	anchors.horizontalCenter: parent.horizontalCenter;
		// 	anchors.topMargin: 10;
		// 	anchors.top: parent.top;
		// 	text: "hello world!";
		// 	color: "#00ff00"
		// }



		// RadialGradient {
		//     centerX: 50; centerY: 50
		//     centerRadius: 100
		//     focalX: centerX; focalY: centerY
		//     GradientStop { position: 0; color: "#123" }
		//     GradientStop { position: 0.2; color: "#321" }
		//     GradientStop { position: 0.4; color: "#231" }
		//     GradientStop { position: 0.6; color: "#213" }
		//     GradientStop { position: 1; color: "#333" }
		// }


			// RadialGradient {
			// 	anchors.fill: parent;
			// 	gradient: Gradient {
			// 		GradientStop { position: 0.0; color: "#ffffff"; }
			// 		GradientStop { position: 1.0; color: "#000000"; }
			// 	}
			// }



		// Gradient {
		// 	anchors.left: parent.left;
		// 	anchors.top: parent.top;
		// 	anchors.right: parent.right;
		// 	anchors.bottom: parent.bottom;
		// 	// centerX: 50;
		// 	// centerY: 50;
		// 	// centerRadius: 100;
		// 	// focalX: centerX;
		// 	// focalY: centerY;
		// 	orientation: Vertical;
		// 	GradientStop {
		// 		position: 0;
		// 		color: "#ffffff";
		//
		// 	}
		// 	GradientStop {
		// 		position: 1;
		// 		color: "#000000";
		//
		// 	}
		// }

  onStarted: {}
}
