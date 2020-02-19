import React from "react";

class Tabs extends React.Component{
    constructor(props){
        super(props);
        
        this.state = { tabsIdx: 0 };
    }
    changeContent(e){
        if (e.target.innerText === "one") {
            this.setState({ tabsIdx: 1 })
        } else if (e.target.innerText === "two") {
            this.setState({ tabsIdx: 2 });
        } else {
            this.setState({ tabsIdx: 3 });
        }
    }

    render(){
        const curTab = this.props.tabs[this.state.tabsIdx].content;
        const headers = this.props.tabs.map((ele, idx)=>{
            return (
              <div onClick={this.changeContent} key={idx}>
                {ele.title}
              </div>
            );
        });
        
        return (
          <div className="tabs">
            <h1>Tabs</h1>
            <ul className="tabs-container">
              <div className="tabs-button">{headers}</div>
              <div className="tabs-item-container">
                <article className="tabs-item">{curTab}</article>
              </div>
            </ul>
          </div>
        );
    }
}

export default Tabs;