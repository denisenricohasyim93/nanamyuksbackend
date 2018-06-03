var express = require('express')
var app = express()

app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM users ORDER BY user_id DESC',function(err, rows, fields) {
            if (error) throw error;
            return res.send({ error: false, data: rows, message: 'Users data successfully retrieved' });
        })
    })
})

app.post('/add', function(req,res,next){
    req.getConnection(function(error, conn) {
        let name = req.body.name;
        let age = req.body.age;
        let email = req.body.email;
        let password = req.body.password;
        let user = {
            name: name,
            age: age,
            email: email,
            password: password
        }    
        conn.query("INSERT INTO users SET ? ", user, function (error, results, fields) {
            if (error) throw error;
            return res.send({ error: false, data: results, message: 'New user has been created successfully.' });
        });
    })
})

app.put('/edit', function(req, res, next) {
    req.getConnection(function(error, conn) {
        let user_id = req.body.user_id;
        let name = req.body.name;
        let age = req.body.age;
        let email = req.body.email;
        let password = req.body.password;
        let user = {
            name: name,
            age: age,
            email: email,
            password: password
        }  
        conn.query('UPDATE users SET ? WHERE user_id = ' + user_id, user, function(err, result) {
            if (error) throw error;
            return res.send({ error: false, data: result, message: 'User successfully updated' });
        })
    })
})

app.delete('/delete', function (req, res) {
    req.getConnection(function(error, conn) {
        let user_id = req.body.user_id;
    
        if (!id) {
            return res.status(400).send({ error: true, message: 'Please provide id' });
        }
        conn.query('DELETE FROM users WHERE user_id = ?', [user_id], function (error, results, fields) {
            if (error) throw error;
            return res.send({ error: false, data: results, message: 'user has been deleted successfully.' });
        });
    })
});   

module.exports = app