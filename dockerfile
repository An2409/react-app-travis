FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


FROM nginx 
#copy tu build theo tu as, chỉ định thư mục copy
# dùng nginx để cóp những file build ra trên web serve, copy đúng vào thư mục dưới mới chạy được. 
# khi start container lên chưa có request, vào request mới xuất hiện
COPY --from=builder /app/build /usr/share/nginx/html