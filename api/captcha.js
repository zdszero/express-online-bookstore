const mycaptcha = require('svg-captcha')
function getCaptcha (req, res, next) {
  const captcha = mycaptcha.create({
    inverse: true,
    fontSize: 36,
    noise: 0,
    width: 80,
    height: 30
  })
  console.log('generate captcha: ' + captcha.text)
  // save captcha to coockie for later check, ignore case
  res.cookie('captcha', captcha.text.toLowerCase())
  // tell browser type of data received
  res.setHeader('Content-Type', 'image/svg+xml')
  // write picture data
  res.write(String(captcha.data))
  res.end()
}

exports.getCaptcha = getCaptcha
