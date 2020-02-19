import React from "react";

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        // your code here
        this.state = {
            num1: 0,
            num2: 0
        }
    }

    // your code here

    render() {
        return (
            <div>
                <input type="text"/>
                <input type="text"/>
                <button>clear</button>
                <br/>
                <button>+</button>
                <button>-</button>
                <button>*</button>
                <button>/</button>
            </div>
        );
    }
}

export default Calculator;
