require 'rails_helper'

describe 'Downloads' do
  def set_resource_class
    @resource_class = Ecm::Downloads::Download
  end

  before do
    set_resource_class
    @path_prefix = ''
    @resource_path = @resource_class.to_s.underscore.gsub('/', '_').pluralize
    @resource_factory_name = @resource_class.to_s.underscore.gsub('/', '_').to_sym
  end # background

  describe 'show' do
    before do
      @resource = FactoryGirl.create(@resource_factory_name, :published => true)
      get "#{@path_prefix}/#{@resource_path}/#{@resource.to_param}"
    end

    it "request should be successful" do
      response.code.should eq("200")
    end

    it "render the show template" do
      response.should render_template(:show)
    end
  end

  describe 'index' do
    before do
      get "#{@path_prefix}/#{@resource_path}"
    end

    it "request should be successful" do
      response.code.should eq("200")
    end

    it "render the index template" do
      response.should render_template(:index)
    end
  end
end

