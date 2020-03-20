
this.tasks = [];

this.history = [];

this.weekProgress = [];
this.weekMaxProgress = 0;
this.weekMidProgress = 0;

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
  if(this.tasks[index].isDone === true){
    this.history.push({name: this.tasks[index].name,
                   isDone:   this.tasks[index].isDone,
                   difficulty: this.tasks[index].difficulty,
                   content: this.tasks[index].content
    });
    log("appTasks" + this.history);
  }
  this.tasks.splice(index, 1);
  log("appTasks" + this.tasks);
  this.saveTasks();
}

this.addTask = function (data) {
  this.tasks.splice(0, 0, data);
  log("appTasks" + this.tasks);
  this.saveTasks();
}

function getWeekDay(date){
  let days = ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"];
  return days[date];
}

this.today = function() {
  let D = new Date;
  let i = D.getDay();
  return getWeekDay(i);
}

this.someFF = function (data) {
  var statistic;
  if(!(statistic = load("weekProgress"))) {
      statistic = data["weekProgress"];
  }
// Переписать с датами! и сделай на месяц!
  let D = new Date;
  let toD = this.today();
  var i = statistic.findIndex(item => item.day === toD);

  for(var j = 0; j < i; ++j) {
    let temp = statistic[j];
    temp.count = 0;
    statistic.push(temp);
  }

  statistic.splice(0, i);
  this.weekProgress = statistic;

  for(var j = 0; j < this.weekProgress.length; ++j){
    this.weekMidProgress += this.weekProgress[j].count;
    if(this.weekProgress[j].count > this.weekMaxProgress)
      this.weekMaxProgress = this.weekProgress[j].count;
  }
  this.weekMidProgress /= this.weekProgress.length;
  this.weekMidProgress = this.weekMidProgress.toFixed(2);

  this.saveWeekProgress();

}

this.saveWeekProgress = function () {
  var statistic = [];
  var temp;

  for(var i = 0; i < this.weekProgress.length; ++i) {
    temp = this.weekProgress[i];
    statistic.push({day: temp.day,
                   count: temp.count
    });
  }

  log("weekProgress" + statistic);
  save("weekProgress", statistic);
}
