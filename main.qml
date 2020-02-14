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
		radius: 5;
		//color: "#CCC0B2";
		Gradient
		{
			orientation: Vertical;
			anchors.left: menu.left;
			anchors.top: menu.top;
			anchors.right: menu.right;
			anchors.bottom: menu.bottom;
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
	paint: true;

	Rectangle
	{
				id: timercyrcle;

				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: helloWorld.verticalCenter;
				color: "#FBE9E7";
        width: 350;
				height: 350;
				radius: 175;

				Text
				{
					anchors.centerIn: parent;
					text: "25";
					color: "#000000";
					font: titleFont;
				}
				Image
				{
			 		id: pause;
					anchors.horizontalCenter: parent.verticalCenter;
					anchors.top: parent.bottom;
		      anchors.topMargin: 20;
					source: "apps/hello_world/img/pause.png";
				}
				Image
				{
			 		id: reset;
					anchors.right: parent.right;
					anchors.bottom: parent.bottom;
					source: "apps/hello_world/img/reset.png";
				}
				Image
				{
			 		id: cancel;
					anchors.left: parent.left;
					anchors.bottom: parent.bottom;
					source: "apps/hello_world/img/cancel.png";
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
