import controls.Edit;
import "KeyboardModel.qml";
import "KeyItem.qml";

Item {
	id: eForm;
	focus: true;
	visible: false;
	property int curIndex;
  anchors.horizontalCenter: mainView.horizontalCenter;
  anchors.verticalCenter: mainView.verticalCenter;
	height: 300;
	width: 400;

	Rectangle {
		anchors.fill: parent;
		color: "#000";
		radius: 8;
		borderWidth: 1;
		borderColor: "#555";
		opacity: 0.7;
	}

	Text {
		id: headline;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: 5;
		anchors.top: parent.top;

		text: "";
		font: bodyFont;
		color: "#fff";
	}

	SecondaryText {
		id: taskNameLine;
		anchors.top: headline.bottom;
		anchors.left: parent.left;
		anchors.margins: 15;

		text: "Task Name:";
		color: "#fff";
	}

	Edit {
		id: taskNameEdit;
		height: 30;
		anchors.top: headline.bottom;
		anchors.left: taskNameLine.right;
		anchors.right: parent.right;
		anchors.margins: 10;
		focus: true;
		borderColor: activeFocus ? "#FFAA33" : "#FFF";

		onDownPressed: {
			taskContentEdit.setFocus();
		}

    onCompleted: {
      editText.wrapMode = "WordWrap";
    }
	}

  Edit {
    id: taskContentEdit;
    anchors.top: taskNameEdit.bottom;
    anchors.bottom: saveButtom.top;
    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.margins: 10;
    focus: true;
		borderColor: activeFocus ? "#FFAA33" : "#FFF";

    onUpPressed: {
      taskNameEdit.setFocus();
    }

    onDownPressed: {
      saveButtom.setFocus();
    }

    onCompleted: {
      editText.wrapMode = "WordWrap";
    }

  }

	NotificatorManager {
		id: taskError;
		text: "TaskName should not be empty!";
	}


	Row {
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		anchors.margins: 10;
		spacing: 4;

    KeyItem {
			id: saveButtom;
			width: height * 6.75 + parent.spacing;
			text: "Save";
			borderColor: activeFocus ? colorTheme.activeBorderColor : "#22AB00";

			onUpPressed: {
        taskContentEdit.setFocus();
      }

			onRightPressed: {
				cancelButton.setFocus();
			}

			onSelectPressed: {
				taskNameEdit.text = taskNameEdit.text.trim();
				if(eForm.curIndex === -1){
					if(taskNameEdit.text.length > 0){
						eForm.visible = false;
						addTaskButton.setFocus();
						casetimer.opacity = 1;
						activeTask.opacity = 1;
						musicButton.opacity = 1;
						redButton.opacity = 1;
						yellowButton.opacity = 1;
						blueButton.opacity = 1;
						faqButton.opacity = 1;

						let data = {
							name: taskNameEdit.text,
	            isDone: false,
	            difficulty: 1,
	            content: taskContentEdit.text
						};

						menuList.model.remove(0, menuList.model.count);
						engine.addTask(data);
						engine.tasks.forEach(function (task){
							menuList.model.append( { text: task.name, isdone: task.isDone });
						});

					}
					
					else {
						taskError.addNotify();
					}
				}
				else {
					if(taskNameEdit.text.length > 0){
						eForm.visible = false;
						addTaskButton.setFocus();
						casetimer.opacity = 1;
						activeTask.opacity = 1;
						musicButton.opacity = 1;
						redButton.opacity = 1;
						yellowButton.opacity = 1;
						blueButton.opacity = 1;
						faqButton.opacity = 1;
						menuList.model.set(eForm.curIndex, { text: taskNameEdit.text , isdone: false });
						engine.tasks[eForm.curIndex] = {
							name: taskNameEdit.text,
	            isDone: false,
	            difficulty: 1,
	            content: taskContentEdit.text
						};
					}
					else {
						taskError.addNotify();
					}
				}

			}
		}

    KeyItem {
      id: cancelButton;
      text: "Cancel";
      width: height * 6.75 + parent.spacing;
      borderColor: activeFocus ? colorTheme.activeBorderColor : "#EA2022";

      onUpPressed: {
        taskContentEdit.setFocus();
      }

			onLeftPressed: {
				saveButtom.setFocus();
			}

      onSelectPressed: {
				eForm.visible = false;
				addTaskButton.setFocus();
				casetimer.opacity = 1;
				activeTask.opacity = 1;
				musicButton.opacity = 1;
				redButton.opacity = 1;
				yellowButton.opacity = 1;
				blueButton.opacity = 1;
				faqButton.opacity = 1;
      }

    }


	show: {
		eForm.visible = true;
		taskNameEdit.text = "";
		taskNameEdit.setFocus();
	}


	onCompleted: {}

  }

	onKeyPressed: {
		log("key pressed " + key);
		if (!visible)
			return false;
		log("key pressed " + key);

		if (key == "Red") {
			log("Red");
		} else if (key == "Green") {
			log("Green");
		} else return false;

		return true;
	}

}
