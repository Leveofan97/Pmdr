Item{
  id: faq;
  x: 300;
  y: 80;
  width: 500;
  height: 500;
  visible: false;
ScrollingText {
        id: descriptionText;

        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        color: "#FFFFFF";
        font: secondaryFont;
        text: "Для многих людей время враг. Тревога, вызванная «тикающими часами» обычно в момент приближения дедлайна, ведет к неэффективности работы и учебы, что в свою очередь влечет за собой тенденцию к откладыванию дел «на потом». Используя технику Pomodoro, вы увеличиваете свою продуктивность, делая больше за меньшее время.

Техника Pomodoro позволяет быть на максимуме своей эффективности, не перегружать себя. Также позволяет сконцентрироваться над определенной задачей, позволяет решить ее в более короткий промежуток времени чем, если вы решалось несколько задач одновременно.;

Данное приложение имеет весь функционал позволяющий Вам организовывать свое рабочее время в соответствии с вышеописанной техникой. У Вас есть возможность настраивать гибкий график рабочего процесса с помощью настроект таймера, а также Вы можете сами назначать время для отдаха. В арсенале функционала приложения имеетются такие полезные функции как:

  1) Создание новой задачи;
  2) Удаление задачи;
  3) Редактирование задачи;
  4) Пометить задачу как выполненную;
  5) Убрать из списка выполненных;
  6) Настроить время рабочего процесса;
  7) Настроить время отдыха;
  8) Выбрать одну из четырех тем оформления фона;

Интерфейс приложения Pomodoro можно условно разделить на три основных части:

1)  Меню персонализации и помощи(Левая область приложения).

Данная область управления позволяет Вам менять цветовую тему приложения. Для этого достаточно активировать одну из четырех круглых кнопок в левой части экрана, каждая из которых отличается цветом (синяя/желтая/черная/красная).

По-мимо этого в этой же части экрана у Вас есть возможность выбрать звук увидомления для Вашего таймера, который будет воспроизводиться после окончания таймера рабочего процесса. Ниже, нажав на иконку восклицательного знака, Вы всегда можете прочесть этот FAQ если что-то забыли.

2)  Область таймера.

Данная область управления позволяет Вам настраивать время Вашей работы и отдыха, а так же управлять таймером по необходимости. Для настройки времени Вам достаточно выбрать сперва одну из трех иконок управления таймером, а затем сфокусироваться на самом таймере, нажатием 'Вверх'. После данной манипуляции Вы сможете принудительно выбрать либо 'Работа', что означает время рабочего процесса, либо 'Отдых', что как Вы могли догадаться, означает время отдыха. Далее для настройки самого времени выберите то, что Вам нужно, нажатием 'ОК'. После этой операции путем нажатия стрелок Вы можете назначать новое время для таймера. Стрелки 'Влево/Вправо' увеличивают и уменьшают время на 5 минут, а стрелки 'Вверх/Вниз увеличивают и уменьшают время на 30 секунд. После того как Вы назначите интересующее Вас время нажмите еще раз 'ОК' и сфокусируйтесь на иконках управления таймером (Стрелка 'Вниз').

Внизу самого таймера распологаются 3 клавиши управления этим таймером, каждая из этих клавишь имеет свой функционал. Так например, самая центральная кнопка выполняет старт/паузу отсчета времени, эта кнопка основная в ходе использования таймера. С помощью нее Вы собственно и запускаете таймер на обратный отсчет, а если нужно то ставите на паузу. Правее распологается клавиша сброса таймера. Функционал данной клавиши отвечает за сброс времени в исходное состоние до момента запуска таймера, то есть если на таймере до момента запуска было 25 минут и Вы запустили таймер случайно, то Вы можете не отменять работу таймера (данная функция будет описана ниже), а вернуть его в исходное состояние 25 минут. Слева от клавиши Старт/Пауза, распологается клавиша Отмена. Функционал данной клашиви предназначен для того что бы отменить работу активного таймера и пропустить вазу отдыха/работы, например если Вы закончили работу над выбранной задачей и хотите сделать перерыв, но у вас остается еще активное время работы. Вы, что бы не ждать окончания таймера с временем работы, можете просто нажать на клавишу Отмена и таймер переключится к фазe отдыха. Точно так же Вы можете поступить если хотите пропустить фазу отдыха и приступить сразу в рабочему процессу.";
        onDownPressed: {
          okay.setFocus();
        }
    }

    Button{
      id: okay;
      width: 150;
      height: 50;
      radius: 5;
      anchors.horizontalCenter: descriptionText.horizontalCenter;
      anchors.top: descriptionText.bottom;
      anchors.topMargin: 25;
      text: "Понятно";

      onUpPressed: {
        descriptionText.setFocus();
      }

      onSelectPressed: {
        faq.visible = false;
        casetimer.visible = true;
        activeTask.visible = true;
        musicButton.opacity = 1;
        redButton.opacity = 1;
        yellowButton.opacity = 1;
        blueButton.opacity = 1;
        faqButton.opacity = 1;
        rightMenu.opacity = 1;
      }
    }
}
