var express = require('express')
var app = express()

app.get('/', function(req, res, next) {
    req.getConnection(function(error, conn) {
        conn.query('SELECT * FROM pots ORDER BY pot_id DESC',function(err, rows, fields) {
            if (error) throw error;
            return res.send({ error: false, data: rows, message: 'Pots data successfully retrieved' });
        })
    })
})

app.post('/add', function(req,res,next){
    req.getConnection(function(error, conn) {
        let soil_sensor_value = req.body.soil_sensor_value;
        let temperature = req.body.temperature;
        let light_intensity = req.body.light_intensity;
        let user_id = req.body.user_id;
        let pot = {
            soil_sensor_value: soil_sensor_value,
            temperature: temperature,
            light_intensity: light_intensity,
            user_id: user_id
        }    
        conn.query("INSERT INTO pots SET ? ", pot, function (error, results, fields) {
            if (error) throw error;
            return res.send({ error: false, data: results, message: 'New pot has been created successfully.' });
        });
    })
})

app.put('/edit', function(req, res, next) {
    req.getConnection(function(error, conn) {
        let pot_id = req.body.pot_id;
        let soil_sensor_value = req.body.soil_sensor_value;
        let temperature = req.body.temperature;
        let light_intensity = req.body.light_intensity;
        let user_id = req.body.user_id;
        let pot = {
            soil_sensor_value: soil_sensor_value,
            temperature: temperature,
            light_intensity: light_intensity,
            user_id: user_id
        }  
        conn.query('UPDATE pots SET ? WHERE pot_id = ' + pot_id, pot, function(err, result) {
            if (error) throw error;
            return res.send({ error: false, data: result, message: 'Pot successfully updated' });
        })
    })
})

app.delete('/delete', function (req, res) {
    req.getConnection(function(error, conn) {
        let pot_id = req.body.pot_id;
    
        if (!id) {
            return res.status(400).send({ error: true, message: 'Please provide id' });
        }
        conn.query('DELETE FROM pots WHERE pot_id = ?', [pot_id], function (error, results, fields) {
            if (error) throw error;
            return res.send({ error: false, data: results, message: 'Pot has been deleted successfully.' });
        });
    })
});   

module.exports = app