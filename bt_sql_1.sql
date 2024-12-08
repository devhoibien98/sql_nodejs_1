CREATE DATABASE db_app_food
CREATE TABLE users (
	user_id  INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)
CREATE TABLE restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	Image VARCHAR(255),
	`desc` VARCHAR(255)
)
CREATE TABLE rate_res (
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
)

CREATE TABLE like_res (
	user_id INT,
	res_id INT,
	date_like DATETIME,
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
)
CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)

)

CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	`desc` VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type (type_id)
)



CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food (food_id)
)

CREATE TABLE orders (
	user_id INT,
	food_id INT,
	amount INT,
	code VARCHAR(255),
	ar_sub_id VARCHAR(255),
	FOREIGN KEY (user_id) REFERENCES users (user_id),
	FOREIGN KEY (food_id) REFERENCES food (food_id)
)


SELECT * FROM users
-- Vì mình đã cài ID là auto_increment rồi nên mình không cần thêm value vì value sẽ tự động tăng
INSERT INTO users (full_name, email, pass_word) VALUES 
('John Doe', 'johndoe@example.com', 'password123'),
('Jane Doe', 'janedoe@example.com', 'mypassword456'),
('Alice Smith', 'alice.smith@example.com', 'alicepass789'),
('Bob Brown', 'bob.brown@example.com', 'bobpass123'),
('Charlie Black', 'charlie.black@example.com', 'charliepass321'),
('David Green', 'david.green@example.com', 'davidpass456'),
('Eve White', 'eve.white@example.com', 'evepass654'),
('Frank Gray', 'frank.gray@example.com', 'frankpass789'),
('Grace Blue', 'grace.blue@example.com', 'gracepass987'),
('Hank Yellow', 'hank.yellow@example.com', 'hankpass123');

-- Thêm dữ liệu vào bảng restaurant
INSERT INTO restaurant (res_name, Image, `desc`) VALUES
('Pizza Hut', 'pizza_hut.jpg', 'Pizza Hut is an international chain of restaurants offering pizza, pasta, and other food items.'),
('McDonald\'s', 'mcdonalds.jpg', 'McDonald\'s is a fast-food restaurant known for its burgers, fries, and breakfast items.'),
('KFC', 'kfc.jpg', 'KFC offers fried chicken, sandwiches, and other fast food items.'),
('Starbucks', 'starbucks.jpg', 'Starbucks is a coffeehouse chain that serves coffee, tea, and baked goods.'),
('Subway', 'subway.jpg', 'Subway is a fast food restaurant specializing in sandwiches and salads.');

-- Thêm dữ liệu vào bảng rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 2, 5, NOW()),
(1, 3, 6, NOW()),
(2, 1, 2, NOW()), 
(3, 2, 1, NOW()), 
(3, 1, 3, NOW()), 
(4, 3, 2, NOW()), 
(4, 2, 7, NOW()), 
(5, 1, 4, NOW()), 
(5, 3, 3, NOW());
(1, 1, 5, '2024-12-01 10:00:00'),
(2, 2, 4, '2024-12-01 12:00:00'),
(3, 3, 3, '2024-12-02 09:00:00'),
(4, 4, 5, '2024-12-03 14:00:00'),
(5, 5, 4, '2024-12-04 16:00:00'),
(6, 1, 5, '2024-12-05 17:00:00'),
(7, 2, 3, '2024-12-06 18:00:00'),
(8, 3, 4, '2024-12-07 11:00:00'),
(9, 4, 5, '2024-12-08 08:00:00'),
(10, 5, 4, '2024-12-09 15:00:00');

INSERT INTO like_res (user_id, res_id, date_like) VALUES 
(1, 2, NOW()), -- Người dùng 1 thích nhà hàng 2
(1, 3, NOW()), -- Người dùng 1 thích nhà hàng 3
(2, 1, NOW()), -- Người dùng 2 thích nhà hàng 1
(3, 2, NOW()), -- Người dùng 3 thích nhà hàng 2
(3, 1, NOW()), -- Người dùng 3 thích nhà hàng 1
(4, 3, NOW()), -- Người dùng 4 thích nhà hàng 3
(4, 2, NOW()), -- Người dùng 4 thích nhà hàng 2
(5, 1, NOW()), -- Người dùng 5 thích nhà hàng 1
(5, 3, NOW()); -- Người dùng 5 thích nhà hàng 3
-- Thêm dữ liệu vào bảng like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-12-01 10:00:00'),
(2, 2, '2024-12-01 12:00:00'),
(3, 3, '2024-12-02 09:00:00'),
(4, 4, '2024-12-03 14:00:00'),
(5, 5, '2024-12-04 16:00:00'),
(6, 1, '2024-12-05 17:00:00'),
(7, 2, '2024-12-06 18:00:00'),
(8, 3, '2024-12-07 11:00:00'),
(9, 4, '2024-12-08 08:00:00'),
(10, 5, '2024-12-09 15:00:00');

-- Thêm dữ liệu vào bảng food_type
INSERT INTO food_type (type_name) VALUES
('Pizza'),
('Burger'),
('Chicken'),
('Coffee'),
('Sandwich');


-- Thêm dữ liệu vào bảng food
INSERT INTO food (food_name, image, price, `desc`, type_id) VALUES
('Pepperoni Pizza', 'pepperoni_pizza.jpg', 12.99, 'A classic pizza with pepperoni and cheese.', 1),
('Cheeseburger', 'cheeseburger.jpg', 8.99, 'A juicy cheeseburger with lettuce, tomato, and cheese.', 2),
('Fried Chicken', 'fried_chicken.jpg', 10.99, 'Crispy fried chicken with a flavorful coating.', 3),
('Caffe Latte', 'caffe_latte.jpg', 4.99, 'A smooth espresso drink with steamed milk and a thin layer of foam.', 4),
('Veggie Sub', 'veggie_sub.jpg', 6.99, 'A healthy sub sandwich with fresh vegetables and light dressing.', 5);

-- Thêm dữ liệu vào bảng sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 1.50, 1),
('Bacon', 2.00, 2),
('Fries', 2.50, 3),
('Syrup', 0.50, 4),
('Olives', 1.00, 5);

-- Thêm dữ liệu vào bảng orders
INSERT INTO orders (user_id, food_id, amount, code, ar_sub_id) VALUES
(1, 1, 2, 'ORD001', '1'),
(1, 3, 1, 'ORD002', '3'),
(2, 2, 3, 'ORD003', '2'),
(2, 4, 2, 'ORD004', '4'),
(3, 5, 1, 'ORD005', '5'),
(3, 1, 2, 'ORD006', '1'),
(4, 3, 4, 'ORD007', '3'),
(5, 2, 1, 'ORD008', '2'),
(6, 1, 1, 'ORD009', '1'),
(6, 2, 3, 'ORD010', '2'),
(7, 4, 2, 'ORD011', '4'),
(8, 3, 3, 'ORD012', '3');
(1, 1, 2, 'ORD123', '1'),
(2, 2, 1, 'ORD124', '2'),
(3, 3, 3, 'ORD125', '3'),
(4, 4, 2, 'ORD126', '4'),
(5, 5, 4, 'ORD127', '5'),
(6, 1, 1, 'ORD128', '1'),
(7, 2, 3, 'ORD129', '2'),
(8, 3, 1, 'ORD130', '3'),
(9, 4, 2, 'ORD131', '4'),
(10, 5, 2, 'ORD132', '5');



-- Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT u.full_name, COUNT(*) AS like_count
FROM like_res l
JOIN users u ON l.user_id = u.user_id
GROUP BY l.user_id
ORDER BY like_count DESC
LIMIT 5;
-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT r.res_name, COUNT(*) AS like_count
FROM like_res l
JOIN restaurant r ON l.res_id = r.res_id
GROUP BY l.res_id
ORDER BY like_count DESC
LIMIT 2;
-- Tìm người đã đặt hàng nhiều nhất
SELECT u.full_name, COUNT(*) AS order_count
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY o.user_id
ORDER BY order_count DESC
LIMIT 1;
-- Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng)
SELECT u.full_name
FROM users u
LEFT JOIN like_res l ON u.user_id = l.user_id
LEFT JOIN rate_res r ON u.user_id = r.user_id
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE l.user_id IS NULL AND r.user_id IS NULL AND o.user_id IS NULL;

