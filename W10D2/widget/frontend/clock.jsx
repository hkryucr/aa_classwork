import React from "react";

class Clock extends React.Component{
    constructor(props){
        super(props)

        // `${curDate.getHours()}:${curDate.getMinutes()}:${curDate.getSeconds()}`;
        this.state = {
          time: new Date()
        };
    }

    componentDidMount(){
        this.timerId = setInterval(()=>{
            const curDate = new Date();
            this.setState({
              time: new Date()
            });
        }, 1000)
        
    }

    render (){
        const newDate = this.state.time;
        const time = `${newDate.getHours()}:${newDate.getMinutes()}:${newDate.getSeconds()} ${
          Intl.DateTimeFormat().resolvedOptions().timeZone
        }`;
        const month = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
        const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        const date = `${days[newDate.getDay()]} ${
          month[newDate.getMonth()]
        } ${newDate.getDate()} ${newDate.getFullYear()}`;

        return (
          <div className="clock">
            <h1>clock</h1>
            <div className="clock-container">
              <div className="clock-time">
                <div>Time: </div>
                <div>{time}</div>
              </div>
              <div className="clock-date">
                <div>Date: </div>
                <div>{date}</div>
              </div>
            </div>
          </div>
        );
    }
}

export default Clock;