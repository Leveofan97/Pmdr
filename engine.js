
this.tasks = [];

this.load = function (data) {
  var statistic;
  // if(!(statistic = load("Tasks")))
  // {
      statistic = data["tasks"];
  // }

  for(var i = 0; i<statistic.length; ++i){
    engine.tasks.push({name: statistic[i].name,
             isDone:   statistic[i].isDone,
             difficulty: parseInt(statistic[i].difficulty, 10),
             content: statistic[i].content
    });
  }
  if(engine.tasks.length==0) this.stats = data["tasks"];
}
