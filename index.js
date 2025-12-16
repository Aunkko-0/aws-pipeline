// index.js

const express = require('express');
const app = express();
const port = 3000;

// กำหนด route หลัก (/)
app.get('/', (req, res) => {
  // ส่งข้อความ JSON ตอบกลับ
  res.status(200).json({
    greeting: 'สวัสดี! Node.js Server ทำงานอยู่',
    status: 'Running',
    date: new Date().toISOString()
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Node.js Server กำลังรอการเชื่อมต่อที่พอร์ต ${port}`);
  console.log('พร้อมที่จะกล่าวสวัสดีแล้ว!');
});

// ไม่ต้อง export server instance เพราะเราไม่ได้ต้องการทดสอบแยกแล้ว
// module.exports = app;