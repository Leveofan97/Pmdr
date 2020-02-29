
this.tasks = [];

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
  this.tasks.splice(index, 1);
  log("appTasks" + this.tasks);
  this.saveTasks();
}

this.addTask = function (data) {
  this.tasks.splice(0, 0, data);
  log("appTasks" + this.tasks);
  this.saveTasks();
}
