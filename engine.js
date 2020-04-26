
this.tasks = [];

this.history = [];

this.dayProgress = {};

this.weekProgress = [];
this.weekMaxProgress = 0;
this.weekMidProgress = 0;

this.monthProgress = [];
this.monthMaxProgress = 0;
this.monthMidProgress = 0;

this.allStats = [];

this.load = function (data) {
  var statistic;
  if(!(statistic = load("appTasks"))) {
      statistic = data["tasks"];
  }

  for(var i = 0; i < statistic.length; ++i) {
    this.tasks.push({name: statistic[i].name,
                     isDone:   statistic[i].isDone,
                     difficulty: parseInt(statistic[i].difficulty, 10),
                     content: statistic[i].content
    });
  }

  if(engine.tasks.length==0) this.tasks = data["tasks"];

  var statHistory;
  if(!(statHistory = load("History"))) {
      statHistory = data["History"];
  }

  for(var i = 0; i < statistic.length; ++i) {
    this.history.push({name: statHistory[i].name,
                     isDone:   statHistory[i].isDone,
                     difficulty: parseInt(statHistory[i].difficulty, 10),
                     content: statHistory[i].content
    });
  }

  if(engine.history.length==0) this.history = data["History"];
}

this.addDoneTask = function (currentIndex) {
  var temp = this.tasks[currentIndex];
  temp.isDone = !this.tasks[currentIndex].isDone;

  this.tasks.splice(currentIndex, 1);

  var j = this.tasks.findIndex(item => item.isDone === true);
  if (j !== -1)
    this.tasks.splice(j, 0, temp);
  else
    this.tasks.splice(this.tasks.length, 0, temp);

  if(temp.isDone === true){
    this.history.unshift({ name: temp.name,
                           isDone:   temp.isDone,
                           difficulty: temp.difficulty,
                           content: temp.content
    });
    log("HistoryList" + this.history);
  }
  else {
    var id = this.history.findIndex(item => item.name === temp.name && item.content === temp.content);
    log("id = " + id);
    this.history.splice(id,1);
  }
  save("History", this.history);
  this.saveTasks();
}

this.saveTasks = function () {
  var statistic = [];
  var temp;

  for(var i = 0; i < this.tasks.length; ++i) {
    temp = this.tasks[i];
    statistic.push({name: temp.name,
                   isDone:   temp.isDone? "true":"false",
                   difficulty: temp.difficulty.toString(),
                   content: temp.content
    });
  }

  log("appTasks" + statistic);
  save("appTasks", statistic);
}

this.deleteTask = function (index) {
  // if(this.tasks[index].isDone === true){
  //   this.history.push({name: this.tasks[index].name,
  //                  isDone:   this.tasks[index].isDone,
  //                  difficulty: this.tasks[index].difficulty,
  //                  content: this.tasks[index].content
  //   });
  //   log("appTasks" + this.history);
  // }
  this.tasks.splice(index, 1);
  log("appTasks" + this.tasks);
  this.saveTasks();
}

this.addTask = function (data) {
  this.tasks.splice(0, 0, data);
  log("appTasks" + this.tasks);
  this.saveTasks();
}

function getWeekDay(date) {
  let days = ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"];
  return days[date.getDay()];
}

this.today = function() {
  let D = new Date;
  return getWeekDay(D);
}

this.toISODateSring = function(D) {
  var itd = D.getFullYear() + '-' + (D.getMonth()+1) + '-' + D.getDate();
  return itd;
}

this.loadAllStats = function (data) {
  var statistic;
  if(!(statistic = load("allStats"))) {
      statistic = data["allStats"];
  }

  for(var i = 0; i < statistic.length; ++i) {
    this.allStats.push({day: statistic[i].day,
                        count: statistic[i].count
    });
  }
  if(engine.allStats.length==0) this.allStats = data["allStats"];
}

function previousDate(j) {
  let D = new Date;
  let D2 = new Date(D.getFullYear(), D.getMonth(), D.getDate()-j);
  var tdi = D2.getFullYear() + '-' + (D2.getMonth()+1) + '-' + (D2.getDate());
  return tdi;
}

this.loadWeek = function () {
  this.weekProgress = [];
  this.weekMidProgress = 0;
  this.weekMaxProgress = 0;

  let offset = 1;
  let D = new Date;

  for (var i = 0; i < 7; ++i){
    var Di = new Date(this.allStats[this.allStats.length - (i+offset)].day);

    log(previousDate(i) + " == " + this.toISODateSring(Di));

    if (previousDate(i) === this.toISODateSring(Di)){
      this.weekProgress[i] = this.allStats[this.allStats.length - (i+offset)];

      this.weekMidProgress += this.weekProgress[i].count;
      if(this.weekProgress[i].count > this.weekMaxProgress)
        this.weekMaxProgress = this.weekProgress[i].count;

    }
    else{
      let Dprev = new Date(D.getFullYear(), D.getMonth(), D.getDate()-i);
      let delta = (Dprev - Di) / 86400000;
      log(delta);

      for (var j = 0; j < delta && i < 7; ++j, ++i){
        offset--;
        let Dgap = new Date(D.getFullYear(), D.getMonth(), D.getDate()-i);
        let temp = this.toISODateSring(Dgap);
        this.weekProgress.push({day: temp,
                                count: 0
        });
      }
      i--;

    }
  }

  this.weekMidProgress /= this.weekProgress.length;
  this.weekMidProgress = this.weekMidProgress.toFixed(2);
}

this.loadDay = function (){
  this.dayProgress = {};

  var D = new Date(this.allStats[this.allStats.length - 1].day);
  this.dayProgress.day = getWeekDay(D);

  this.dayProgress.count = this.allStats[this.allStats.length - 1].count;
}

this.loadMonth = function () {
  this.monthProgress = [];
  this.monthMaxProgress = 0;
  this.monthMidProgress = 0;

  let offset = 1;
  let D = new Date;

  for (var i = 0; i < 31 && i < this.allStats.length+Math.abs(offset-1); ++i){
    let Di = new Date(this.allStats[this.allStats.length - (i+offset)].day);

    log(previousDate(i) + " == " + this.toISODateSring(Di));

    if (previousDate(i) === this.toISODateSring(Di)){
      this.monthProgress[i] = this.allStats[this.allStats.length - (i+offset)];
    }
    else{
      let Dprev = new Date(D.getFullYear(), D.getMonth(), D.getDate()-i);
      let delta = (Dprev - Di) / 86400000;
      log(delta);

      for (var j = 0; j < delta && i < 31; ++j, ++i){
        offset--;
        let Dgap = new Date(D.getFullYear(), D.getMonth(), D.getDate()-i);
        let temp = this.toISODateSring(Dgap);
        this.monthProgress.push({day: temp,
                                count: 0
        });
      }
      i--;

    }
  }

  for (var i = 0; i < 31; ++i){
    this.monthMidProgress += this.monthProgress[i].count;
    if(this.monthProgress[i].count > this.monthMaxProgress)
      this.monthMaxProgress = this.monthProgress[i].count;
  }

  this.monthMidProgress /= this.monthProgress.length;
  this.monthMidProgress = this.monthMidProgress.toFixed(2);
}

this.todayCountIncrement = function (){
  this.allStats[this.allStats.length - 1].count++;

  if(this.allStats[this.allStats.length - 1].count > this.weekMaxProgress)
    this.weekMaxProgress = this.allStats[this.allStats.length - 1].count;

  this.saveAllStats();
}

this.saveAllStats = function () {
  var statistic = [];
  var temp;

  for(var i = 0; i < this.allStats.length; ++i) {
    temp = this.allStats[i];
    statistic.push({day: temp.day,
                   count: temp.count
    });
  }

  log("allStats" + statistic);
  save("allStats", statistic);
}
