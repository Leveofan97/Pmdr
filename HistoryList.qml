Item {
	id: historyL;
  focus: true;
	visible: false;
	width: 250;
	height: 600;

	anchors.verticalCenter: parent.verticalCenter;
	anchors.right: parent.right;

  Rectangle {
		anchors.fill: parent;
		color: "#000";
		opacity: 0.7;
		radius: 8;
		borderWidth: 1;
		borderColor: "#f55";
	}

  ListView {
    id: historyList;

    width: 200;
    height: 400;

    anchors.centerIn: parent;

    focus: true;
    model: ListModel {width: 200;}
    delegate: TaskDelegate {width: 250; }

    onCompleted: {
      engine.history.forEach(function (task){
        model.append( { text: task.name, isdone: task.isDone });
      });
    }

    onGreenPressed: {
      engine.history.forEach(function (task){
        historyList.model.append( { text: task.name, isdone: task.isDone });
      });
    }

    onRedPressed: {
			mainView.color = "#010101";
			switcher.visible = true;
      historyButton.setFocus();
      historyL.visible = false;
    }

    onSelectPressed: {
      taskName.elem = this.currentIndex;
      taskName.text = engine.history[this.currentIndex].name;
      taskContent.text = engine.history[this.currentIndex].content;
    }

  }

  onCompleted: {

  }

}
