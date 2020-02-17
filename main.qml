import controls.Button;
import controls.FocusablePanel;
Application {

	id: mainView;
	color: "#010101";
	Gradient
	{
		//radius:5;
		anchors.left: mainView.left;
		anchors.top: mainView.top;
		anchors.right: mainView.right;
		anchors.bottom: mainView.bottom;
			GradientStop
			{
				position: 0;
				color: "#000000";
				Behavior on color { animation : Animation {duration: 1000; } }
			}
			GradientStop
			{
				position: 0.25;
				color: "#2B2929";
				Behavior on color { animation : Animation {duration: 2000; } }
			}
			GradientStop
			{
				position: 0.5;
				color: "#696563";
				Behavior on color { animation : Animation {duration: 3000; } }
			}
			GradientStop
			{
				position: 0.75;
				color: "#2B2929";
				Behavior on color { animation : Animation {duration: 2000; } }
			}
			GradientStop
			{
				position: 1;
				color: "#000000";
				Behavior on color { animation : Animation {duration: 1000; } }
			}
		}

/*--------------------------Правое меню задач---------------------------------*/
Rectangle
{
	id: menu;
	width: 200;
	height: 600;
	anchors.verticalCenter: parent.verticalCenter;
	anchors.right: parent.right;
	radius: 10;
	rotation: 90;
	//color: "#CCC0B2";
	Gradient
	{
		Rectangle
		{
			id: but;
			anchors.horizontalCenter: menu.horizontalCenter;
			anchors.top: menu.top;
			anchors.topMargin: 20;
			width:140;
			height:40;
			radius: 10;


			Gradient
			{
				Text
				{
					anchors.centerIn: parent;
					text: "+ Добавить";
					font: bodyFont;
					color: "#000000";
					pixelSize: 10;
				}
				orientation: Horizonral;
				anchors.verticalCenter: but.verticalCenter;
				width:140;
				height:40;
				GradientStop
				{
					position: 0;
					color: "#ffffff";
					Behavior on color { animation : Animation {duration: 500; } }

				}
				GradientStop
				{
					position: 1;
					color: "#434445";
					Behavior on color { animation : Animation {duration: 500; } }

				}
			}
		}
		Text
		{
			anchors.horizontalCenter: menu.horizontalCenter;
			anchors.bottom: menu.bottom;
			anchors.bottomMargin: 15;
			text: "История...";
			font: bodyFont;
			color: "#ffffff";
		}

		orientation: Vertical;
		anchors.verticalCenter: menu.verticalCenter;
		width:200;
		height: 400;
		GradientStop
		{
			position: 0;
			color: "#000000";
			Behavior on color { animation : Animation {duration: 1000; } }

		}
		GradientStop
		{
			position: 0.45;
			color: "#2a2a2a";
			//color: "#859398";

			Behavior on color { animation : Animation {duration: 2000; } }
		}
		GradientStop
		{
			position: 0.55;
			color: "#2a2a2a";
			//color: "#859398";

			Behavior on color { animation : Animation {duration: 2000; } }
		}
		GradientStop
		{
			position: 1;
			color: "#000000";
			//color: "#859398";

			Behavior on color { animation : Animation {duration: 1000; } }
		}
	}
}
/*----------------------------------------------------------------------------*/

/*---------------------------------Таймер-------------------------------------*/
Item
{
	x: 510;
	y: 500;

	Rectangle
	{
				id: timercyrcle;

				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: mainView.verticalCenter;
				color: "#FBE9E7";
        width: 350;
				height: 350;
				radius: 175;
				Text
				{
					anchors.horizontalCenter: timercyrcle.horizontalCenter;
					anchors.bottom: parent.top;
					anchors.bottomMargin: 20;
					font: titleFont;
					text: "Pomodoro";
					color: "#ffffff";
				}
				Text
				{
					anchors.centerIn: parent;
					text: "25:00";
					color: "#000000";
					font: titleFont;
				}

				FocusablePanel {
					id: pauseButton;
					anchors.horizontalCenter: parent.verticalCenter;
					anchors.top: parent.bottom;
					anchors.topMargin: 20;

					width: 50;
					height: 50;
					enabled: true;
					radius: 25;

					//opacity: 0.1;

					Image
					{
				 		id: pause;
			      anchors.centerIn: parent;
						source: "apps/Pomodoro/img/pause.png";
					}

					onLeftPressed: {
						error("left pressed");
						cancelButton.setFocus();
					}

					onRightPressed: {
						error("right pressed");
						resetButton.setFocus();
					}

					onSelectPressed: {
						error("click pause!");
					}
				}

				FocusablePanel {
					id: resetButton;
					anchors.right: parent.right;
					anchors.bottom: parent.bottom;

					width: 50;
					height: 50;
					enabled: true;
					radius: 25;

					Image
					{
				 		id: reset;
						anchors.centerIn: parent;
						source: "apps/Pomodoro/img/reset.png";
					}

					onLeftPressed: {
						error("left pressed");
						pauseButton.setFocus();
					}

					onRightPressed: {
						error("right pressed");
						blueButton.setFocus();
					}

					onSelectPressed: {
						error("click reset!");
					}
				}

				FocusablePanel {
					id: cancelButton;
					anchors.left: parent.left;
					anchors.bottom: parent.bottom;

					width: 50;
					height: 50;
					enabled: true;
					radius: 25;
					Image
					{
				 		id: cancel;
						anchors.centerIn: parent;
						source: "apps/Pomodoro/img/cancel.png";
					}

					onLeftPressed: {
						error("left pressed");
						faqButton.setFocus();
					}

					onRightPressed: {
						error("right pressed");
						pauseButton.setFocus();
					}

					onSelectPressed: {
						error("click cansel!");
					}
				}

  }
}
/*----------------------------------------------------------------------------*/

/*------------------------Левое меню персонализации---------------------------*/
	Item
	{
		id: custom;
		width: 50;
		height: 400;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: parent.left;

		FocusablePanel {
			id: blueButton;
			anchors.right: custom.right;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			Rectangle
			{
				id: blue;
				anchors.right: custom.right;

				width: 40;
				height: 40;
				radius: 20;
				color: "#0017FD"; // blue
			}

			onUpPressed: {
				error("up pressed");
				faqButton.setFocus();
			}

			onDownPressed: {
				error("down pressed");
				yellowButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				cancelButton.setFocus();
			}

			onSelectPressed: {
				error("click blue!");
			}

		}

		FocusablePanel {
			id: yellowButton;
			anchors.top: blue.bottom;
			anchors.topMargin: 20;
			anchors.right: custom.right;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			Rectangle
			{
				id: yellow;
				anchors.top: blue.bottom;
	      anchors.topMargin: 20;
				anchors.right: custom.right;
				width: 40;
				height: 40;
				radius: 20;
				color: "#FDDE00"; // yellow
			}

			onUpPressed: {
				error("up pressed");
				blueButton.setFocus();
			}

			onDownPressed: {
				error("down pressed");
				blackButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				cancelButton.setFocus();
			}

			onSelectPressed: {
				error("click yellow!");
			}

		}

		FocusablePanel {
			id: blackButton;
			anchors.top: yellow.bottom;
			anchors.topMargin: 20;
			anchors.right: custom.right;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			Rectangle
			{
				id: black;
				anchors.top: yellow.bottom;
	      anchors.topMargin: 20;
				anchors.right: custom.right;
				width: 40;
				height: 40;
				radius: 20;
				color: "#121212"; // black
			}

			onUpPressed: {
				error("up pressed");
				yellowButton.setFocus();
			}

			onDownPressed: {
				error("down pressed");
				redButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				cancelButton.setFocus();
			}

			onSelectPressed: {
				error("click black!");
			}
		}

		FocusablePanel {
			id: redButton;
			anchors.top: black.bottom;
			anchors.topMargin: 20;
			anchors.right: custom.right;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			Rectangle
			{
				id: red;
				anchors.top: black.bottom;
	      anchors.topMargin: 20;
				anchors.right: custom.right;
				width: 40;
				height: 40;
				radius: 20;
				color: "#ff0000"; // red
			}

			onUpPressed: {
				error("up pressed");
				blackButton.setFocus();
			}

			onDownPressed: {
				error("down pressed");
				musicButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				cancelButton.setFocus();
			}

			onSelectPressed: {
				error("click red!");
			}
		}

		FocusablePanel {
			id: musicButton;
			anchors.top: red.bottom;
			anchors.topMargin: 20;
			anchors.right: custom.right;

			width: 50;
			height: 50;
			enabled: true;
			radius: 25;

			Image
			{
				id: musicImage;
				anchors.top: red.bottom;
	      anchors.topMargin: 20;
				anchors.right: custom.right;
				source: "apps/Pomodoro/img/music.png";
			}

			onUpPressed: {
				error("up pressed");
				redButton.setFocus();
			}

			onDownPressed: {
				error("down pressed");
				faqButton.setFocus();
			}

			onRightPressed: {
				error("right pressed");
				cancelButton.setFocus();
			}

			onSelectPressed: {
				error("click music!");
			}
		}



			FocusablePanel {
				id: faqButton;
				anchors.top: musicImage.bottom;
				anchors.topMargin: 20;
				anchors.right: custom.right;

				width: 50;
				height: 50;
				enabled: true;
				radius: 25;


				Image
				{
					id: faqImage;
					anchors.top: musicImage.bottom;
					anchors.topMargin: 20;
					anchors.right: custom.right;
					source: "apps/Pomodoro/img/faq.png";
				}

				onUpPressed: {
					error("up pressed");
					musicButton.setFocus();
				}

				onDownPressed: {
					error("down pressed");
					colorButton.setFocus();
				}

				onRightPressed: {
					error("right pressed");
					cancelButton.setFocus();
				}

				onSelectPressed: {
					error("click faq!");
				}
			}
	}
/*----------------------------------------------------------------------------*/
  onStarted: {
    error("onStarted");
  }
}
