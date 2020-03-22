import "ProgressBar.qml";

Item {
  id: weeklyStats;
  property real st;
  anchors.top: buttonSpace.bottom;
  anchors.bottom: parent.bottom;
  anchors.left: parent.left;
  anchors.right: parent.right;

  anchors.topMargin: 10;
  anchors.leftMargin: 100;
  anchors.rightMargin: 100;
  anchors.bottomMargin: 30;

	property real step: 90;

  onCompleted: {
    if (engine.weekMaxProgress.count/4 === 0)
      weeklyStats.st = 0.25;
    else
      weeklyStats.st = engine.weekMaxProgress/4;
  }

  // Rectangle {
  //   anchors.fill: parent;
  //   color: "#f0f0f0";
  //   radius: 15;
  //   borderWidth: 1;
  //   borderColor: "#707070";
  // }

  ProgressBar{
    id: bar;
    anchors.horizontalCenter: weeklyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 1*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.1;
    height: 300;
    ttextUnderBar: "";
    onCompleted: {
      bar.ttextUnderBar = engine.weekProgress[1].day;
      bar.progress = engine.weekProgress[1].count/engine.weekMaxProgress;
    }

  }

  ProgressBar{
    id: bar1;
    anchors.horizontalCenter: weeklyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 2*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.2;
    height: 300;
    ttextUnderBar: "";
    onCompleted: {
      bar1.ttextUnderBar = engine.weekProgress[2].day;
      bar1.progress = engine.weekProgress[2].count/engine.weekMaxProgress;
    }
  }

  ProgressBar{
    id: bar2;
    anchors.horizontalCenter: weeklyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 3*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.3;
    height: 300;
    ttextUnderBar: "";
    onCompleted: {
      bar2.ttextUnderBar = engine.weekProgress[3].day;
      bar2.progress = engine.weekProgress[3].count/engine.weekMaxProgress;
    }
  }

  ProgressBar{
    id: bar3;
    anchors.horizontalCenter: weeklyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 4*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.4;
    height: 300;
    ttextUnderBar: "";
    onCompleted: {
      bar3.ttextUnderBar = engine.weekProgress[4].day;
      bar3.progress = engine.weekProgress[4].count/engine.weekMaxProgress;
    }
  }

  ProgressBar{
    id: bar4;
    anchors.horizontalCenter: weeklyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 5*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    ttextUnderBar: "";
    onCompleted: {
      bar4.ttextUnderBar = engine.weekProgress[5].day;
      bar4.progress = engine.weekProgress[5].count/engine.weekMaxProgress;
    }
  }

  ProgressBar{
    id: bar5;
    anchors.horizontalCenter: weeklyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 6*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.6;
    height: 300;
    ttextUnderBar: "";
    onCompleted: {
      bar5.ttextUnderBar = engine.weekProgress[6].day;
      bar5.progress = engine.weekProgress[6].count/engine.weekMaxProgress;
    }
  }

  ProgressBar{
    id: bar6;
    anchors.horizontalCenter: weeklyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 7*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.7;
    height: 300;
    ttextUnderBar: "";
    onCompleted: {
      bar6.ttextUnderBar = engine.weekProgress[0].day;
      bar6.progress = engine.weekProgress[0].count/engine.weekMaxProgress;
    }
  }

  Rectangle{
    id: line4;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.bottom: parent.bottom;

    height: 1;

    anchors.bottomMargin: 300;
    anchors.leftMargin: 15;
    anchors.rightMargin: 15;

    color: "#505050";

    SecondaryText {
      id: text4;

      anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

      anchors.leftMargin: 15;
      anchors.rightMargin: 15;
      text: 4*weeklyStats.st;
      color: "#505050";
    }
  }

  Rectangle{
    id: line3;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.bottom: parent.bottom;

    height: 1;

    anchors.bottomMargin: 225;
    anchors.leftMargin: 15;
    anchors.rightMargin: 15;

    color: "#505050";

    SecondaryText {
      id: text3;

      anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

      anchors.leftMargin: 15;
      anchors.rightMargin: 15;
      text: 3*weeklyStats.st;
      color: "#505050";
    }
  }

  Rectangle{
    id: line2;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.bottom: parent.bottom;

    height: 1;

    anchors.bottomMargin: 150;
    anchors.leftMargin: 15;
    anchors.rightMargin: 15;

    color: "#505050";

    SecondaryText {
      id: text2;

      anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

      anchors.leftMargin: 15;
      anchors.rightMargin: 15;
      text: 2*weeklyStats.st;
      color: "#505050";
    }
  }

  Rectangle{
    id: line1;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.bottom: parent.bottom;

    height: 1;

    anchors.bottomMargin: 75;
    anchors.leftMargin: 15;
    anchors.rightMargin: 15;

    color: "#505050";

    SecondaryText {
			id: text1;

			anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

			anchors.leftMargin: 15;
      anchors.rightMargin: 15;
			text: weeklyStats.st;
			color: "#505050";
		}
  }

  Rectangle{
    id: line0;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.top: weeklyStats.bottom;

    height: 1;

    anchors.leftMargin: 15;
    anchors.rightMargin: 15;

    color: "#505050";

    SecondaryText {
			id: text0;

			anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

			anchors.leftMargin: 15;
      anchors.rightMargin: 15;
			text: "0";
			color: "#505050";
		}
  }

}
