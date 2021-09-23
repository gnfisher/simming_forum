module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice("error", "notice", "success")
  end
end
