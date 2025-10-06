# Dockerfile
# 1. Dùng image Python làm nền
FROM python:3.9-slim

# 2. Tạo thư mục làm việc trong image
WORKDIR /app

# 3. Sao chép code vào thư mục làm việc
COPY . .

# 4. Cài đặt các thư viện cần thiết
RUN pip install -r requirements.txt

# 5. Ra lệnh cho uvicorn chạy ứng dụng FastAPI
#    --host 0.0.0.0: cho phép truy cập từ bên ngoài container
#    --port 8080: chạy ở cổng 8080
#    app:app: file app.py, đối tượng tên là app
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]