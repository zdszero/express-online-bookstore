var XSLX = require('xlsx')
var database = require('./database')

const workbook = XSLX.readFile('./Data2.xslx')
// worksheet list
const worksheets = workbook.Sheets
// get the first workshhet
const worksheet = worksheets.Sheet1

// omit booknum and bookmark
for (let row = 2; row <= 52; row++) {
  const json = {
    Store_num: worksheet['B' + row].v,
    Book_Store: worksheet['C' + row].v,
    Book_kind1: worksheet['D' + row].v,
    Book_kind2: worksheet['E' + row] === undefined ? null : worksheet['E' + row].v,
    Book_kind3: worksheet['F' + row] === undefined ? null : worksheet['F' + row].v,
    Book_name: worksheet['G' + row].v,
    Book_writer: worksheet['H' + row].v,
    Book_pub: worksheet['I' + row].v,
    Book_pubnum: worksheet['J' + row].v,
    Book_intro: worksheet['K' + row].v,
    Book_price: worksheet['L' + row].v,
    Book_picture: worksheet['M' + row].v,
    Book_stock: worksheet['N' + row].v
  }
  // console.log(json)
  database.addBook(json)
}
