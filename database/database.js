var mysql = require('mysql')

var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123',
  database: 'hello_book'
})

function end () {
  conn.end()
}

function put (stmt, todo = []) {
  conn.query(stmt, todo, (err, result) => {
    if (err) {
      console.log('error!')
      throw err
    }
    console.log(result)
  })
}

function get (stmt, todo = []) {
  return new Promise((resolve, reject) => {
    conn.query(stmt, todo, (err, result) => {
      if (err) {
        console.log('error!')
        reject(err)
      }
      resolve(result)
    })
  })
}

function randomID () {
  const id = Math.random().toString()
  return id.substring(2, 12)
}

function addUser (data) {
  const sql = `insert into t_Users(User_account, User_pass, User_name, User_ID, User_phone, User_mail, User_addr, User_status)
               values(?,?,?,?,?,?,?,?);`
  const todo = [data.account, data.password, data.name, randomID(), data.phone, data.email, data.addr, data.status]
  // console.log(sql, todo)
  put(sql, todo)
}

function addBook (data) {
  const sql = `insert into t_Book(Store_num, Book_Store, Book_kind1, Book_kind2, Book_kind3, Book_name, Book_writer, Book_pub, Book_pubnum, Book_intro, Book_price, Book_picture, Book_stock, Book_mark)
               values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)`
  const todo = [
    data.Store_num,
    data.Book_Store,
    data.Book_kind1,
    data.Book_kind2,
    data.Book_kind3,
    data.Book_name,
    data.Book_writer,
    data.Book_pub,
    data.Book_pubnum,
    data.Book_intro,
    data.Book_price,
    data.Book_picture,
    data.Book_stock,
    data.Book_mark
  ]
  put(sql, todo)
}

function addComment (data) {
  const sql = `insert into t_Comment(User_num, Store_num, Order_num, Comment_ID,  Comment_detail, Comment_mark)
               values(?,?,?,?,?,?)`
  const todo = [
    data.User_num,
    data.Store_num,
    data.Order_num,
    randomID(),
    data.Comment_detail,
    data.Comment_mark
  ]
  put(sql, todo)
}

function addStore (data) {
  const sql = `insert into t_Store(User_num, Store_name, Store_owner, Store_mark)
               values(?,?,?,?)`
  const todo = [
    data.User_num,
    data.Store_name,
    data.Store_owner,
    data.Store_mark
  ]
  put(sql, todo)
}

// data: Book_num, User_num, Store_num
async function addOrder (data) {
  const sql = `insert into t_Order(Book_num, User_num, Order_id, Order_Users, Order_Store, Order_Price, Order_Phone, Order_addr, Order_Status, Order_Book, Order_Booknum, Order_Receiver)
               values(?,?,?,?,?,?,?,?,?,?,?,?)`
  const userInfo = await get('select * from t_Users where User_num = ?', [data.usernum])
  const bookInfo = await get('select * from t_Book where Book_num = ?', [data.booknum])
  const todo = [
    bookInfo[0].Book_num,
    userInfo[0].User_num,
    randomID(),
    userInfo[0].User_name,
    bookInfo[0].Book_Store,
    bookInfo[0].Book_price,
    userInfo[0].User_phone,
    userInfo[0].User_addr,
    'waiting',
    bookInfo[0].Book_name,
    1,
    userInfo[0].User_name
  ]
  // console.log(todo)
  put(sql, todo)
}

function addQuest (data) {
  const sql = `insert into t_Quest(Store_num, User_num, Quest_Users, Quest_kind, Quest_detail, Quest_status, Quest_days)
               values(?,?,?,?,?,?,?)`
  const todo = [
    data.Store_num,
    data.User_num,
    data.Quest_Users,
    data.Quest_kind,
    data.Quest_detail,
    data.Quest_status,
    data.Quest_days
  ]
  put(sql, todo)
}

module.exports.get = get
module.exports.put = put
module.exports.end = end
module.exports.addUser = addUser
module.exports.addBook = addBook
module.exports.addComment = addComment
module.exports.addStore = addStore
module.exports.addOrder = addOrder
module.exports.addQuest = addQuest
