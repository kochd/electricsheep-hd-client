require 'socket'

class P2P
  attr_reader :dht
  @@P2P_ANNOUNCED = false
  def initialize(api)
    @api = api
    @dht = []
  end

  def announce(movie_dir)
    return if @@P2P_ANNOUNCED
    LOGGER.info "Hashing files for p2p announce"
    files = []
    Dir.entries(movie_dir).select{ |x| x.end_with?(".webm") }.each do |webm|
    files << { name: webm,
               hash: Digest::SHA2.hexdigest(File.read("#{movie_dir}/" + webm))
    }
    end
    files.shuffle.each_slice(25).to_a.each do |a|
      @api.get("api/p2p/announce?apikey=#{@api.key}&gpu=#{OPTIONS["gpu"]}&files=#{a.to_json}")
    end
    @@P2P_ANNOUNCED = true
  end

  def update_dht
    LOGGER.info "Updating DHT"
    @dht = JSON.parse(@api.get("api/p2p/dht?apikey=#{@api.key}&gpu=#{OPTIONS["gpu"]}").body)
  end
end
