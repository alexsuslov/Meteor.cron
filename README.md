Meteor.cron
===========
Simple Meteor cron service

Use:

    world= ->
      console.log 'World!'

    @crone = new Meteor.Cron
      events:
        "* * * * *": world
