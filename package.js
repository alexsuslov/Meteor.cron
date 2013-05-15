Package.describe({
  summary: "Simple meteor.cron"
});

Package.on_use(function (api, where) {
  api.add_files('meteor.cron.js', 'server');
});