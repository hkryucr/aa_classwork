class FollowToggle {
  constructor($el) {
    this.$el = $el;
    this.userId = $el.data("userId");
    this.followState = $el.data("initialFollowState");
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!")
    } else {
      this.$el.text("Unfollow!")
    }
  }
}

module.exports = FollowToggle;