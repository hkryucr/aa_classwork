import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs"

const Root = ()=>{
    const tabsArr = [
      { title: "one", content: "I am the first" },
      { title: "two", content: "Second pane here" },
      { title: "three", content: "Third pane here" }
    ];
    return (
      <div>
        <Clock />
        <Tabs tabs={tabsArr} />
      </div>
    );
  }

document.addEventListener("DOMContentLoaded", () => {

  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);
});