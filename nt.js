function overlay(id,text,url) {
    //http://answers.oreilly.com/topic/1823-adding-a-page-overlay-in-javascript/
    
    
    if (document.getElementById(id)) return; 
    var overlay = document.createElement("div");
    var XMousePos = window.event.clientX;
    var Ypos = window.event.clientY;
    var windowWidth = window.innerWidth;
    if (windowWidth - XMousePos > 300) {
        var Xpos = XMousePos
    } else {
        var Xpos = windowWidth - 310
    };
    overlay.setAttribute("id", id);
    overlay.setAttribute("style", "z-index: 10; background-color: white; position: absolute; left: " + Xpos + "px; top: " + Ypos + "px; border: 2px solid black; width: 300px; padding: 2px; margin: 0;")
    overlay.setAttribute("onclick", "document.body.removeChild(document.getElementById('" + id + "'))");
    overlay.setAttribute("class", "overlay");
    overlay.innerHTML = "<div>" + text + "</div>";
    document.body.appendChild(overlay);
}
