Rectangle {
	id: progressBarItem;
	property bool active: true;
	property real progress: 0; // 0..1
	property Color barColor;
	property int animationDuration: 800;

	width: 50;
	color: active ? colorTheme.focusColor : "#000000";
	barColor: colorTheme.activeFocusTop;
	clip: true;
	radius: width / 50;

	Rectangle {
		id: filledArea;
		//anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.bottom: parent.bottom;
		anchors.right: parent.right;
		height: parent.height * progressBarItem.progress;
		color: progressBarItem.active ? progressBarItem.barColor : colorTheme.borderColor;
		radius: progressBarItem.radius;

		Behavior on opacity { animation: Animation { duration: 500; } }
		Behavior on height { id: filledAreaWidthAnim; animation: Animation { duration: progressBarItem.animationDuration; } }
	}

	reset: { filledAreaWidthAnim.complete(); }
}
