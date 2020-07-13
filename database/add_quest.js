var db = require('./database')

var json = {
  Store_num: null,
  User_num: 5,
  Quest_Users: 'cp',
  Quest_kind: 'advice',
  Quest_detail: 'the ui should be more pretty',
  Quest_status: 'unhandled',
  Quest_days: 1
}

db.addQuest(json)
