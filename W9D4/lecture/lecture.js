/*
webapi
- a server-side web API is a programmatic interface consisting of one or more publicly exposed endpoints to a defined request-response message system, typically expressed in JSON or XML, which is exposed via the web - most commonly by means of an HTTP-based web server.

AJAX
Asynchronous Javascript and XML
An HTTP request that happens in the background

Promises
- represent the eventual completion of an asynchronous operation andits rresulting value.
- A promise is an object that wraps an action , which is the task(typically async) it is supposed to perform beforre it either fails or succeeds based on some constraint.
- allows complex asynchrounous ...

Promise API
- then is the most important promise method
    - takes a success callback and a fauilure callback as args
    - returns a new prormise
    - can therefor chain as many times as you want

- A prormise chain stops if there's an exception and looks for failurer callback in next then, or rif there is none, down the chain for a catch.

States of a Promise
- pending
- settled
    - Fulfilled: sucess callback in then will run
    - Rejected: Failure callback in then or catch will run    

*/
// Demo

// let myFirstPormise = new Promise((resolve, reject)=>{


//     setTimeout(function(){
//         resolve("success");
//         // reject("failure")
//     }, 5000)


// })


// myFirstPormise.then((successMessage)=>{
//     console.log("Yay" + successMessage)
// })
// .catch((failureMessage)=>{
//     console.log("boo!!.." + failureMessage);
// });


// myFirstPormise
//     .then((successMessage) => {
//         console.log("Yay" + successMessage)
//     })
//     .then(()=>{
//         setTimeout(()=>{
//             console.log('yes')
//         }, 5000)
//     });


// function hi (func){
//     func("hi")
// }

// hi((el)=>{
//     console.log(el);
// })
// console.log("hi2")

