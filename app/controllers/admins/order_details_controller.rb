class Admins::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_detail = OrderDetail.find(params[:id])
    order = order_detail.order
    order_detail.update(order_detail_params)
    if order_detail_params[:making_status] == "製作中"
      @order = order_detail.order.update(status: '製作中')
    elsif order.order_details.count == order.order_details.where(making_status: '製作完了').count
      @order = order_detail.order.update(status: '発送準備中')
    end
    redirect_to admins_order_path(order_detail.order_id)
  end
# OrderDetail.where(order_id: params[:id]).where(making_status: '製作完了').count
  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
