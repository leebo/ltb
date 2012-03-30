module AdminHelper
  def alive?(imei)
    $redis.exists "imei:#{imei}"
  end
end
