const express = require('express');
const bodyParser = require('body-parser')
const jwt = require('./infra/security/jwt')

const app = express();
app.use(bodyParser.json())

const login = (req, res) => {
  const body = req.body

  if (!body || !body.username) {
    res.status(400)
    res.end()
    return
  }

  const claim = { username: body.username }

  const token = jwt.sign(claim, { expiresIn: '2h' })
  res.send({ token, employeeData: claim })
}

app.post('/login', login)

app.listen(3000, '0.0.0.0', function () {
  console.log('Example app listening on port 3000!')
});
