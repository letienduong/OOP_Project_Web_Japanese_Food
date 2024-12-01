CREATE SCHEMA `wish` ;

CREATE TABLE account (
    UID INT,
    user VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255),
    isSell INT,
    isAdmin INT,
    email VARCHAR(45),
    phoneNumber VARCHAR(45),
    address VARCHAR(200),
    name VARCHAR(45)
);
INSERT INTO account (UID, user, password, isSell, isAdmin, email, phoneNumber, address, name)
VALUES
(1, 'user1', 'password1', 1, 0, 'user1@vn.com', '0912345678', '123 Nguyễn Trãi, Hà Đông', 'Nguyễn Văn A'),
(2, 'user2', 'password2', 0, 1, 'user2@vn.com', '0987654321', '456 Quang Trung, Hà Đông', 'Trần Thị B'),
(3, 'user3', 'password3', 0, 0, 'user3@vn.com', '0123456789', '789 Tô Hiệu, Hà Đông', 'Lê Quang C'),
(4, 'user4', 'password4', 0, 0, 'user4@vn.com', '0911223344', '101 Vạn Phúc, Hà Đông', 'Hoàng Minh D'),
(5, 'user5', 'password5', 0, 0, 'user5@vn.com', '0933445566', '202 Lê Trọng Tấn, Hà Đông', 'Vũ Thị E'),
(6, 'user6', 'password6', 0, 0, 'user6@vn.com', '0944556677', '303 Nguyễn Xiển, Hà Đông', 'Đặng Hải F'),
(7, 'user7', 'password7', 0, 0, 'user7@vn.com', '0912345678', '404 Nguyễn Văn Lộc, Hà Đông', 'Phan Thị G'),
(8, 'user8', 'password8', 0, 0, 'user8@vn.com', '0987654321', '505 Nguyễn Khuyến, Hà Đông', 'Ngô Quang H'),
(9, 'user9', 'password9', 0, 0, 'user9@vn.com', '0123456789', '606 Lê Văn Lương, Hà Đông', 'Trương Minh I'),
(10, 'user10', 'password10', 0, 0, 'user10@vn.com', '0911223344', '707 Hồ Tùng Mậu, Hà Đông', 'Bùi Thị J'),
(11, 'user11', 'password11', 0, 0, 'user11@vn.com', '0933445566', '808 Tô Hiệu, Hà Đông', 'Nguyễn Hải K'),
(12, 'user12', 'password12', 0, 0, 'user12@vn.com', '0944556677', '909 Quang Trung, Hà Đông', 'Lê Thị L'),
(13, 'user13', 'password13', 0, 0, 'user13@vn.com', '0912345678', '1010 Phan Đình Phùng, Hà Đông', 'Võ Quang M'),
(14, 'user14', 'password14', 0, 0, 'user14@vn.com', '0987654321', '1111 Nguyễn Trãi, Hà Đông', 'Trần Hải N'),
(15, 'user15', 'password15', 0, 0, 'user15@vn.com', '0123456789', '1212 Lê Trọng Tấn, Hà Đông', 'Nguyễn Thị O'),
(16, 'user16', 'password16', 0, 0, 'user16@vn.com', '0911223344', '1313 Vạn Phúc, Hà Đông', 'Lê Quang P');

CREATE TABLE category (
    cid INT PRIMARY KEY,
    cname VARCHAR(45)
);
INSERT INTO category (cid, cname)
VALUES
(1, 'Sushi và Sashimi'),
(2, 'Lẩu và Tempura'),
(3, 'Mì Nhật Bản'),
(4, 'Đồ Ngọt'),
(5, 'Đồ uống');

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    image VARCHAR(200),
    price INT,
    title VARCHAR(45),
    cateID INT,
    description VARCHAR(1000),
    FOREIGN KEY (cateID) REFERENCES category(cid) 
);
INSERT INTO product (id, name, image, price, title, cateID, description) VALUES
(1, 'Sushi Cá Hồi', 'images/sushi_ca_hoi.jpg', 300000, 'Món sushi truyền thống với cá hồi tươi ngon', 1, 'Sushi Cá Hồi là món sushi truyền thống gồm lát cá hồi tươi mềm, đặt lên trên cơm trộn giấm được nén vừa tay. Cá hồi có vị béo ngọt, tươi mới, hòa quyện với cơm mềm, chua nhẹ. Món này thường được ăn kèm với wasabi và gừng ngâm để tăng thêm hương vị.'),
(2, 'Sashimi Cá Ngừ', 'images/sashimi_ca_ngu.jpg', 250000, 'Sashimi tươi ngon từ cá ngừ', 1, 'Thưởng thức sashimi tươi ngon, làm từ cá ngừ thượng hạng, mát lạnh và tinh tế.'),
(3, 'Lẩu Shabu Shabu', 'images/lau_shabu_shabu.jpg', 500000, 'Lẩu Nhật Bản với thịt bò và rau củ', 2, 'Lẩu Shabu Shabu là món lẩu Nhật Bản đặc trưng với nước dùng thanh ngọt, nấu từ tảo biển và cá bào. Thịt bò thái lát mỏng được nhúng vào nước lẩu sôi cùng với rau củ tươi ngon như nấm, cải thảo, và đậu hũ. Món ăn này được ăn kèm với nước sốt mè rang hoặc sốt ponzu, mang đến trải nghiệm ẩm thực phong phú và đa dạng.'),
(4, 'Tempura Tôm', 'images/tempura_tom.jpg', 200000, 'Tôm chiên giòn kiểu Nhật', 2, 'Tempura Tôm là món ăn Nhật Bản nổi tiếng với những con tôm tươi được nhúng vào bột chiên giòn và chiên nhanh trong dầu nóng, giữ nguyên vị ngọt tự nhiên. Lớp vỏ bên ngoài giòn rụm, vàng ươm, bao phủ lấy phần thịt tôm chắc ngọt bên trong. Tempura thường được ăn kèm với nước chấm đặc trưng từ nước tương và củ cải bào.'),
(5, 'Mì Udon', 'images/mi_udon.jpg', 150000, 'Mì Udon Nhật với nước dùng đậm đà', 3, 'Mì Udon Nhật Bản với sợi mì dày và dai, làm từ bột mì hảo hạng, được nấu trong nước dùng đậm đà nấu từ cá bào và tảo biển. Tô mì được bổ sung thêm các loại rau củ, hành lá, và đôi khi có thêm miếng tempura chiên giòn hoặc đậu phụ chiên. Đây là món ăn thanh đạm nhưng không kém phần hấp dẫn.'),
(6, 'Bánh Mochi', 'images/banh_mochi.jpg', 80000, 'Bánh gạo mochi truyền thống của Nhật', 4, 'Bánh Mochi là món bánh gạo truyền thống Nhật Bản với lớp vỏ dẻo dai từ bột gạo nếp, bên trong là nhân đậu đỏ ngọt thanh. Lớp vỏ mochi mềm mại, mịn màng, khi ăn tan chảy trong miệng, kết hợp với nhân đậu đỏ bùi bùi tạo nên một trải nghiệm ngọt ngào. Đây là món tráng miệng truyền thống trong các dịp lễ hội Nhật Bản.'),
(7, 'Trà Xanh Matcha', 'images/tra_xanh_matcha.jpg', 50000, 'Trà xanh Nhật Bản nguyên chất', 5, 'Trà Xanh Matcha là loại trà xanh nguyên chất được nghiền từ lá trà tươi, có màu xanh đặc trưng và hương vị đậm đà, thanh mát. Matcha không chỉ giúp giải nhiệt mà còn mang lại nhiều lợi ích cho sức khỏe, nhờ chứa nhiều chất chống oxy hóa. Đây là loại trà phổ biến trong các nghi lễ trà đạo Nhật Bản.'),
(8, 'Rượu Sake', 'images/ruou_sake.jpg', 600000, 'Rượu truyền thống của Nhật Bản', 5, 'Rượu Sake là loại rượu truyền thống của Nhật Bản, được ủ từ gạo, nước và men koji. Với quy trình ủ công phu, Sake có hương vị thanh khiết, nồng nàn, mang đậm nét văn hóa Nhật Bản. Rượu có thể được uống nóng hoặc lạnh, tùy theo mùa và khẩu vị của người thưởng thức.'),
(9, 'Sushi Lươn', 'images/sushi_luon.jpg', 350000, 'Sushi với lươn nướng đậm đà', 1, 'Sushi Lươn là món ăn đặc trưng với lươn nướng Unagi, tẩm ướp trong nước sốt đặc biệt làm từ tương đen, đường và rượu mirin, sau đó nướng chín đến khi lớp da lươn bóng bẩy và thấm đều hương vị. Thịt lươn mềm, ngọt, và đậm đà, kết hợp với cơm trộn giấm, tạo nên món ăn ngon khó cưỡng.'),
(10, 'Cơm Lươn Unagi', 'images/com_luon_unagi.jpg', 400000, 'Cơm với lươn nướng Unagi kiểu Nhật', 2, 'Cơm Lươn Unagi là món ăn truyền thống Nhật Bản với lươn Unagi nướng phủ sốt teriyaki đậm đà, ăn cùng cơm trắng. Lươn có vị ngọt nhẹ, mềm thơm, hòa quyện với cơm dẻo tạo nên món ăn đầy hương vị và bổ dưỡng. Đây là món ăn đặc biệt phổ biến vào mùa hè ở Nhật để tăng cường sức khỏe.'),
(11, 'Okonomiyaki', 'images/okonomiyaki.jpg', 250000, 'Bánh xèo Nhật Bản', 4, 'Okonomiyaki là món bánh xèo truyền thống của Nhật Bản với các loại topping phong phú như tôm, bắp cải, và hành tây. Bánh gồm lớp bột mì, trứng và nước dùng dashi, tạo ra vỏ bánh mềm thơm. Thường ăn kèm với sốt okonomiyaki và mayonnaise Nhật.'),
(12, 'Takoyaki', 'images/takoyaki.jpg', 150000, 'Bánh bạch tuộc nướng', 4, 'Takoyaki là món bánh hình cầu với nhân bạch tuộc tươi ngon bên trong, bọc ngoài là lớp vỏ giòn nhẹ. Thành phần bao gồm bột mì, bạch tuộc, gừng đỏ, hành lá và cá bào khô. Bánh được rưới sốt takoyaki và mayonnaise, rắc thêm rong biển vụn.'),
(13, 'Gyoza', 'images/gyoza.jpg', 120000, 'Há cảo Nhật', 4, 'Gyoza là món há cảo chiên giòn với lớp vỏ mỏng, nhân thịt heo, bắp cải, và tỏi tây. Khi ăn, vỏ bánh giòn bên ngoài, mềm mịn bên trong, kết hợp với nước chấm đặc trưng từ nước tương và giấm.'),
(14, 'Ramen', 'images/ramen.jpg', 200000, 'Mì Ramen Nhật', 3, 'Mì Ramen Nhật với nước dùng đậm đà từ xương hầm, sợi mì dai mềm, cùng các topping như thịt xá xíu, trứng lòng đào, rong biển và hành lá. Món này thường được gia vị với nước tương, miso, hoặc muối.'),
(15, 'Katsudon', 'images/katsudon.jpg', 220000, 'Cơm thịt heo chiên xù', 2, 'Katsudon là món cơm với miếng thịt heo chiên xù giòn tan, đặt trên cơm trắng và trứng. Thành phần gồm thịt heo chiên xù, trứng, hành tây, và nước sốt từ dashi và nước tương.'),
(16, 'Tonkatsu', 'images/tonkatsu.jpg', 230000, 'Thịt heo chiên xù', 2, 'Tonkatsu là món thịt heo chiên xù, lớp vỏ giòn tan bao quanh miếng thịt heo mềm ngọt. Thành phần gồm thịt heo, bột mì, trứng và bột chiên xù. Khi ăn kèm với bắp cải tươi và sốt Tonkatsu đậm đà.'),
(17, 'Sukiyaki', 'images/sukiyaki.jpg', 450000, 'Lẩu Sukiyaki', 2, 'Sukiyaki là món lẩu với thịt bò thái mỏng, nấm, đậu phụ, cải thảo và hành tây. Nước dùng ngọt nhẹ từ dashi, nước tương, và mirin. Khi ăn, từng lát thịt mềm mại hòa quyện với nước dùng tạo nên vị ngon đặc biệt.'),
(18, 'Shabu Shabu', 'images/shabu_shabu.jpg', 500000, 'Lẩu Shabu Shabu', 2, 'Shabu Shabu là món lẩu truyền thống của Nhật với thịt bò thái mỏng, rau cải, nấm và đậu phụ. Khi ăn, người dùng sẽ nhúng thịt và rau vào nước dùng nóng và chấm cùng với nước sốt goma hoặc ponzu.'),
(21, 'Onigiri', 'images/onigiri.jpg', 80000, 'Cơm nắm Nhật Bản', 1, 'Onigiri là món cơm nắm truyền thống của Nhật Bản, với lớp cơm dẻo, nắm chặt tay, có các loại nhân như cá hồi, mận muối và rong biển khô.'),
(22, 'Tempura Rau Củ', 'images/tempura_rau_cu.jpg', 160000, 'Rau củ chiên giòn kiểu Nhật', 2, 'Tempura rau củ là món chiên giòn với các loại rau củ như bí ngòi, khoai lang, ớt chuông và cà tím, tẩm bột mỏng và chiên giòn.'),
(24, 'Matcha Ice Cream', 'images/matcha_ice_cream.jpg', 120000, 'Kem trà xanh Matcha', 5, 'Kem Matcha với thành phần chính từ bột trà xanh nguyên chất, kết hợp với kem sữa tạo nên món tráng miệng thanh mát, đậm đà vị trà xanh.'),
(26, 'Sake Nigiri', 'images/sake_nigiri.jpg', 300000, 'Sushi cá hồi tươi', 1, 'Sake Nigiri là món sushi cá hồi với miếng cá hồi tươi mềm, đặt trên cơm trộn giấm, kết hợp wasabi và gừng ngâm. Thành phần chính là cá hồi tươi, cơm và giấm.'),
(27, 'Maguro Nigiri', 'images/maguro_nigiri.jpg', 280000, 'Sushi cá ngừ tươi', 1, 'Maguro Nigiri là món sushi với cá ngừ tươi thái lát mỏng, ăn kèm với wasabi và nước tương. Thành phần gồm cá ngừ, cơm và giấm.'),
(28, 'Anago Nigiri', 'images/anago_nigiri.jpg', 320000, 'Sushi lươn biển', 1, 'Anago Nigiri là món sushi với lươn biển mềm ngọt, được nướng sơ và kết hợp với cơm. Thành phần chính là lươn biển và cơm trộn giấm.');

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_address VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL,
    delivery_time VARCHAR(50),
    note TEXT,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending'
);
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);
