(async () => {
  const db = require('./database')
  const result = await db.get('select * from t_Book')
  console.log(result)
  db.end()
})()
