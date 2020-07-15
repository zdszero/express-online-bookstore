var express = require('express')
var router = express.Router()
var database = require('../database/database')
var captcha = require('../api/captcha')
const { log } = require('debug')

var products = []
var tags = []

/* GET home page. */
router.get('/', async function (req, res, next) {
  products = await database.get('select * from t_Book')
  let kind1 = await database.get('select distinct Book_kind1 from t_Book')
  kind1 = kind1.map(book => { return { kind: book.Book_kind1 } })
  let kind2 = await database.get('select distinct Book_kind2 from t_Book where Book_kind2 is not null')
  kind2 = kind2.map(book => { return { kind: book.Book_kind2 } })
  let kind3 = await database.get('select distinct Book_kind3 from t_Book where Book_kind3 is not null')
  kind3 = kind3.map(book => { return { kind: book.Book_kind3 } })
  tags = [...new Set([...kind1, ...kind2, ...kind3])]
  res.render('index', {
    products: products,
    startPage: 1,
    tags: tags,
    isFirst: true
  })
})

router.get('/:page(\\d+)/', (req, res) => {
  const curPage = req.params.page
  res.render('index', {
    products: products,
    startPage: curPage,
    tags: tags,
    isFirst: false
  })
})

router.get('/searchBooks', async (req, res) => {
  let sql = 'select * from t_Book where'
  const tag = req.query.tagContent
  const search = req.query.searchContent
  let needAnd = false
  if (tag !== '') {
    sql += ` "${tag}" in (Book_kind1, Book_kind2, Book_kind3)`
    needAnd = true
  }
  if (search !== '') {
    if (needAnd === true) {
      sql += ' and'
    }
    sql += ` Book_name like "%${search}%"`
  }
  const searchBooks = await database.get(sql)
  // console.log(searchBooks)
  res.render('index', {
    products: searchBooks,
    startPage: 1,
    tags: tags,
    isFirst: false
  })
})

router.get('/admin', (req, res) => {
  res.sendfile('./public/pages/admin_login.html')
})

router.get('/adminManage', async (req, res) => {
  const quests = await database.get('select * from t_Quest')
  res.render('admin_manage', {
    quests: quests
  })
})

router.get('/captcha', (req, res, next) => {
  captcha.getCaptcha(req, res, next)
})

router.get('/clientHome', async (req, res, next) => {
  const usernum = req.cookies.usernum
  const userInfo = await database.get('select * from t_Users where User_num = ?', [usernum])
  const orders = await database.get('select * from t_Order where User_num = ?', [usernum])
  res.render('client_home', { user: userInfo[0], orders: orders })
})

router.get('/storeHome/:storenum', async (req, res) => {
  const storenum = req.params.storenum
  const storeInfo = await database.get('select * from t_Store where Store_num = ?', [storenum])
  const booksInfo = await database.get('select * from t_Book where Store_num = ?', [storenum])
  const books = []
  booksInfo.forEach(book => {
    books.push({
      booknum: book.Book_num,
      bookname: book.Book_name
    })
  })
  storeInfo[0].books = books
  res.render('store_home', { store: storeInfo[0] })
})

router.get('/manageStore', async (req, res) => {
  const usernum = req.cookies.usernum
  const storeInfo = await database.get('select * from t_Store where User_num = ?', [usernum])
  const orders = await database.get('select * from t_Order where Order_Store = ?', [storeInfo[0].Store_name])
  const books = await database.get('select * from t_Book where Store_num = ?', [storeInfo[0].Store_num])
  res.render('store_manage', {
    orders: orders,
    books: books
  })
})

router.get('/hello/:name', (req, res) => {
  console.log(req.params.name)
  res.send('hello ' + req.params.name + '!')
})

router.get('/bookHome/:booknum', async (req, res) => {
  const booknum = req.params.booknum
  console.log(booknum)
  const bookInfo = await database.get('select * from t_Book where Book_num = ?', [booknum])
  console.log(bookInfo[0])
  res.render('book_home', { book: bookInfo[0] })
})

router.get('/addBookPage', (req, res) => {
  res.render('add_book')
})

router.post('/loginReq', async (req, res) => {
  const username = req.body.username
  const password = req.body.password
  const result = await database.get('select * from t_Users where User_account = ? and User_pass = password(?)', [username, password])
  if (result.length === 0) {
    res.json({ code: -1 })
  } else {
    console.log(result[0])
    const usernum = result[0].User_num
    res.cookie('usernum', usernum, {
      maxAge: 1000 * 3600 * 24 * 2 // 2 days
    })
    res.json({ code: 0 })
  }
})

router.post('/adminLoginReq', async (req, res) => {
  const username = req.body.username
  const password = req.body.password
  const result = await database.get('select * from t_Admin where Admin_account = ? and Admin_pass = password(?)', [username, password])
  if (result.length === 0) {
    res.json({ code: -1 })
  } else {
    res.json({ code: 0 })
  }
})

router.post('/registerReq', async (req, res) => {
  const maxUserNum = await database.get('select max(User_num) from t_Users')
  const maxStoreNum = await database.get('select max(Store_num) from t_Store')
  const storeExist = await database.get('select * from t_Store where Store_name = ?', [req.body.storename])
  if (req.cookies.captcha !== req.body.captcha) {
    res.json({ code: 1 })
  } else if (storeExist.length !== 0) {
    res.json({ code: 2 })
  } else {
    database.addUser(req.body)
    if (req.body.status === 'merchant') {
      const store = {
        User_num: maxUserNum[0]['max(User_num)'] + 1,
        Store_name: req.body.storename,
        Store_owner: req.body.name,
        Store_mark: 5 + Math.floor(Math.random() * 5)
      }
      database.addStore(store)
      database.put('update t_Users set Store_num = ? where User_num = ?', [maxStoreNum[0]['max(Store_num)'] + 1, store.User_num])
    }
    res.json({ code: 0 })
  }
})

router.post('/addBook', async (req, res) => {
  console.log(req.body)
  const usernum = req.cookies.usernum
  const storeInfo = await database.get('select * from t_Store where User_num = ?', [usernum])
  const book = { ...req.body }
  book.Store_num = storeInfo[0].Store_num
  book.Book_Store = storeInfo[0].Store_name
  console.log(book)
})

router.post('/isMerchant', async (req, res) => {
  const usernum = req.cookies.usernum
  const userInfo = await database.get('select * from t_Users where User_num = ?', [usernum])
  if (userInfo[0].User_status === 'merchant') {
    res.json({ code: 0 })
  } else {
    res.json({ code: 1 })
  }
})

router.post('/addProduct', async (req, res) => {
  database.addOrder(req.body)
  const book = await database.get('select * from t_Book where Book_num = ?', [req.body.booknum])
  res.json({
    image: book[0].Book_picture,
    title: book[0].Book_name,
    amount: 1,
    id: book[0].Book_num,
    price: book[0].Book_price
  })
})

router.post('/addQuest', async (req, res) => {
  const user = await database.get('select * from t_Users where User_num = ?', [req.cookies.usernum])
  const data = {
    Store_num: null,
    User_num: user[0].User_num,
    Quest_Users: user[0].User_name,
    Quest_kind: req.body.kind,
    Quest_detail: req.body.detail,
    Quest_status: 'unhandled',
    Quest_days: 1
  }
  database.addQuest(data)
  res.json('ok')
})

router.post('/setCart', async (req, res) => {
  const usernum = req.body.usernum
  const cart = await database.get('select * from t_Order where User_num = ? and Order_status = "waiting"', [usernum])
  const cartItems = []
  for (let i = 0; i < cart.length; i++) {
    const book = await database.get('select * from t_Book where Book_num = ?', [cart[i].Book_num])
    cartItems.push({
      image: book[0].Book_picture,
      title: book[0].Book_name,
      amount: cart[i].Order_Booknum,
      id: book[0].Book_num,
      price: book[0].Book_price
    })
  }
  res.json(cartItems)
})

router.post('/increaseProduct', (req, res) => {
  const usernum = req.body.usernum
  const booknum = req.body.booknum
  database.put('update t_Order set Order_Booknum = Order_Booknum + 1 where User_num = ? and Book_num = ?', [usernum, booknum])
  res.send('ok')
})

router.post('/decreaseProduct', (req, res) => {
  const usernum = req.body.usernum
  const booknum = req.body.booknum
  database.put('update t_Order set Order_Booknum = Order_Booknum - 1 where User_num = ? and Book_num = ?', [usernum, booknum])
  res.send('ok')
})

router.post('/removeProduct', (req, res) => {
  const usernum = req.body.usernum
  const booknum = req.body.booknum
  database.put('delete from t_Order where User_num = ? and Book_num = ?', [usernum, booknum])
  res.send('ok')
})

router.post('/changeOrderStatus', (req, res) => {
  const booknum = req.body.booknum
  const usernum = req.cookies.usernum
  database.put('update t_Order set Order_status = "paid" where User_num = ? and Book_num = ?', [usernum, booknum])
  res.json('ok')
})

router.post('/changeOrderStatus2', (req, res) => {
  const orderid = req.body.orderid
  database.put('update t_Order set Order_status = "sending" where Order_num = ?', [orderid])
  res.json('ok')
})

router.post('/updatePrice', (req, res) => {
  const booknum = req.body.booknum
  const price = req.body.price
  database.put('update t_Book set Book_price = ? where Book_num = ?', [price, booknum])
  res.json('ok')
})

router.post('/updateStock', (req, res) => {
  const booknum = req.body.booknum
  const stock = req.body.stock
  database.put('update t_Book set Book_stock = ? where Book_num = ?', [stock, booknum])
  res.json('ok')
})

router.post('/updateQuest', (req, res) => {
  const num = req.body.questNum
  database.put('update t_Quest set Quest_status = "handled" where Quest_num = ?', [num])
  res.json('ok')
})

module.exports = router
