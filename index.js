
const express = require('express')
const app = express()
const port = 8080

app.get('/', (req, res) => {
    console.log("Call received")
    res.send({ "status": true })
})

app.get('/fail', (req, res) => {
    console.log("Fail call received")
    res.send({ "status": false })
})

app.get('/final', (req, res) => {
    console.log("Final call received")
    res.send({ "message": "Parabéns, você concluiu o workshop" })
})

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`)
})