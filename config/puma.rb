rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///tmp/codeflash.sock"
pidfile "/home/deploy/codeflash/current/tmp/puma/pid"
state_path "/homee/deploy/codeflash/current/tmp/puma/state"

activate_control_app
