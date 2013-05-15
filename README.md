Meteor.cron
===========
Simple Meteor cron service

Use:

    var world= function (){
      console.log('World!');
    }

    var crone = new Meteor.Cron{
      events:{
        "* * * * *": "world"
      }
    }
