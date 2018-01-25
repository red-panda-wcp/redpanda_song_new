class DiscsController < ApplicationController


  private
def disc_params
  params.require(:disc).permit(:disc_name,songs_attributes: [:song_name,:number])
end
end
