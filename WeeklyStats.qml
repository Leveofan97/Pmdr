import "ProgressBar.qml";

Item {
  id: weeklyStats;
  anchors.top: buttonSpace.bottom;
  anchors.bottom: parent.bottom;
  anchors.left: parent.left;
  anchors.right: parent.right;

  anchors.margins: 30;

	property real step: 75;

  Rectangle {
    anchors.fill: parent;
    color: "#f0f0f0";
    radius: 15;
    borderWidth: 1;
    borderColor: "#707070";
  }

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
  }
}
