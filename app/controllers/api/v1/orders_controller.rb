class Api::V1::OrdersController < ApplicationController
    # create a order
    def create
        order = Order.new(order_params)
        if order.save
            render json: {status: 'SUCESS', message: 'Created order', data: order}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Order not created', data:order.erros}, status: :unprocessable_entity
        end
    end

    # get the status of an order
    def get_status
        status = Order.where("client_name = '#{params[:id]}' or reference = '#{params[:id]}'")
        render json: {status: 'SUCCESS', message:'Status', data:status},status: :ok
    end

    # list the orders
    def list_order
        list = Order.where("purchase_channel = '#{params[:purchase]}' AND status = '#{params[:status]}'")
        render json: {status: 'SUCCESS', message:'Status', data:list},status: :ok
    end

    # metodos de acesso
    private
        def order_params
            params.require(:order).permit(:reference, :purchase_channel, :client_name, :address, :delivery_service, :total_value, :line_items, :status)
        end

        
end
