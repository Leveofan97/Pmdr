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

  -Создать задачу;
  -Удалить задачу;
  -Отредактировать задачу;
  -Отметить выполненной задачу;";
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
        menu.opacity = 1;
      }
    }
}
