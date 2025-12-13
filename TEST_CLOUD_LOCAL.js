import { v2 as cloudinary } from 'cloudinary';
import dotenv from 'dotenv';
dotenv.config();

console.log("=== KIEM TRA KET NOI CLOUDINARY (LOCAL) ===");
console.log("Cloud Name:", process.env.CLOUDINARY_CLOUD_NAME);
console.log("API Key:", process.env.CLOUDINARY_API_KEY ? "******" + process.env.CLOUDINARY_API_KEY.slice(-4) : "MISSING");
console.log("API Secret:", process.env.CLOUDINARY_API_SECRET ? "EXISTS" : "MISSING");

if (!process.env.CLOUDINARY_CLOUD_NAME || !process.env.CLOUDINARY_API_KEY || !process.env.CLOUDINARY_API_SECRET) {
    console.error("❌ THIEU THONG TIN DANG NHAP TRONG FILE .ENV");
    process.exit(1);
}

cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME.trim(),
    api_key: process.env.CLOUDINARY_API_KEY.trim(),
    api_secret: process.env.CLOUDINARY_API_SECRET.trim()
});

cloudinary.api.ping()
    .then(res => {
        console.log("✅ KET NOI THANH CONG! (STATUS: OK)");
        console.log("Thong tin tra ve:", res);
    })
    .catch(err => {
        console.error("❌ KET NOI THAT BAI!");
        console.error("Loi cu the:", err.message);
        if (err.http_code === 401) console.error("=> SAI API KEY HOAC API SECRET");
        if (err.http_code === 404) console.error("=> SAI CLOUD NAME");
    });
