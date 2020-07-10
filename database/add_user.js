var db = require('./database')

var user = {
  account: 'cp',
  password: '654321',
  name: 'Pu Cao',
  phone: '18012345678',
  email: '534324432@qq.com',
  addr: 'Hunan Zhangjiajie',
  status: 'merchant'
}

db.addUser(user)
