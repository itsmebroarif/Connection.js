// Pastikan Kalian Sudah Menjalankan (npm run configure) untuk pertama kali
// panggil semua data yang sudah di install [mysql, express, ejs]
const express = require('express');
const mysql = require('mysql');
// use express untuk membuat server backend nya
const app = express();

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db_connect'
})

// View engine tampilan yang akan ada diweb
db.connect((err) => {
 if (err) throw err;
 console.log('MySQL Telah Terhubung');
 
//  Select nama tabel disini
const sql = 'SELECT * FROM users';


db.query(sql, (err, result) =>{
    // Parse Data
    const users = JSON.parse(JSON.stringify(result));
    console.log("Isi Data Terkini -> ",users);
    app.get('/', (req, res) => {
        res.send(users);
    })
  })
})

app.listen(8000, () => {
    console.log('Selamat Jalan Di Comment.js | Developed by : Arif Alexander');
    console.log('Server Jalan Di port 8000');
    console.log('Jalankan Di http://localhost:8000');
})


