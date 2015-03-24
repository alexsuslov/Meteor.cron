class Meteor.Cron
  delay:1000*60

  constructor:(options)->
    @events = []
    @delay = options.delay if options?.delay
    @convert(options.events) if options?.events
    @do()
    @watch()

  convert:(events)->
    self = @
    for event of events
      cron = event.split(/\s/)

      isMin = 1 if cron[0] >= 0 and cron[0] <= 59 or cron[0] is '*'
      isHour = 1 if cron[1] >= 0 and cron[1] <= 23 or cron[1] is '*'
      isDate = 1 if cron[2] >= 0 and cron[2] <= 31 or cron[2] is '*'
      isMon = 1 if cron[3] >= 0 and cron[3] <= 12 or cron[3] is '*'
      isDay = 1 if cron[4] >= 0 and cron[4] <= 6 or cron[4] is '*'

      if (isMin &&  isHour && isDate && isMon && isDay)
        self.events.push
          cron:cron
          func:events[event]

  watch:()->
    self = @
    Meteor.setInterval ()->
      self.do()
    , self.delay

  doEvent:(event)->
    cron = event.cron
    isMin = 1       if cron[0] is "" + @now.getMinutes() or cron[0] is '*'
    isHour = 1      if cron[1] is "" + @now.getHours() or cron[1] is '*'
    isDate = 1      if cron[2] is "" + @now.getDate() or cron[2] is '*'
    isMon = 1       if cron[3] is "" + @now.getMonth() or cron[3] is '*'
    isDay = 1       if cron[4] is "" + @now.getDay() or cron[4] is '*'

    if (isMin &&  isHour && isDate && isMon && isDay)
      event.func()

  do:()->
    @now = new Date()
    for event in @events
      @doEvent event
