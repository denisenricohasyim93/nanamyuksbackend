var express = require('express')
var app = express()

app.post('/add', function(req,res,next){
    req.getConnection(function(error, conn) {
        let soil_sensor_value = req.body.soil_sensor_value;
        let temperature = req.body.temperature;
        let light_intensity = req.body.light_intensity;
        let pot = {
            soil_sensor_value: soil_sensor_value,
            temperature: temperature,
            light_intensity: light_intensity
        }    
        conn.query("INSERT INTO pots SET ? ", pot, function (error, results, fields) {
            if (error) throw error;
            return res.send({ error: false, data: results, message: 'New pot has been created successfully.' });
        });
    })
})

module.exports = app