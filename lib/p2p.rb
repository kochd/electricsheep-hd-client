require 'socket'

class P2P
  attr_reader :dht
  def initialize(api)
    @api = api
    @dht = []
  end

  def announce(movie_dir)
    LOGGER.info "Hashing files for p2p announce"
    files = []
    Dir.entries(movie_dir).select{ |x| x.end_with?(".webm") }.shuffle.first(10).each do |webm|
    files << { name: webm,
               hash: Digest::SHA2.hexdigest(File.read("#{movie_dir}/" + webm))
    }
    end
    @api.get("api/p2p/announce?apikey=#{@api.key}&gpu=#{OPTIONS["gpu"]}&files=#{files.to_json}")
  end

  def update_dht
    LOGGER.info "Updating DHT"
    @dht = JSON.parse(@api.get("api/p2p/dht?apikey=#{@api.key}&gpu=#{OPTIONS["gpu"]}").body)
  end
end
