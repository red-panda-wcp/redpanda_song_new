class HistoryAddressesController < ApplicationController

  def create
    @history_address = HistroyAddress.create(history_address_params)
  end

  private
  def history_address_params
    params.require(:history_address).parmit(:postal_code,:address,:lastname,:firstname,
                                            :kana_lastname,:kana_firstname,:phone)
  end
end
