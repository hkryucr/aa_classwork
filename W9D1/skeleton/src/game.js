import Level from './level'
import Bird from './bird'

export default class FlappyBird {
  constructor(canvas){
    this.canvas = canvas;
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  animate(level){
    level.drawBackground(this.ctx);
  }

  restart(){
    const newLevel = new Level(this.dimensions);
    this.level = newLevel;
    this.animate(this.level);
    this.bird = new Bird(this.canvas);
    this.bird.animate();
  }



}