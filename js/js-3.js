// 課題 JS-3 の実装をここに記述してください。

var tableBtnPressed = function() {
    var target = document.getElementById("table-container");
    var txt = document.getElementById("log-input").value;

    var log = parseLTSVLog(txt);
    console.log(target);
    createLogTable(target, log); 
}

var btn = document.getElementById("submit-button");

btn.addEventListener("click", tableBtnPressed , false);


