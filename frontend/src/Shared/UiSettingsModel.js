var Backbone = require('backbone');

var UiSettings = Backbone.Model.extend({
  url: window.Sonarr.ApiRoot + '/config/ui',

  shortDateTime: function(includeSeconds) {
    return this.get('shortDateFormat') + ' ' + this.time(true, includeSeconds);
  },

  longDateTime: function(includeSeconds) {
    return this.get('longDateFormat') + ' ' + this.time(true, includeSeconds);
  },

  time: function(includeMinuteZero, includeSeconds) {
    if (includeSeconds) {
      return this.get('timeFormat').replace(/\(?\:mm\)?/, ':mm:ss');
    }
    if (includeMinuteZero) {
      return this.get('timeFormat').replace('(', '').replace(')', '');
    }

    return this.get('timeFormat').replace(/\(\:mm\)/, '');
  }
});

module.exports = new UiSettings();