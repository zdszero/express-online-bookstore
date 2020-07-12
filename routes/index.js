var express = require('express')
var router = express.Router()
var database = require('../database/database')
var captcha = require('../api/captcha')

var products = []

/* GET home page. */
router.get('/', async function (req, res, next) {
  const rawProducts = await database.get('select * from t_Book')
  products = rawProducts.map((item) => {
    return {
      id: item.Book_num,
      price: item.Book_price,
      title: item.Book_name,
      image: item.Book_picture,
      store: item.Book_Store,
      storenum: item.Store_num
    }
  })
  // console.log(products)
  res.render('index', { products: products })
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

router.get('/storeHome', (req, res) => {
  res.render('storeHome')
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

router.post('/addBook', async (req, res) => {
  console.log(req.body)
  const usernum = req.cookies.usernum
  const storeInfo = await database.get('select * from t_Store where User_num = ?', [usernum])
  const book = { ...req.body }
  book.Store_num = storeInfo[0].Store_num
  book.Book_Store = storeInfo[0].Store_name
  console.log(book)
})

router.post('/addProduct', async (req, res) => {
  console.log(req.body)
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

router.post('/setCart', async (req, res) => {
  const usernum = req.body.usernum
  const cart = await database.get('select * from t_Order where User_num = ?', [usernum])
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

module.exports = router
