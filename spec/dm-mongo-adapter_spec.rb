require 'spec_helper'
require 'dm-core/spec/adapter_shared_spec'

describe DataMapper::Adapters::MongoAdapter do
  before :all do
    @adapter = DataMapper.setup(:default, :adapter => 'mongo', :database => 'dm-mongo-adapter')
  end

  it_should_behave_like 'An Adapter'
end