/*  tableSort.js
djb + gak, 2011-06-15
updated djb 2014-08-16
sort a three-column table
sorting:
Nicholas C. Zakas, Professional JavaScript for Web Developers, ch. 12
string trimming: ibid, pp 205-06
http://stackoverflow.com/questions/6551300/where-did-the-old-object-go
 */
function sort() {
    /* cellIndex is global in order to be accessible in sort routines, to sort by correct column */
    cellIndex = this.cellIndex;
    /* type identifies alpha vs numeric based on datatype in same horiz position in first row of tbody*/
    cellValue = document.getElementsByTagName('tbody')[0].rows[0].cells[cellIndex].innerText;
    var type = isNaN(cellValue) ? 'alpha': 'numeric';
    /* sort routines from Nicholas C. Zakas, Professional JavaScript for Web Developers, ch. 12 */
    var oldTable = document.getElementsByTagName('table')[0];
    var oldTableBody = oldTable.tBodies[0];
    var oldTableRows = oldTableBody.rows;
    var newTableArray = new Array();
    for (var i = 0, rowCount = oldTableRows.length; i < rowCount; i++) {
        newTableArray.push(oldTableRows[i]);
    }
    if (type == 'numeric') {
        newTableArray.sort(sortNumeric);
    } else {
        newTableArray.sort(sortAlpha);
    }
    var newFragment = document.createDocumentFragment();
    for (var i = 0, rowCount = newTableArray.length; i < rowCount; i++) {
        newFragment.appendChild(newTableArray[i]);
    }
    oldTableBody.appendChild(newFragment);
}
function sortAlpha(a, b) {
    /* cellIndex determines column on which to sort */
    a = a.cells[cellIndex].firstChild.nodeValue.toLowerCase();
    b = b.cells[cellIndex].firstChild.nodeValue.toLowerCase();
    return a.localeCompare(b);
}
function sortNumeric(a, b) {
    /* cellIndex determines column on which to sort */
    a = parseInt(a.cells[cellIndex].firstChild.nodeValue, '10');
    b = parseInt(b.cells[cellIndex].firstChild.nodeValue, '10');
    return ((a < b) ? - 1: ((a > b) ? 1: 0));
}
function init() {
    var columns = document.getElementsByTagName('th');
    for (var i = 0, length = columns.length; i < length; i++) {
        columns[i].addEventListener('click', sort, false);
    }
}
window.onload = init;