require 'yard'

namespace :doc do
  YARD::Rake::YardocTask.new :app do |t|
    t.files += ['app/**/*.rb', '-', 'README.md']
  end
end
