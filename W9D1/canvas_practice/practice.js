const canvasDiv = document.getElementById("mycanvas");
canvasDiv.setAttribute("height", 500)
canvasDiv.setAttribute("width", 500)
const ctx = canvasDiv.getContext('2d');
ctx.fillStyle = 'red';
ctx.fillRect(20, 10, 150, 100)

ctx.beginPath();
ctx.arc(200, 175, 50, 0, 2 * Math.PI);
ctx.strokeStyle = 'green';
ctx.stroke();
ctx.lineWidth = 2;
ctx.fillStyle = "blue";
ctx.fill();

document.addEventListener("DOMContentLoaded", function(){

});
