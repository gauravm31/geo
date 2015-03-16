class Business < ActiveRecord::Base
  include Elasticsearch::Model

  VinsolLocation = { lat: 28.644894, lon: 77.170619 }

  settings index: { number_of_shards: 1, number_of_replicas: 0 } do
    mapping do 
      indexes :location, {type: 'geo_point'}
    end
  end

  def as_indexed_json(options={})
    {
      location: { lat: self.lat, lon: self.lon }
    }
  end

  def self.search(distance)
    __elasticsearch__.search(
      {
        filter: {
          geo_distance: {
            distance: distance + 'km',
            location: VinsolLocation
          }
        }
      }
    )
  end

end