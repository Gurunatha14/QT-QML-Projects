var blocksize = 40;
var maxColumn = 10;
var maxRow = 15;
var maxIndex = maxColumn * maxRow;
var board = new Array(maxIndex);
var component;
var scoresURL = "";
var gameDuration;

// Index function used instead of a 2D array
function index(column,row) {
    return column + (row * maxColumn);
}

function startNewGame(){
    // Delete blocks from previous game
    for(var i = 0; i< maxIndex; i++){
        if(board[i] != null){
            board[i].destroy();
        }
    }

    // calculate board size
    maxColumn = Math.floor(background.width / blocksize);
    maxRow = Math.floor(background.height / blocksize);
    maxIndex = maxRow * maxColumn;

    // Initialize Board
    board = new Array(maxIndex);
    for(var column = 0; column < maxColumn; column++){
        for(var row = 0; row < maxRow; row++){
            board[index(column,row)] = null;
            createBlock(column,row);
        }
    }

}

function createBlock(column, row){

    if(component == null)
        component = Qt.createComponent("qrc:/BoomBlock.qml");
    // Note that if block.qml was not a local file, component.status would be
    // Loading and we should wait for the component's statuschanged() dignal to
    // Know when the file is downloaded and ready before calling createobject().
    if(component.status == Component.Ready){
        var dynamicObject = component.createObject(background);
        if(dynamicObject == null){
            console.log("error creating block");
            console.log(component.errorString());
            return false;
        }
        dynamicObject.type = Math.floor(Math.random() * 3);
        dynamicObject.x = column * blocksize;
        dynamicObject.y = row * blocksize;
        dynamicObject.width = blocksize;
        dynamicObject.height = blocksize;
        board[index(column,row)] = dynamicObject;

    }
    else{
        console.log("error loading block component");
        console.log(component.errorString());
        return false;
    }
    return true;
}
var fillFound; //Set after a floodFill call to the number of blocks found
var floodBoard; //Set to 1 if the floodFill reaches off that node

function handleClick(xpos, ypos){
    var column = Math.floor(xpos / gameCanvas.blocksize);
    var row = Math.floor(ypos / gameCanvas.blocksize);
    if(column >= maxColumn || column < 0 || row >= maxRow || row < 0)
        return;
    if(board[index(column,row)] == null)
       return;
    // If it's a valid block, remove it and all connected (does nothing if it's not connected)
    floodFill(column,row,-1);
    if(fillFound <= 0)
        return;
    gameCanvas.score += (fillFound - 1); //* (fillFound - 1);
    shuffleDown();
    victoryCheck();
}

function floodFill(column, row, type){
  if(board[index(column,row)] == null)
      return;
  var first = false;
  if(type == -1){
      first = true;
      type = board[index(column,row)].type;

      //Flood fill initialization
      fillFound = 0;
      floodBoard = new Array(maxIndex);
  }
  if (column >= maxColumn || column < 0 || row >= maxRow || row < 0)
      return;
  if(floodBoard[index(column,row)] == 1 || (!first && type != board[index(column,row)].type))
      return;
  floodBoard[index(column,row)] = 1;
  floodFill(column + 1, row,type);
  floodFill(column - 1, row,type);
  floodFill(column , row + 1,type);
  floodFill(column , row - 1,type);
  if(first == true && fillFound == 0)
      return;  // can't remove single blocks
  board[index(column,row)].opacity = 0;
  board[index(column,row)] = null;
  fillFound += 1;

}

function shuffleDown(){
    // Fall Down
    for(var column = 0; column < maxColumn; column++){
        var fallDist = 0;
        for(var row=maxRow-1 ; row >= 0; row--){
         if(board[index(column,row)] == null){
             fallDist += 1;
         }else{
             if(fallDist > 0){
                 var obj = board[index(column,row)];
                 obj.y += fallDist * gameCanvas.blocksize;
                 board[index(column,row + fallDist)] = obj;
                 board[index(column,row)] = null;
             }
         }
        }
    }

    // Fall to the left
    var fallDist = 0;
    for(var column = 0; column < maxColumn; column++){
        if(board[index(column,maxRow-1)] == null){
            fallDist += 1;
        }else{
            if(fallDist > 0){
                for(var row = 0; row < maxRow; row++){
                    var obj = board[index(column,row)];
                    if(obj == null){
                        continue;
                    }
                    obj.x -= fallDist * gameCanvas.blocksize;
                    board[index(column - fallDist, row)] = obj;
                    board[index(column,row)] = null;

                }
            }
        }

    }
}

function victoryCheck(){
    // Award bonus points if no blocks left
    var deservesBonus = true ;
    for(var column = maxColumn - 1; column >= 0; column--){
        if(board[index(column,maxRow - 1)] != null)
            deservesBonus = false;
        if(deservesBonus)
            gameCanvas.score += 500;

        // Check whether game has finished
        if(deservesBonus || !(floodMoveCheck(0,maxRow - 1, -1))){
//            gameDuration = new Date() - gameDuration;
//            nameInputDialog.showWithInput("YOU Won! Please enter your name: ");
            dialog.show("Game Over. Your score is " + gameCanvas.score);
        }

    }
}

// only floods up and right., to see if it can find adjacent same-typed blocks
function floodMoveCheck(column,row,type){
  if(column >= maxColumn || column < 0 || row >= maxRow ||row < 0)
      return false;
  if(board[index(column,row)] == null)
      return false;
  var myType = board[index(column,row)].type;
  if(type == myType)
      return true;
  return floodMoveCheck(column + 1, row, myType) || floodMoveCheck(column, row -1, board[index(column,row)].type);
}

//function saveHighScore(name){
//    if(scoresURL != "")
//        sendHighScore(name);

//    var db = openDatabaseSync("sameGameScores","1.0","Local sameGame High Scores",100);
//    var dataStr = "INSERT INTO Scores VALUES(?,?,?,?)";
//    var data = [name, gameCanvas.score,maxColumn + "x" + maxRow,Math.floor(gameDuration / 1000)];
//    db.transaction(function(tx){
//       tx.executeSql('CREATE TABLE IF NOT EXISTS Scores(name TEXT,score NUMBER,gridSize TEXT,time NUMBER)');
//        tx.executeSql(dataStr,data);

//        var rs = tx.executeSql('SELECT * FROM Scores WHERE gridsize = "12x17" ORDERR BY score desc LIMIT 10');
//        var r = "\nHIGH SCORES FOR A standard size grid \n\n"
//        for(var i =0; i<rs.rows.length;i++){
//            r += (i+1) + ". " + rs.rows.item(i).name + 'got' + rs.rows.item(i).score +' points in ' + rs.rows.item(i).time + 'seconds.\n';
//        }
//        dialog.show(r);
//    });
//}

//function sendHighScore(name) {
//     var postman = new XMLHttpRequest()
//         var postData = "name=" + name + "&score=" + gameCanvas.score + "&gridSize=" + maxColumn + "x" + maxRow + "&time=" + Math.floor(gameDuration / 1000);
//     postman.open("POST", scoresURL, true);
//     postman.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//     postman.onreadystatechange = function() {
//         if (postman.readyState == postman.DONE) {
//             dialog.show("Your score has been uploaded.");
//         }
//     }
//     postman.send(postData);
// }
