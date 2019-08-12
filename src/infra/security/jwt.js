const jwt = require('jsonwebtoken')

const KEY = 'justanewkey'
const ALG = 'HS256'

const sign = (claim, { expiresIn }) => jwt.sign(claim, KEY, {
    algorithm: ALG,
    expiresIn
  })

const verify = token => jwt.verify(token, KEY, {
    algorithm: ALG
})

module.exports = {
  sign,
  verify
}
