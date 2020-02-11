class Bird{
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.position = {
      width: canvas.width/3,
      height: canvas.height/2
    }
    this.ctx = canvas.getContext("2d");
  }

  drawBird (ctx){
    ctx.fillStyle = "red";
    ctx.fillRect(this.position.width, this.position.height, 10, 10);
  } 

  animate (){
    this.drawBird(this.ctx);
  }

}

export default Bird;
