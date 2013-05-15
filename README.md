Meteor.cron
===========
Simple Meteor cron service

Use:

    world= function (){
      console.log('World!');
    }

    @crone = new Meteor.Cron{
      events:{
        "* * * * *": "world"
      }
    }
