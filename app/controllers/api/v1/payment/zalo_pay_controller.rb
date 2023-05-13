class ZaloPayController < ApplicationController
    def create_qr_code
      # Lấy thông tin cần thiết từ ZaloPay
      zp_app_id = ENV['ZALOPAY_APP_ID']
      zp_app_key = ENV['ZALOPAY_APP_KEY']
      zp_app_user = ENV['ZALOPAY_APP_USER']
  
      # Tạo payload để gọi API tạo mã QR code
      payload = {
        "appid": zp_app_id,
        "appuser": zp_app_user,
        "amount": 100000,
        "description": "Thanh toán đơn hàng",
        "embeddata": "",
        "item": [
          {
            "item_name": "Món ăn",
            "item_quantity": 1,
            "item_amount": 100000
          }
        ],
        "mrc_order_id": SecureRandom.uuid,
        "returnurl": "#{request.protocol}#{request.host_with_port}/zalo_pay_callback"
        }
        zp_sdk = ZaloPay::SDK.new(zp_app_id, zp_app_key)
        qr_code_data = zp_sdk.qr.create(payload)

        render json: qr_code_data
    end
end