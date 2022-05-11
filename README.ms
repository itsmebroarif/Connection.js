# Connection JS
---
#### Ngambil Data Dari Sql Jadi Lebih Gampang Cuy



## 1. Installasi Ama Konfig dikit Broh Disini, Ini Controller sama Model Lu Jatohnya wkwk

- Clone kodingan yang ada dimari cuy 
- abis itu install dulu pake npm [npm run configure]
- nah kalo udah coba setting dibagian const db & select tablenya

|     |  A   |   B   |  C  | ... |
| --- | :--: | :---: | :-: | :-: |
| 1   | date | nama |   email  |   pesan  |



## 2. Buat Sebuat Google Apps Script
---

# server.js

```js

// Pastikan Kalian Sudah Menjalankan npm run configure
// panggil semua data yang sudah di install [mysql, express]
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


// Tampilkan data yang ada di tabel
db.query(sql, (err, result) =>{
    // Parse Data
    const users = JSON.parse(JSON.stringify(result));
    console.log("Isi Data Terkini -> ",users);
    app.get('/', (req, res) => {
        res.send(users);
    })
  })
})

// respon aplikasinya ketika server berhasil di jalankan
app.listen(8000, () => {
    console.log('Selamat Jalan Di Comment.js | Developed by : Arif Alexander');
    console.log('Server Jalan Di port 8000');
    console.log('Jalankan Di http://localhost:8000');
})



