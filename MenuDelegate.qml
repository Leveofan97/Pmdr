Item {
	height: 30;

	focus: true;

	Rectangle {
		anchors.verticalCenter: parent.verticalCenter;
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
		width: 100;
		//height: 50;
		//try elide:
		//try numerable
		//contentWidth: 110.5;
    //contentHeight: 110.5;
		text: tr(model.text);
		font: bodyFont;
		color: "#fff";
		wrapMode: WrapAnywhere;
	}
}
