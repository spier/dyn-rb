#!/usr/bin/env ruby
require "rubygems"
require "bundler"
Bundler.setup

require "spec_helper"
require "rspec"
require "webmock/rspec"

require File.expand_path(File.join(File.dirname(__FILE__), "../../lib/dyn-rb.rb"))

describe Dyn::Messaging::Client do

  before(:all) do
    @DEFAULT_API_KEY = 1
    @API_BASE_PATH = 'https://emailapi.dynect.net/rest/json'

    @dyn = Dyn::Messaging::Client.new(@DEFAULT_API_KEY)
  end

  describe "/issues" do

    describe "/count" do

      it "a date range" do
        start_time = 1
        end_time = 2

        stub = stub_request(:get, "#{@API_BASE_PATH}/reports/issues/count?apikey=#{@DEFAULT_API_KEY}&starttime=#{start_time}&endtime=#{end_time}")

        @dyn.issues.count(start_time,end_time)

        expect(stub).to have_been_requested
      end

    end

    describe "/list" do

      it "a date range with default startindex" do
        start_time = 1
        end_time = 2

        stub = stub_request(:get, "#{@API_BASE_PATH}/reports/issues?apikey=#{@DEFAULT_API_KEY}&starttime=#{start_time}&endtime=#{end_time}&startindex=0")

        @dyn.issues.list(start_time,end_time)

        expect(stub).to have_been_requested
      end

      it "a date range with a specific start index" do
        start_time = 1
        end_time = 2
        start_index = 40

        stub = stub_request(:get, "#{@API_BASE_PATH}/reports/issues?apikey=#{@DEFAULT_API_KEY}&starttime=#{start_time}&endtime=#{end_time}&startindex=#{start_index}")

        @dyn.issues.list(start_time,end_time,start_index)

        expect(stub).to have_been_requested
      end

    end
  end

end