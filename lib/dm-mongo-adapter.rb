require 'dm-core'
require 'dm-core/adapters/abstract_adapter'
require 'mongo'

module DataMapper::Adapters
  class MongoAdapter < AbstractAdapter
    def initialize(name, options = {})
      super
      @connection = Mongo::Connection.new
      @database   = @connection.db(options[:database])
    end
    
    def create(resources)
      resources.each do |resource|
        resource.id ||= Mongo::ObjectID.new.to_s
        collection = @database.collection(resource.model.storage_name)
        collection.save resource.attributes(:field)
      end
    end
  end
end