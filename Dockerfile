# ใช้ Node.js เวอร์ชัน LTS เป็น base image
FROM node:lts-slim

# ตั้งค่า working directory ภายใน container
WORKDIR /usr/src/app

# คัดลอก package.json และ package-lock.json (หรือ yarn.lock)
# ไปยัง working directory เพื่อให้สามารถติดตั้ง dependencies ได้
COPY package*.json ./

# ติดตั้ง dependencies ของโปรเจกต์
RUN npm install

# คัดลอกโค้ดส่วนที่เหลือทั้งหมดของโปรเจกต์ไปยัง working directory
COPY . .

# เปิดเผยพอร์ตที่แอปพลิเคชันจะรัน (สมมติว่าเป็นพอร์ต 3000)
EXPOSE 3000

# กำหนดคำสั่งเริ่มต้นเมื่อ container ถูกรัน
# คำสั่งนี้ขึ้นอยู่กับว่าคุณต้องการรันแอปพลิเคชันอย่างไร (เช่น "start" script ใน package.json)
CMD [ "npm", "start" ]