this.colorprocent = function(){
    var delitel = (clockFace.startseconds < 0 ? 1 : clockFace.startseconds);
    var proc = (clockFace.seconds/delitel) * 100;

    //"#64eef9" NOT
    if(proc > 0 && proc < 10){
      timercyrcle.color = "#ff0000";
    }
    if(proc > 10 && proc < 20){
      timercyrcle.color = "#c23d01";
    }
    if(proc > 20 && proc < 30){
      timercyrcle.color = "#a85702";
    }
    if(proc > 30 && proc < 40){
      timercyrcle.color = "#966903";
    }
    if(proc > 40 && proc < 50){
      timercyrcle.color = "#708f04";
    }
    if(proc > 50 && proc < 60){
      timercyrcle.color = "#5ea105";
    }
    if(proc > 60 && proc < 70){
      timercyrcle.color = "#45ba06";
    }
    if(proc > 70 && proc < 80){
      timercyrcle.color = "#26d907";
    }
    if(proc > 80 && proc < 90){
      timercyrcle.color = "#13ec08";
    }
    if(proc > 90 && proc < 100){
      timercyrcle.color = "#00ff08";
    }
}

this.TimerStop = function() {
  clockFace.seconds = stateTimer.flagstate ? clockFace.defworksec : clockFace.defrelaxsec;
  controltimer.isTimerRun = false;
  timePanel.timer.stop();
}

this.ChangeTimerState = function(){
  controltimer.isTimerRun = false;
  stateTimer.flagstate = stateTimer.flagstate ? false : true;
  if(stateTimer.flagstate){
    clockFace.startseconds = clockFace.seconds = clockFace.defworksec;
  }else{
    clockFace.startseconds = clockFace.seconds = clockFace.defrelaxsec;
  }
}

function SetDefValues() {
  if(stateTimer.flagstate){
    clockFace.defworksec = clockFace.seconds;
  }else{
    clockFace.defrelaxsec = clockFace.seconds;
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
