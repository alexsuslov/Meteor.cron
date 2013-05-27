Meteor.cron
===========
Simple Meteor cron service

Use:
```
    var world= function (){
      console.log('World!');
    }
    var myBirthDay= function (){
      console.log('my Birth Day!');
    }
    var crone = new Meteor.Cron{
      events:{
        "* * * * *": "world",
        "0 0 18 6 *":"myBirthDay"
      }
    }
```

The time and date fields are:
```
    field           allowed values
    ------          --------------
    minute          0-59
    hour            0-23
    day of month    1-31
    month           1-12 (or names, see below)
    day of week     0-7 (0 or 7 is Sun, or use names)
```
----
```
Run once a year, ie.  "0 0 1 1 *".
Run once a month, ie. "0 0 1 * *".
Run once a week, ie.  "0 0 * * 0".
Run once a day, ie.   "0 0 * * *".
Run once an hour, ie. "0 * * * *".
```
