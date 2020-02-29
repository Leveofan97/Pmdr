Item {
	height: 30;
	focus: true;

	Rectangle {
		width: 20;
		height: 20;
		radius: 10;

		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: parent;

		borderWidth: 2;
		borderColor: parent.activeFocus ? "#fff" : "#000";
		opacity: parent.activeFocus ? 1.0 : 0.4;
		color: parent.activeFocus ? "#fff" : model.isdone === true ? "#0f0" : "#f00";
	}

	Text {
		width: 200;
		anchors.centerIn: parent;

		text: tr(model.text);
		font: bodyFont;
		color: "#fff";
		clip: true;
	}
}
