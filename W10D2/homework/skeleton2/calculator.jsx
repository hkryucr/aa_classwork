import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = {
      num1: "",
      num2: "",
      result: 0
    }
  }

  //your code here
  setNum1(e) {
    // your code here
    this.setState({ num1: parseInt(e.target.value) })
  }
  setNum2(e) {
    // your code here
    this.setState({ num2: parseInt(e.target.value) })
  }

  calcPlus(){
    this.setState( {result: this.state.num1 + this.state.num2 })
  }

  calcMinus() {
    this.setState({ result: this.state.num1 - this.state.num2 })
  }

  calcMultiply() {
    this.setState({ result: this.state.num1 * this.state.num2 })
  }

  calcDivide() {
    this.setState({ result: this.state.num1 / this.state.num2 })
  }

  clear(){
    this.setState({
      num1: "",
      num2: "",
      result: 0
    })
    
  }

  render(){
    const { num1, num2, result } = this.state;
    return (

      <div>
        <h1>{result}</h1>
        <input type="text" onChange={this.setNum1.bind(this)} value={num1}/>
        <input type="text" onChange={this.setNum2.bind(this)} value={num2}/>
        <button onClick={this.clear.bind(this)}>clear</button>
        <br />
        <button onClick={this.calcPlus.bind(this)}>+</button>
        <button onClick={this.calcMinus.bind(this)}>-</button>
        <button onClick={this.calcMultiply.bind(this)}>*</button>
        <button onClick={this.calcDivide.bind(this)}>/</button>
      </div>
    );
  }
}

export default Calculator;
