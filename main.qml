import controls.Button;
import controls.FocusablePanel;
import "Background.qml";
import "RightMenu.qml";
import "ClockFaceTimer.qml";
import "LeftMenu.qml";
import "BottomTaskSelected.qml";
import "BlueTheme.qml";
import "YellowTheme.qml";
import "RedTheme.qml";
import "FAQ.qml";

Application {

// TODO:  сделать рефакторинг кода
//				сделать графики
//	   		переверстать адаптивно
//				P.s. Возможности проверить адаптивность нет !
	id: mainView;
	color: "#010101";
/*--------------------------Фон (Gradient)---------------------------------*/
	Background {}
	YellowTheme {}
	BlueTheme {}
	RedTheme {}

/*---------------------------------Таймер-------------------------------------*/

// TODO:  воспроизведение звука после того как закончится время
//				сложность = кол-во томатов
	ClockFaceTimer {}
	FAQ {}

/*--------------------------Правое меню задач---------------------------------*/

// TODO:
// BUG:   отбражение имён тасков выходят за рамки
	RightMenu {}
// Комментарии по использованию ТаскЛиста:
// F1 - "Красная кнопка" - удаление выбранного таска
// F2 - "Зелёная кнопка" - помечает таск как выполненый | и на оборот
// F3 - "Жёлтая  кнопка" - редактирование выбранного таска
// F4 - "Синяя   кнопка" -

/*------------------------------BottomTaskSelected------------------------------------*/

	BottomTaskSelected{}

/*------------------------Левое меню персонализации---------------------------*/

// TODO:
	LeftMenu {}

/*----------------------------------------------------------------------------*/
  onStarted: {
		controltimerButton.setFocus();
		var a = new Date(),
		td = a.getDate() + '.' + (a.getMonth()+1) + '.' + a.getFullYear();
		today.text = td;
    log("Приложение запущено!");
  }
}
