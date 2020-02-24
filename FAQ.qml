Item{
  id: faq;
  x: 300;
  y: 80;
  width: 500;
  height: 500;
  visible: false;
Rectangle {
  id: faqcase;

  anchors.fill: faq;

  Image
  {
    anchors.fill: faqcase;
    source: "apps/Pomodoro/img/faqwindow.png";
  }
}

}
