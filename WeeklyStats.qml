import "ProgressBar.qml";

Item {
  id: weeklyStats;
  anchors.verticalCenter: parent.verticalCenter;
  height: 500;
  width: 1000;
	property real step: 100;

  Rectangle {
    anchors.fill: parent;
    color: "#0ff";
    radius: 8;
    borderWidth: 1;
    borderColor: "#f55";
  }

  

  ProgressBar{
    id: bar;
    anchors.verticalCenter: parent.verticalCenter;
    anchors.left: parent.left;
    anchors.margins: 1*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.1;
    height: 300;
  }

  ProgressBar{
    id: bar1;
    anchors.verticalCenter: parent.verticalCenter;
    anchors.left: parent.left;
    anchors.margins: 2*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.2;
    height: 300;
  }

  ProgressBar{
    id: bar2;
    anchors.verticalCenter: parent.verticalCenter;
    anchors.left: parent.left;
    anchors.margins: 3*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.3;
    height: 300;
  }

  ProgressBar{
    id: bar3;
    anchors.verticalCenter: parent.verticalCenter;
    anchors.left: parent.left;
    anchors.margins: 4*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.4;
    height: 300;
  }

  ProgressBar{
    id: bar4;
    anchors.verticalCenter: parent.verticalCenter;
    anchors.left: parent.left;
    anchors.margins: 5*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
  }

  ProgressBar{
    id: bar5;
    anchors.verticalCenter: parent.verticalCenter;
    anchors.left: parent.left;
    anchors.margins: 6*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.6;
    height: 300;
  }

  ProgressBar{
    id: bar6;
    anchors.verticalCenter: parent.verticalCenter;
    anchors.left: parent.left;
    anchors.margins: 7*weeklyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.7;
    height: 300;
  }
}
