this.colorprocent = function(){
    var delitel = (clockFace.startseconds < 0 ? 1 : clockFace.startseconds);
    var delitelsec = (clockFace.seconds < 0 ? 1 : clockFace.seconds);
    var procwork = (clockFace.seconds/delitel) * 100;
    var procrelax = (1/delitelsec) * 100;
    var proc = stateTimer.flagstate ? procrelax : procwork;

    //"#64eef9" NOT
    if(proc >= 0 && proc <= 10){
      timercyrcle.color = "#ff7676";
    }
    if(proc > 10 && proc <= 20){
      timercyrcle.color = "#ff9494";
    }
    if(proc > 20 && proc <= 30){
      timercyrcle.color = "#ffaf94";
    }
    if(proc > 30 && proc <= 40){
      timercyrcle.color = "#ffca94";
    }
    if(proc > 40 && proc <= 50){
      timercyrcle.color = "#ffe594";
    }
    if(proc > 50 && proc <= 60){
      timercyrcle.color = "#f9ff94";
    }
    if(proc > 60 && proc <= 70){
      timercyrcle.color = "#e8ff94";
    }
    if(proc > 70 && proc <= 80){
      timercyrcle.color = "#d8ff94";
      timercyrcle.height = 150;
    }
    if(proc > 80 && proc <= 90){
      timercyrcle.color = "#bdff94";
      timercyrcle.height = 250;
    }
    if(proc > 90 && proc <= 100){
      timercyrcle.height = 350;
      timercyrcle.color = "#9cff94";
    }
}

this.audiobeep = [
  "http://download-sounds.ru/wp-content/uploads2/2012/05/13.mp3",
  "https://zvukipro.com/uploads/files/2018-10/1541011561_htc_basic.mp3"
];

this.CounterBreak = function(){
  var newst = 0;
  if(!stateTimer.flagstate){
    timePanel.timer.countbreak++;
    newst = 1;
  }else{
    newst = 0;
  }
  if(timePanel.timer.countbreak > 3){
    newst = 2;
    timePanel.timer.countbreak = 0;
  }
  return newst;
}

this.TimerStop = function() {
  clockFace.startseconds = clockFace.seconds =
  (stateTimer.flagstate == 0 ? clockFace.defworksec :
    (stateTimer.flagstate == 1 ? clockFace.defrelaxsec :
      clockFace.defbigrelsxsec));
  controltimer.isTimerRun = false;
  timePanel.timer.stop();
}

this.ChangeTimerState = function(newstate){
  controltimer.isTimerRun = false;
  if(newstate < 0){
    stateTimer.flagstate = 2;
  }else{
    if(newstate > 2){
      stateTimer.flagstate = 0;
    }else {
      stateTimer.flagstate = newstate;
    }
  }
  clockFace.startseconds = clockFace.seconds =
  (stateTimer.flagstate == 0 ? clockFace.defworksec :
    (stateTimer.flagstate == 1 ? clockFace.defrelaxsec :
      clockFace.defbigrelsxsec));
}

function SetDefValues(seconds, state) {
  if(state){
    if (state == 1) {
      clockFace.defrelaxsec = seconds;
    }else{
      clockFace.defbigrelsxsec = seconds;
    }
  }else{
    clockFace.defworksec = seconds;
  }
}

this.DownTimerBySec = function(seconds, state){
  if(seconds > 59){
    seconds -= 60;
  }else{
    seconds = 0;
    error("Minimum or not selected");
  }
  SetDefValues(seconds, state);
}

this.UpTimerBySec = function(seconds, state){
  if(seconds < 5359){
    seconds += 60;
  }else{
    seconds = 5400;
    error("Maximum or not selected");
  }
  SetDefValues(seconds, state);
}
