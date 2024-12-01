
// Lấy các phần tử giao diện
document.addEventListener('DOMContentLoaded', () => {
    const ordersBtn = document.getElementById('manage-orders-btn');
    const productsBtn = document.getElementById('manage-products-btn');
    const manageOrdersSection = document.getElementById('manage-orders');
    const manageProductsSection = document.getElementById('manage-products');

    // Chuyển đổi giữa "Quản lý đơn hàng" và "Quản lý món ăn"
    ordersBtn.addEventListener('click', () => {
        manageOrdersSection.classList.add('active');
        manageProductsSection.classList.remove('active');

        ordersBtn.classList.add('active');
        productsBtn.classList.remove('active');
    });

    productsBtn.addEventListener('click', () => {
        manageProductsSection.classList.add('active');
        manageOrdersSection.classList.remove('active');

        productsBtn.classList.add('active');
        ordersBtn.classList.remove('active');
    });

    // Hàm hiển thị danh sách đơn hàng
    function displayOrders() {
        const orderList = document.querySelector('#manage-orders tbody');
        orderList.innerHTML = ''; // Xóa dữ liệu cũ

        // Gọi API để lấy danh sách đơn hàng
        fetch('/demo/getorder', {
            method: 'GET'
        })
                .then(response => response.json())
                .then(data => {
                    console.log("Danh sách đơn hàng từ server:", data);

                    // Chỉ hiển thị các đơn hàng có trạng thái Pending
                    const pendingOrders = data.filter(order => order.status === 'Pending');

                    pendingOrders.forEach(order => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                    <td>${order.orderId}</td>
                    <td>${order.receiverName}</td>
                    <td>${order.receiverPhone}</td>
                    <td>${order.receiverAddress}</td>
                    <td>${order.totalAmount.toLocaleString()}đ</td>
                    <td>${order.timeSlot}</td>
                    <td>${order.status}</td>
                    <td>
                        <button class="view" data-id="${order.orderId}">Chi tiết</button>
                        <button class="complete" data-id="${order.orderId}" data-status="Completed">Hoàn tất</button>
                        <button class="cancel" data-id="${order.orderId}" data-status="Cancelled">Hủy</button>
                    </td>
                `;
                        orderList.appendChild(row);
                    });

                    // Gắn sự kiện sau khi DOM cập nhật
                    document.querySelectorAll('.view').forEach(button => {
                        button.addEventListener('click', (e) => viewOrderDetails(e.target.dataset.id));
                    });

                    document.querySelectorAll('.complete, .cancel').forEach(button => {
                        button.addEventListener('click', (e) => updateOrderStatus(e.target.dataset.id, e.target.dataset.status));
                    });
                })
                .catch(error => console.error('Lỗi khi tải danh sách đơn hàng:', error));
    }

    // Gọi hàm displayOrders khi trang được tải
    document.addEventListener('DOMContentLoaded', function () {
        displayOrders();
    });

    // Hàm hiển thị chi tiết đơn hàng
    function viewOrderDetails(orderId) {
        fetch(`/demo/getorderitems?orderId=${orderId}`, {
            method: 'GET'
        })
                .then(response => response.json())
                .then(data => {
                    console.log("Order items:", data); // Kiểm tra dữ liệu trả về từ server

                    const orderDetailsList = document.getElementById('order-details-list');
                    orderDetailsList.innerHTML = ''; // Xóa dữ liệu cũ

                    data.forEach(item => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                <td>${item.productName}</td>
                <td>${item.price.toLocaleString()}đ</td>
                <td>${item.quantity}</td>
            `;
                        orderDetailsList.appendChild(row);
                    });

                    // Hiển thị popup chi tiết đơn hàng
                    const popup = document.getElementById('order-details-popup');
                    popup.classList.remove('hidden');
                    popup.classList.add('active');
                })
                .catch(error => {
                    console.error('Lỗi khi lấy thông tin sản phẩm:', error);
                });
    }


    // Đóng popup khi nhấn nút "Đóng"
    document.getElementById('close-popup').addEventListener('click', () => {
        const popup = document.getElementById('order-details-popup');
        popup.classList.remove('active');
        popup.classList.add('hidden');
    });



    // Cập nhật trạng thái đơn hàng
    function updateOrderStatus(orderId, newStatus) {
        fetch('/demo/updateorder', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({orderId, status: newStatus})
        })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Hiển thị thông báo tùy thuộc vào trạng thái
                        if (newStatus === 'Completed') {
                            alert(`Đơn hàng #${orderId} đã được hoàn tất.`);
                        } else if (newStatus === 'Cancelled') {
                            alert(`Đơn hàng #${orderId} đã bị hủy.`);
                        }
                        displayOrders(); // Tải lại danh sách đơn hàng
                    } else {
                        alert("Cập nhật trạng thái thất bại!");
                    }
                })
                .catch(error => {
                    console.error("Lỗi khi cập nhật trạng thái:", error);
                });
    }



    // Hiển thị danh sách món ăn
    function displayProducts() {
        const productList = document.querySelector('#manage-products tbody');
        productList.innerHTML = ''; // Xóa dữ liệu cũ

        // Sử dụng fetch để lấy dữ liệu từ Servlet
        fetch('/demo/manageproduct', {
            method: 'GET'
        })
                .then(response => response.json()) // Chuyển đổi phản hồi thành JSON
                .then(data => {
                    // Hiển thị danh sách sản phẩm từ dữ liệu lấy được
                    data.forEach(product => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                <td>${product.name}</td>
                <td>${product.price.toLocaleString()}đ</td>
                <td>${product.description}</td>
                <td>
                    <button class="edit" data-id="${product.id}">Sửa</button>
                    <button class="delete" data-id="${product.id}">Xóa</button>
                </td>
                `;
                        productList.appendChild(row);
                    });

                    // Gắn sự kiện cho các nút "Sửa" và "Xóa"
                    document.querySelectorAll('.edit').forEach(button => {
                        button.addEventListener('click', (e) => editProduct(e.target.dataset.id));
                    });

                    document.querySelectorAll('.delete').forEach(button => {
                        button.addEventListener('click', (e) => deleteProduct(e.target.dataset.id));
                    });
                })
                .catch(error => {
                    console.error('Lỗi khi lấy dữ liệu sản phẩm:', error);
                });
    }

    // Popup thêm món ăn
    const addProductPopup = document.getElementById('add-product-popup');
    const closePopupBtn = document.getElementById('close-popup-btn');

    // Hiển thị popup thêm món ăn
    document.getElementById('add-product-btn').addEventListener('click', () => {
        addProductPopup.classList.add('active');
    })

    // Đóng popup thêm món ăn
    closePopupBtn.addEventListener('click', () => {
        addProductPopup.classList.remove('active');
    });

    // Xử lý thêm món ăn
    document.getElementById('add-product-form').addEventListener('submit', (e) => {
        e.preventDefault(); // Ngăn chặn reload trang

        const newProduct = {
            name: document.getElementById('product-name').value,
            image: document.getElementById('product-image').value,
            price: document.getElementById('product-price').value,
            title: document.getElementById('product-title').value,
            cid: parseInt(document.getElementById('product-category').value), // Lấy trực tiếp từ ô nhập
            description: document.getElementById('product-description').value
        };

        // Kiểm tra thông tin hợp lệ
        if (newProduct.name && newProduct.image && newProduct.price && newProduct.title && newProduct.cid && newProduct.description) {
            // Gửi yêu cầu thêm sản phẩm tới Servlet
            fetch('/demo/addproduct', {// Đường dẫn servlet xử lý
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(newProduct)
            })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert('Món ăn mới đã được thêm thành công!');
                            displayProducts(); // Làm mới danh sách sản phẩm
                            addProductPopup.classList.remove('active'); // Đóng popup
                            document.getElementById('add-product-form').reset(); // Reset form
                        } else {
                            alert('Có lỗi khi thêm món ăn: ' + data.message);
                        }
                    })
                    .catch(error => {
                        console.error('Lỗi khi thêm món ăn:', error);
                    });
        } else {
            alert('Vui lòng nhập đầy đủ thông tin món ăn!');
        }
    });


//     Hàm để lấy danh mục từ server và hiển thị trong select
    function loadCategories(selectedCategoryId = null) {
        // Gửi yêu cầu để lấy danh sách danh mục
        fetch('/demo/getcategories', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
                .then(response => response.json())
                .then(categories => {
                    const categorySelect = document.getElementById('edit-product-category');
                    categorySelect.innerHTML = ''; // Xóa các tùy chọn cũ

                    // Thêm các tùy chọn mới vào select
                    categories.forEach(category => {
                        const option = document.createElement('option');
                        option.value = category.cid;
                        option.textContent = category.cname;

                        // Nếu có ID danh mục đã chọn, đặt selected cho tùy chọn đó
                        if (selectedCategoryId && selectedCategoryId == category.cid) {
                            option.selected = true;
                        }
                        categorySelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.error('Lỗi khi lấy danh mục:', error);
                });
    }

    // Hàm hiển thị popup chỉnh sửa sản phẩm
    function editProduct(id) {
        // Gửi yêu cầu đến servlet để lấy thông tin sản phẩm theo id
        fetch('/demo/manageproduct?id=' + id, {// Servlet phải trả về thông tin của sản phẩm dưới dạng JSON
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
                .then(response => response.json()) // Chuyển đổi phản hồi từ JSON
                .then(data => {
                    if (data) {
                        // Điền thông tin sản phẩm vào các trường trong popup
                        document.getElementById('edit-product-id').value = data.id;
                        document.getElementById('edit-product-name').value = data.name;
                        document.getElementById('edit-product-image').value = data.image;
                        document.getElementById('edit-product-price').value = data.price;
                        document.getElementById('edit-product-title').value = data.title;
                        // Tải danh sách danh mục và đánh dấu danh mục hiện tại
                        loadCategories(data.cid);
                        document.getElementById('edit-product-description').value = data.description;
                        // Hiển thị popup chỉnh sửa
                        document.getElementById('edit-product-popup').style.display = 'block';
                        // Đóng popup khi người dùng nhấn vào nút "Hủy"
                        document.getElementById('close-edit-popup').addEventListener('click', () => {
                            document.getElementById('edit-product-popup').style.display = 'none';
                        });

                    } else {
                        alert('Không tìm thấy sản phẩm');
                    }
                })
                .catch(error => {
                    console.error('Lỗi khi lấy thông tin sản phẩm:', error);
                });
    }

    // Xử lý submit khi người dùng lưu chỉnh sửa
    document.getElementById('edit-product-form').onsubmit = function (e) {
        e.preventDefault(); // Ngừng reload trang

        const updatedProduct = {
            id: document.getElementById('edit-product-id').value,
            name: document.getElementById('edit-product-name').value,
            image: document.getElementById('edit-product-image').value,
            price: document.getElementById('edit-product-price').value,
            title: document.getElementById('edit-product-title').value,
            cid: parseInt(document.getElementById('edit-product-category').value),
            description: document.getElementById('edit-product-description').value
        };

        // Gửi yêu cầu cập nhật sản phẩm tới servlet
        fetch('/demo/updateproduct', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(updatedProduct)
        })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Sản phẩm đã được cập nhật!');
                        displayProducts(); // Cập nhật lại danh sách sản phẩm
                        document.getElementById('edit-product-popup').style.display = 'none'; // Đóng popup
                    } else {
                        alert('Có lỗi khi cập nhật sản phẩm!');
                    }
                })
                .catch(error => {
                    console.error('Lỗi khi cập nhật sản phẩm:', error);
                });
    };


    function deleteProduct(id) {
        if (confirm('Bạn có chắc chắn muốn xóa món này?')) {
            // Gửi yêu cầu xóa sản phẩm đến servlet
            fetch('/demo/deleteproduct', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({id: id}) // Gửi tên sản phẩm để xóa
            })
                    .then(response => response.json()) // Giả sử server trả về dữ liệu JSON
                    .then(data => {
                        if (data.success) {
                            alert('Sản phẩm đã được xóa thành công!');
                            displayProducts(); // Cập nhật lại danh sách sản phẩm
                        } else {
                            alert('Có lỗi khi xóa sản phẩm!');
                        }
                    })
                    .catch(error => {
                        console.error('Lỗi khi xóa sản phẩm:', error);
                        alert('Có lỗi xảy ra khi xóa sản phẩm!');
                    });
        }
    }

    // Hiển thị dữ liệu ban đầu
    displayOrders();
    displayProducts();
});
