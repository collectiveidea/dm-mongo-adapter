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
        collection(resource.model).save resource.attributes(:field)
      end
    end
    
    def read(query)
      query.filter_records collection(query.model).find()
    end
    
    def update(attributes, resources)
      attributes = attributes_as_fields(attributes)
      resources.each do |resource|
        collection(resource.model).save resource.attributes(:field).merge(attributes)
      end
    end
    
    def delete(resources)
      resources.each do |resource|
        collection(resource.model).delete(resource.id)
      end
    end
  
  private
  
    def collection(model)
      @database.collection(model.storage_name)
    end
  
  end
end