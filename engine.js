
this.tasks = [];

this.load = function (data) {
  var statistic;
  if(!(statistic = load("appTasks")))
  {
      statistic = data["tasks"];
      error("why?");
  }

  for(var i = 0; i<statistic.length; ++i){
    this.tasks.push({name: statistic[i].name,
                     isDone:   statistic[i].isDone,
                     difficulty: parseInt(statistic[i].difficulty, 10),
                     content: statistic[i].content
    });
  }
  if(engine.tasks.length==0) this.stats = data["tasks"];
}

this.loadf = function () {

  // var statistic;
  // if(!(statistic = load("appTasks")))
  // {
  //     error("error");
  // }
  // else{
  // for(var i = 0; i<statistic.length; ++i){
  //   this.tasks.push({name: statistic[i].name,
  //                    isDone:   statistic[i].isDone,
  //                    difficulty: parseInt(statistic[i].difficulty, 10),
  //                    content: statistic[i].content
  //   });
  // }
  // if(engine.tasks.length==0) this.stats = data["tasks"];
  // }
}

this.saveTasks = function () { // хз но не работает мб последняя строка не так написанна
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

this.createFile = function () {
  error("create");
  var fso;
  var f1;
  fso = new ActiveXObject("Scripting.FileSystemObject");
  error("create2");
  f1 = fso.CreateTextFile("qwerty.json", true);
  error("create3");
}
