this.colorprocent = function(){
    var delitel = (clockFace.startseconds < 0 ? 1 : clockFace.startseconds);
    var proc = (clockFace.seconds/delitel) * 100;
    //"#64eef9" NOT
    if(proc >= 0 && proc <= 10){
      timercyrcle.color = "#ff0000";
    }
    if(proc > 10 && proc <= 20){
      timercyrcle.color = "#c23d01";
    }
    if(proc > 20 && proc <= 30){
      timercyrcle.color = "#a85702";
    }
    if(proc > 30 && proc <= 40){
      timercyrcle.color = "#966903";
    }
    if(proc > 40 && proc <= 50){
      timercyrcle.color = "#708f04";
    }
    if(proc > 50 && proc <= 60){
      timercyrcle.color = "#5ea105";
    }
    if(proc > 60 && proc <= 70){
      timercyrcle.color = "#45ba06";
    }
    if(proc > 70 && proc <= 80){
      timercyrcle.color = "#26d907";
    }
    if(proc > 80 && proc <= 90){
      timercyrcle.color = "#13ec08";
    }
    if(proc > 90 && proc <= 100){
      timercyrcle.color = "#00ff08";
    }
}

this.test = function(){
  return 1;
}

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

function SetDefValues() {
  if(stateTimer.flagstate){
    if (stateTimer.flagstate == 1) {
      clockFace.defrelaxsec = clockFace.seconds;
    }else{
      clockFace.defbigrelsxsec = clockFace.seconds;
    }
  }else{
    clockFace.defworksec = clockFace.seconds;
  }
}

this.DownTimerBySec = function(){
  if(clockFace.seconds > 29){
    clockFace.seconds -= 30;
  }else{
    clockFace.seconds = 0;
    error("Minimum or not selected");
  }
  SetDefValues();
}

this.DownTimerByMin = function(){
  if(clockFace.seconds > 299){
    clockFace.seconds -= 300;
  }else{
    clockFace.seconds = 0;
    error("Minimum or not selected");
  }
  SetDefValues();
}

this.UpTimerByMin = function(){
  if(clockFace.seconds < 5101){
    clockFace.seconds += 300;
  }else{
    clockFace.seconds = 5400;
    error("Maximum or not selected");
  }
  SetDefValues();
}

this.UpTimerBySec = function(){
  if(clockFace.seconds < 5329){
    clockFace.seconds += 30;
  }else{
    clockFace.seconds = 5400;
    error("Maximum or not selected");
  }
  SetDefValues();
}
