// 課題 JS-3 の実装をここに記述してください。

function btnClosure(first) {
    var cnt = first;

    return function() {
        var target = document.getElementById("table-container");

        if(cnt%2 == 0) {
            var txt = document.getElementById("log-input").value;

            var log = parseLTSVLog(txt);
            createLogTable(target, log); 
        } else {
            target.removeChild(target.firstChild);
        }

        return ++cnt;
    }
}

var tableBtnPressed = btnClosure(0);
var btn = document.getElementById("submit-button");

btn.addEventListener("click", tableBtnPressed , false);


