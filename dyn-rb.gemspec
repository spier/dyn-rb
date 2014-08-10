$:.unshift(File.dirname(__FILE__) + '/lib')
require 'dyn/version'

Gem::Specification.new do |s|
  s.name = "dyn-rb"
  s.version = Dyn::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sunny Gleason", "Dani Dewitt", "Adam Sarenski", "Adam Jacob", "Ranjib Dey"]
  s.date = "2014-07-14"
  s.description = "Dyn Ruby SDK"
  s.email = "concierge@dyn.com"
  s.homepage = "http://github.com/dyninc/dyn-rb"
  s.files = %w(LICENSE) + Dir.glob("{lib,spec}/**/*", File::FNM_DOTMATCH).reject {|f| File.directory?(f) }
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Dyn Ruby SDK"

  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"
  s.add_development_dependency "fuubar"
end
