class HistoryAddressesController < ApplicationController
  def create

    if Cart.where(user_id:current_user).presence != nil
      @history_address = HistoryAddress.create(history_address_params)#該当ユーザーのカート情報がある場合のみ履歴へカートの情報を登録
      @carts = Cart.where(user_id:current_user.id)
    end

    @carts.each do |cart|#同一ユーザーのカート内商品情報をそれぞれセットして保存

      history = History.new(cart.attributes)#カート内user_id,item_id,countを登録
      history.price = cart.item.price#priceセット
      history.order_status = 0#order_statusセット
      history.history_address_id = @history_address.id#address_idセット

      # 商品の数量変更
      cart.item.stock -= history.count
      cart.item.save
      # 商品の数量変更ここまで

      history.save#履歴保存

    end

  # 履歴へカートの情報を登録　ここまで
    @carts.destroy_all#カート内削除
    flash[:notice] = "ご購入ありがとうございます。発送までしばしお待ち下さい。"
    redirect_to users_show_path

  end

  private
  # def history_address_params
  #   params.require(:history_address).permit(:postal_code,:address,:lastname,:firstname,
  #                                     :kana_lastname,:kana_firstname,:phone)
  # end

  def history_address_params
    params.require(:history_address).permit(:postal_code,:address,:lastname,:firstname,
                                      :kana_lastname,:kana_firstname,:phone,history_attributes:[
                                        :user_id,:item_id,:count,:order_status,:price])
  end
  # def history_address_params
  #   params.require(:history_address).permit(:postal_code,:address,:lastname,:firstname,
  #                                     :kana_lastname,:kana_firstname,:phone,history_attributes:[
  #                                       :user_id,:item_id,:count,:order_status,:price,:history_address_id])
  # end

  # def history_params
  #   params.require(:history).permit(:user_id,:item_id,:count,:order_status,:price,
  #                                   :history_address_id)
  # end
end
