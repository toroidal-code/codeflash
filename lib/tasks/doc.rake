require 'yard'

namespace :doc do
  YARD::Rake::YardocTask.new :app do |t|
    t.files += ['app/**/*.rb', '-', 'README.md']
    t.options += ['--list-undoc']
  end
end
