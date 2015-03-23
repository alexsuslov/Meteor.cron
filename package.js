Package.describe({
  summary: "Simple meteor.cron",
  name: 'laboratory:cron',
  version: '0.0.2',
  git: 'https://github.com/Laboratory/Meteor.cron.git'
});
Package.on_use(function (api, where) {
  api.add_files('meteor.cron.js', 'server');
});
