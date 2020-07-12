var db = require('./database')

var json = {
  User_num: 9,
  Store_name: 'storeC',
  Store_owner: 'scj',
  Store_mark: 8
}

db.addStore(json)
