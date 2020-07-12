var db = require('./database')

var user = {
  account: 'scj',
  password: '987654',
  name: 'Chengjie Shi',
  phone: '14282932932',
  email: '353324432@qq.com',
  addr: 'Hebei Xingtai',
  status: 'merchant'
}

db.addUser(user)
