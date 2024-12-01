<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh Toán</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="checkout.css">
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <h2>Thông tin đơn hàng</h2>
                <form action="checkout" method="get">
                    <div class="delivery-options">
                        <!-- Khung giờ giao -->
                        <h3>Thời gian giao hàng</h3>
                        <label>
                            <input type="radio" name="time" value="Ngay khi xong" checked onclick="disableTimeSlot()"> Ngay khi xong
                        </label>
                        <label>
                            <input type="radio" name="time" value="Giao vào giờ" onclick="enableTimeSlot()"> Giao vào giờ
                        </label>
                        <select name="timeSlot" id="timeSlot" disabled>
                            <option value="08:00 - 09:00">08:00 - 09:00</option>
                            <option value="09:00 - 10:00">09:00 - 10:00</option>
                            <option value="10:00 - 11:00">10:00 - 11:00</option>
                        </select>
                    </div>
                      <label for="note">Ghi chú</label>
                    <textarea name="note" placeholder="Nhập ghi chú"></textarea>

                    <!-- Thông tin người nhận -->
                    <div class="receiver-info">
                    

                        <!-- Tên người nhận -->
                        <div class="form-group">
                            <label for="receiverName">Tên người nhận</label>
                            <input type="text" id="receiverName" name="receiverName" placeholder="Nhập tên người nhận" required>
                        </div>

                        <!-- Địa chỉ -->
                        <div class="form-group">
                            <label for="receiverAddress">Địa chỉ</label>
                            <input type="text" id="receiverAddress" name="receiverAddress" placeholder="Nhập địa chỉ" required>
                        </div>

                        <!-- Số điện thoại -->
                        <div class="form-group">
                            <label for="receiverPhone">Số điện thoại</label>
                            <input type="text" id="receiverPhone" name="receiverPhone" placeholder="Nhập số điện thoại" required>
                        </div>
                    </div>


                    <!-- Nút Thanh Toán -->
                    <div class="text-right mt-4">
                        <button type="submit" class="btn btn-primary btn-lg">Xác Nhận</button>
                    </div>
                </form>
            </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script>
            function enableTimeSlot() {
                document.getElementById('timeSlot').disabled = false;
            }

            function disableTimeSlot() {
                document.getElementById('timeSlot').disabled = true;
            }
        </script>
    </body>

</html>
