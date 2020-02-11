import FlappyBird from './game';
import Level from './level';

const canvas = document.getElementById('bird-game');
console.log(canvas)
const newFlappyBird = new FlappyBird(canvas);
newFlappyBird.restart();