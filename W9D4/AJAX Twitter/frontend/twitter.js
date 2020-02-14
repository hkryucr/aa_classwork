const FollowToggle = require("./follow_toggle.js")

$(() => {
  const $buttons = $(".follow-toggle")
  $buttons.each( function(index, el){
    let $el = $(el);
    new FollowToggle($el).render()
    // console.log($el);
  });

})