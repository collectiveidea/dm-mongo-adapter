begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "dm-mongo-adapter"
    gem.summary = "MongoDB adapter for DataMapper"
    gem.authors = ['Brandon Keepers']
    gem.email = 'brandon@opensoul.org'
    gem.homepage = 'http://github.com/collectiveidea/dm-mongo-adapter'
    gem.add_dependency "mongo"
    gem.add_development_dependency "rspec"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :default => :spec
task :spec => :check_dependencies

require 'spec/rake/spectask'
desc "Run the specs under spec"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.ruby_opts << '-rubygems'
end
