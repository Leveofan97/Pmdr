Item {
	height: 30;

	focus: true;

	Rectangle {
		anchors.left: parent;
		//anchors.rightMargin: 60;
		width: 20;
		height: 20;
		radius: 10;
		borderWidth: 2;
		borderColor: parent.activeFocus ? "#fff" : "#000";
		opacity: parent.activeFocus ? 1.0 : 0.2;
		color: parent.activeFocus ? "#fff" : "#fff";


	}
	TitleText {
		anchors.centerIn: parent;
		text: tr(model.text);
		font: bodyFont;
		color: "#fff";
	}
}
