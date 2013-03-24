# This file is used by Rack-based servers to start the application.
require 'bundler/setup'
require ::File.expand_path('../config/environment',  __FILE__)
run Codeflash::Application
