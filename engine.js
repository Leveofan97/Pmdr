
this.tasks = [];

this.load = function (data) {
  var statistic;
  if(!(statistic = load("appTasks")))
  {
      statistic = data["tasks"];
  }

  for(var i = 0; i < statistic.length; ++i){
    this.tasks.push({name: statistic[i].name,
                     isDone:   statistic[i].isDone,
                     difficulty: parseInt(statistic[i].difficulty, 10),
                     content: statistic[i].content
    });
  }
  if(engine.tasks.length==0) this.stats = data["tasks"];
}

this.addDoneTask = function (currentIndex) {
  if(this.tasks[currentIndex].isDone === false ){
    this.tasks[currentIndex].isDone = true;
    this.tasks.push(this.tasks[currentIndex]);
    this.tasks.splice(currentIndex, 1);
    this.saveTasks();
  }
}

// this.sort = function () {
//   for(var i = 0; i < this.tasks.length; ++i){
//     if(this.tasks[i].isDone === true ){
//       this.tasks.push(this.tasks[i]);
//       this.tasks.splice(i, 1);
//       //this.saveTasks();
//     }
//   }
// }

this.saveTasks = function () {
  error("saveF");
  var statistic = [];
  var tempT;
  for(var i = 0; i < this.tasks.length; ++i){
    tempT = this.tasks[i];
    error(this.tasks.length);
    statistic.push({name: tempT.name,
                   isDone:   tempT.isDone? "true":"false",
                   difficulty: tempT.difficulty.toString(),
                   content: tempT.content
    });
  }
  log("appTasks" + statistic);
  save("appTasks", statistic);
}

this.deleteTask = function (index) {
  error("deleteF");
  var statistic = this.tasks;
  this.tasks = [];
  var j=0;
  for(var i = 0; i < statistic.length; ++i){
    if(index != i){
      this.tasks[j] = statistic[i];
      j++;
    }
  }
  log("appTasks" + this.tasks);
  save("appTasks", statistic);
}

this.addTask = function (data) {
  error("deleteF");

  this.tasks.push({name: "New Task",
                 isDone: "false",
                 difficulty: "123",
                 content: data
  });

  log("appTasks" + this.tasks);
  save("appTasks", statistic);
}
