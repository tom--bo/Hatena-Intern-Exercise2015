// 課題 JS-4

// textboxへの入力が正しいかの判定
var checkInput = function (str) {
    var s = str.split(':');
    h = Math.floor(Number(s[0]));
    m = Math.floor(Number(s[1]));
    s = Math.floor(Number(s[2]));
    if(h>=0 && h<=23 && m>=0 && m<=59 && s>=0 && m<=59) {
        var t = new Date("1970/1/1 " + h + ":" + m + ":" + s);
        return t.getTime();
    }
    return false;
}

// textboxの時刻以降のログをテーブル形式で表示
var searchBtnPressed =  function() {
    var timetxt = document.getElementById("targetTime").value;
    var time;
    if(time = checkInput(timetxt)) {
    }else{
        alert("時刻の入力が不正です。\"H:M:S\"の形式で入力してください。");
        return;
    }

    var logtxt = document.getElementById("log-input").value;
    var log = parseLTSVLog(logtxt);
    var len = log.length;
    var newLog = [];
    for(var i=0; i<len; i++){
        if(log[i]["epoch"] >= time) {
            newLog.push(log[i]);
        }
    }
    
    var searchTarget = document.getElementById("search-container");
    createLogTable(searchTarget, newLog); 
}

var searchBtn = document.getElementById("search-button");
searchBtn.addEventListener("click", searchBtnPressed , false);


