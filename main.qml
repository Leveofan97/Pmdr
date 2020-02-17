import controls.Button;


Application {

	id: helloWorld;
	color: "#010101";
	Gradient
	{
		//radius:5;
		anchors.left: helloWorld.left;
		anchors.top: helloWorld.top;
		anchors.right: helloWorld.right;
		anchors.bottom: helloWorld.bottom;
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
	id: timer;


	Rectangle
	{

				id: timercyrcle;

				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: helloWorld.verticalCenter;
				color: "#FBE9E7";
        width: 350;
				height: 350;
				radius: 175;
				//rotation: 90;
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
					focus: true;
					anchors.centerIn: parent;
					text: "25";
					color: "#000000";
					font: titleFont;
				}
			Item
			{

				focus: true;
				anchors.horizontalCenter: parent.verticalCenter;
				anchors.top: parent.bottom;
				anchors.topMargin: 20;
			Image
			{
					focus: true;
			 		id: pause;
					anchors.horizontalCenter: parent.verticalCenter;
					anchors.top: parent.bottom;
		      //anchors.topMargin: 20;
					source: "apps/hello_world/img/pause.png";
			}
			}
			Item
			{
				anchors.right: parent.right;
				anchors.bottom: parent.bottom;
				Image
				{
					anchors.right: parent.right;
					anchors.bottom: parent.bottom;
			 		id: reset;
					source: "apps/hello_world/img/reset.png";
				}
			}
			Item
			{
				anchors.left: parent.left;
				anchors.bottom: parent.bottom;
				Image
				{
			 		id: cancel;
					//anchors.left: parent.left;
					anchors.bottom: parent.bottom;
					source: "apps/hello_world/img/cancel.png";
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

		Rectangle
		{
			id: main;
			anchors.right: custom.right;
			width: 40;
			height: 40;
			radius: 20;
			color: "#0017FD";
		}
		Rectangle
		{
			id: chld1;
			anchors.top: main.bottom;
      anchors.topMargin: 20;
			anchors.right: custom.right;
			width: 40;
			height: 40;
			radius: 20;
			color: "#FDDE00";
		}
		Rectangle
		{
			id: chld2;
			anchors.top: chld1.bottom;
      anchors.topMargin: 20;
			anchors.right: custom.right;
			width: 40;
			height: 40;
			radius: 20;
			color: "#121212";
		}
		Rectangle
		{
			id: chld3;
			anchors.top: chld2.bottom;
      anchors.topMargin: 20;
			anchors.right: custom.right;
			width: 40;
			height: 40;
			radius: 20;
			color: "#ff0000";
		}

			Image
			{
				id: chld4;
				anchors.top: chld3.bottom;
	      anchors.topMargin: 20;
				anchors.right: custom.right;
				source: "apps/hello_world/img/music.png";
			}

			Image
			{
				id: chld5;
				anchors.top: chld4.bottom;
				anchors.topMargin: 20;
				anchors.right: custom.right;
				source: "apps/hello_world/img/faq.png";
			}
	}
/*----------------------------------------------------------------------------*/

}
