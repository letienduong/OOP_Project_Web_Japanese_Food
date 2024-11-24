-- Sử dụng cơ sở dữ liệu 'web'
Drop database web;
create database web;
USE web;

-- Tạo bảng Account trong MySQL
drop table if exists account;
CREATE TABLE account (
    uID INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(255) DEFAULT NULL,
    pass VARCHAR(255) DEFAULT NULL,
    isSell INT DEFAULT NULL,
    isAdmin INT DEFAULT NULL
);
INSERT INTO account (uID, user, pass, isSell, isAdmin) VALUES
(1, 'admin', '123456', 1, 1),
(2, 'seller1', 'seller123', 1, 0),
(3, 'seller2', 'seller456', 1, 0),
(4, 'customer1', 'cust123', 0, 0),
(5, 'customer2', 'cust456', 0, 0),
(6, 'manager', 'manager789', 1, 1),
(7, 'user1', 'user123', 0, 0),
(8, 'user2', 'user456', 0, 0),
(9, 'shopowner', 'shop123', 1, 0),
(10, 'moderator', 'mod123', 0, 1);
-- Tạo bảng Category trong MySQL
drop table if exists category;
CREATE TABLE category (
    cid INT NOT NULL PRIMARY KEY,
    cname NVARCHAR(50) NOT NULL
);
INSERT INTO category (cid, cname) VALUES
('1', 'Sushi và Sashimi'),
('2', 'Lẩu và Tempura'),
('3', 'Mì Nhật Bản'),
('4', 'Bánh'),
('5', 'Đồ uống');
-- Tạo bảng product trong MySQL
drop table if exists product;
CREATE TABLE product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  image VARCHAR(255),
  price DECIMAL(10,0),
  title VARCHAR(255),
  cateID INT,
  description TEXT
);
INSERT INTO product (id, name, image, price, title, cateID, description) VALUES
(7, 'Trà Xanh Matcha', 'images/tra_xanh_matcha.jpg', 50000, 'Trà xanh nhất Bản nguyên chất', 5, 'Trà xanh Matcha là loại trà xanh nguyên chất đắt giá nhất Nhật Bản'),
(8, 'Rượu Sake', 'images/ruou_sake.jpg', 600000, 'Rượu truyền thống của Nhật Bản', 5, 'Rượu Sake là loại rượu truyền thống của Nhật Bản, được ủ từ gạo'),
(9, 'Sushi Lươn', 'images/sushi_luon.jpg', 350000, 'Sushi vị lươn nướng đậm đà', 1, 'Sushi Lươn là món ăn đặc trưng của lưu niệng sushi Nhật Bản'),
(10, 'Cơm Lươn Unagi', 'images/com_luon_unagi.jpg', 400000, 'Cơm lươn Unagi điều Nhật Bản', 2, 'Cơm Lươn Unagi là món ăn truyền thống nổi tiếng của Nhật Bản'),
(11, 'Okonomiyaki', 'images/okonomiyaki.jpg', 250000, 'Bánh xèo Nhật Bản', 4, 'Okonomiyaki là món bánh xèo truyền thống của Nhật Bản, có nhiều nhân thịt, hải sản'),
(12, 'Takoyaki', 'images/takoyaki.jpg', 150000, 'Bánh bạch tuộc nướng', 4, 'Takoyaki là món bánh hình cầu với nhân bạch tuộc nướng, là món ăn vặt nổi tiếng ở Nhật'),
(13, 'Gyoza', 'images/gyoza.jpg', 120000, 'Hà cảo Nhật Bản', 3, 'Gyoza là món há cảo chiên giòn vỏ mỏng nhân thịt, một món ăn truyền thống Nhật Bản'),
(14, 'Ramen', 'images/ramen.jpg', 200000, 'Mì Ramen Nhật', 3, 'Ramen là món mì được xem là nổi tiếng và được yêu thích nhất ở Nhật Bản'),
(15, 'Katsudon', 'images/katsudon.jpg', 220000, 'Cơm thịt chiên xù', 2, 'Katsudon là món cơm với miếng thịt chiên xù, lớp giò giòn cùng trứng, hành lá...'),
(16, 'Tonkatsu', 'images/tonkatsu.jpg', 230000, 'Thịt heo chiên xù', 2, 'Tonkatsu là món thịt heo chiên xù, lớp vỏ giòn bên ngoài, thịt bên trong mềm, ngọt'),
(17, 'Sukiyaki', 'images/sukiyaki.jpg', 450000, 'Lẩu Sukiyaki', 2, 'Sukiyaki là món lẩu với thịt bò và rau, nấm, sả, hành, gừng, miến'),
(18, 'Shabu Shabu', 'images/shabu_shabu.jpg', 500000, 'Lẩu Shabu Shabu', 2, 'Shabu Shabu là món lẩu với thịt bò và rau, thanh cua và các món gia vị đi kèm'),
(21, 'Onigiri', 'images/onigiri.jpg', 80000, 'Cơm nắm Nhật Bản', 1, 'Onigiri là món cơm nắm truyền thống của Nhật Bản, có nhiều nhân cá, trứng muối...'),
(22, 'Tempura Rau Củ', 'images/tempura_rau_cu.jpg', 160000, 'Rau củ chiên giòn kiểu Nhật', 2, 'Tempura rau củ là món chiên giòn với các loại rau, củ quả của Nhật Bản'),
(24, 'Matcha Ice Cream', 'images/matcha_ice_cream.jpg', 120000, 'Kem trà xanh Matcha', 5, 'Kem Matcha là thành phần chính của bột trà xanh Matcha ngon nhất Nhật Bản'),
(26, 'Sake Nigiri', 'images/sake_nigiri.jpg', 300000, 'Sushi cá hồi tươi', 1, 'Sake Nigiri là món sushi với cá hồi tươi, một trong những loại sushi ngon nhất'),
(27, 'Maguro Nigiri', 'images/maguro_nigiri.jpg', 280000, 'Sushi cá ngừ tươi', 1, 'Maguro Nigiri là món sushi với cá ngừ tươi, thái lát mỏng và đắt giá'),
(28, 'Anago Nigiri', 'images/anago_nigiri.jpg', 320000, 'Sushi lươn biển', 1, 'Anago Nigiri là món sushi với lươn biển, một nguyên liệu quý hiếm ở Nhật Bản'),
(29, 'Hokkagia Sashimi', 'images/hokkagia_sashimi.jpg', 270000, 'Sashimi cá đỏ Nhật', 1, 'Hokkagia Sashimi là món sashimi cá đỏ, thái lát mỏng, là một trong những loại cá ngon nhất ở Nhật Bản'),
(30, 'Tamago Sushi', 'images/tamago_sushi.jpg', 120000, 'Sushi làm ngọt miếng trứng', 1, 'Tamago Sushi là món sushi với miếng trứng làm ngọt, là một trong những loại sushi truyền thống của Nhật Bản');
