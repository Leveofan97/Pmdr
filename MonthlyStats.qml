import "ProgressBar.qml";

Item {
  id: monthlyStats;
  property real st;
  anchors.top: buttonSpace.bottom;
  anchors.bottom: parent.bottom;
  anchors.left: parent.left;
  anchors.right: parent.right;

  anchors.topMargin: 10;
  anchors.leftMargin: 70;
  anchors.rightMargin: 25;
  anchors.bottomMargin: 30;

	property real step: 24;

  // Rectangle {
  //   anchors.fill: parent;
  //   color: "#f0f0f0";
  //   radius: 15;
  //   borderWidth: 1;
  //   borderColor: "#707070";
  // }

  ProgressBar{
    id: mbar;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 1*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";

  }

  ProgressBar{
    id: mbar1;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 2*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar2;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 3*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar3;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 4*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar4;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 5*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar5;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 6*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar6;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 7*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar7;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 8*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar8;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 9*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar9;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 10*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar10;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 11*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar11;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 12*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar12;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 13*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar13;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 14*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar14;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 15*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar15;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 16*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar16;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 17*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar17;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 18*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar18;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 19*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar19;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 20*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar20;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 21*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar21;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 22*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar22;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 23*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar23;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 24*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar24;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 25*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar25;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 26*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar26;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 27*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar27;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 28*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar28;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 29*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar29;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 30*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";
  }

  ProgressBar{
    id: mbar30;
    anchors.horizontalCenter: monthlyStats.horizontalCenter;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.leftMargin: 31*monthlyStats.step;
    active: true;
    barColor: "#f00";
    progress: 0.5;
    height: 300;
    width: 16;
    ttextUnderBar: "";

  }

  Rectangle{
    id: line4;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.bottom: parent.bottom;

    height: 1;

    anchors.bottomMargin: 300;
    anchors.leftMargin: 5;
    anchors.rightMargin: 30;

    color: "#505050";

    SecondaryText {
      id: text4;

      anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

      anchors.leftMargin: 15;
      anchors.rightMargin: 15;
      text: 4*monthlyStats.st;
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
    anchors.leftMargin: 5;
    anchors.rightMargin: 30;

    color: "#505050";

    SecondaryText {
      id: text3;

      anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

      anchors.leftMargin: 15;
      anchors.rightMargin: 15;
      text: 3*monthlyStats.st;
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
    anchors.leftMargin: 5;
    anchors.rightMargin: 30;

    color: "#505050";

    SecondaryText {
      id: text2;

      anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

      anchors.leftMargin: 15;
      anchors.rightMargin: 15;
      text: 2*monthlyStats.st;
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
    anchors.leftMargin: 5;
    anchors.rightMargin: 30;

    color: "#505050";

    SecondaryText {
			id: text1;

			anchors.right: parent.left;
      anchors.verticalCenter: parent.verticalCenter;

			anchors.leftMargin: 15;
      anchors.rightMargin: 15;
			text: monthlyStats.st;
			color: "#505050";
		}
  }

  Rectangle{
    id: line0;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.top: monthlyStats.bottom;

    height: 1;

    anchors.leftMargin: 5;
    anchors.rightMargin: 30;

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
