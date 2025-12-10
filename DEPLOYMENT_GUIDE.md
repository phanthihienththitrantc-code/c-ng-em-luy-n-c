# Hướng dẫn đưa ứng dụng lên Internet và Lưu trữ Dữ liệu Lâu dài

Để đảm bảo ứng dụng chạy ổn định và **không bị mất file ghi âm** khi server khởi động lại, bạn cần sử dụng dịch vụ lưu trữ đám mây Cloudinary (Miễn phí).

## Bước 1: Tạo tài khoản Cloudinary (Để lưu file)
1. Truy cập [Cloudinary.com](https://cloudinary.com/) và đăng ký tài khoản miễn phí.
2. Tại trang **Dashboard**, bạn sẽ thấy thông tin "Product Environment Credentials" bao gồm:
   - **Cloud Name**
   - **API Key**
   - **API Secret**
   *(Lưu lại 3 thông tin này)*

## Bước 2: Tạo dịch vụ trên Render
1. Truy cập [Render.com](https://render.com) và chọn **"New +"** -> **"Web Service"**.
2. Chọn repository chứa mã nguồn của bạn.
3. Điền các thông tin:
   - **Name**: Tên ứng dụng (ví dụ: `cung-em-luyen-doc`).
   - **Region**: Singapore.
   - **Runtime**: **Node**.
   - **Build Command**: `npm install && npm run build`
   - **Start Command**: `npm start`
   - **Plan**: Free.

## Bước 3: Cấu hình Biến Môi Trường (Environment Variables) - QUAN TRỌNG
Bạn cần thiết lập các biến môi trường để ứng dụng hoạt động đầy đủ tính năng (Lưu trữ, Cơ sở dữ liệu, AI).

1. Tại trang quản lý dịch vụ trên Render, chọn tab **"Environment"**.
2. Nhấn **"Add Environment Variable"** và thêm các biến sau:

   | Key | Value (Mô tả) |
   | --- | --- |
   | `MONGODB_URI` | Chuỗi kết nối MongoDB Atlas (bắt đầu bằng `mongodb+srv://...`). *Nếu chưa có, bạn cần tạo database trên [MongoDB Atlas](https://www.mongodb.com/cloud/atlas).* |
   | `CLOUDINARY_CLOUD_NAME` | Lấy từ Cloudinary Dashboard. |
   | `CLOUDINARY_API_KEY` | Lấy từ Cloudinary Dashboard. |
   | `CLOUDINARY_API_SECRET` | Lấy từ Cloudinary Dashboard. |
   | `GEMINI_API_KEY` | Khóa API Gemini của bạn (để chấm điểm đọc). |
   | `VITE_API_BASE_URL` | (Để trống hoặc điền `/`) |

3. Nhấn **"Save Changes"**. Server sẽ tự động khởi động lại.

---

### Lưu ý về Dữ liệu
Hiện tại ứng dụng đã hỗ trợ **MongoDB**.
- Nếu bạn cấu hình `MONGODB_URI`: Toàn bộ dữ liệu bài học, học sinh, và liên kết file ghi âm sẽ được lưu an toàn trên cơ sở dữ liệu đám mây. Dữ liệu **số không bị mất** khi Render khởi động lại.
- Nếu **KHÔNG** cấu hình `MONGODB_URI`: Ứng dụng sẽ chạy ở chế độ tạm thời (sử dụng file JSON và file tạm). Dữ liệu sẽ bị mất mỗi khi Server Render khởi động lại (do gói Free).
**Khuyên dùng:** Hãy đăng ký MongoDB Atlas (Miễn phí 512MB) để dữ liệu luôn được an toàn.
