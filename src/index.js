const express = require('express');
const bodyParser = require('body-parser')
const jwt = require('./infra/security/jwt')
const whitelist = require('./whitelist')

const app = express();
app.use(bodyParser.json())

const finish = (req, res, status) => {
  res.status(status)
  res.end()
  console.log('Finishing with status', status, 'body', req.body);
}

const login = (req, res) => {
  const body = req.body

  if (!body || !body.username) {
    return finish(req, res, 400)
  }
  const username = body.username
  console.log('Trying logging', username)
  if (!whitelist.includes(username)) {
    return finish(req, res, 401)
  }

  const claim = { username }

  const token = jwt.sign(claim, { expiresIn: '2h' })
  res.send({ token, employeeData: claim })
  console.log('User logged', claim)
}

app.post('/login', login)

app.listen(3000, '0.0.0.0', function () {
  console.log('Example app listening on port 3000!')
});
