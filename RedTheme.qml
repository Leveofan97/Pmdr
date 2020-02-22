Item{
  id:redcolor;
  anchors.fill: mainView;
  visible: false;
Rectangle {
  id: redtheme;

  anchors.fill: redcolor;

  Image
  {
    anchors.fill: redtheme;
    source: "apps/Pomodoro/img/backred.jpg";
  }
}
}
