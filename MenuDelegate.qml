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
	Text {
		anchors.centerIn: parent;
		width: 200;
		height: 30;
		//horizontalAlignment: AlignHCenter;
		//try numerable
		//contentWidth: 200.5;
    //contentHeight: 30.5;
		text: tr(model.text); // +",,,"
		font: bodyFont;
		color: "#fff";
		maximumLineCount: 1;
		elide: ElideRight;
		//wrapMode: WordWrap;
		//wrapMode: WrapAnywhere;
	}
}
