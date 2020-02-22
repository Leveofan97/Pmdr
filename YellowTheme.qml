Item{
  id:yel;
  anchors.fill: mainView;
  visible: false;
Rectangle {
  id: yellowtheme;

  anchors.fill: yel;

  Image
  {
    anchors.fill: yellowtheme;
    source: "apps/Pomodoro/img/back.jpg";
  }
}
}
