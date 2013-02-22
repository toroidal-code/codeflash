rails_env = ENV['RAILS_ENV'] || 'production'

threads 0,16

bind  "unix:///home/deploy/codeflash/shared/tmp/puma/codeflash.sock"
pidfile "/home/deploy/codeflash/current/tmp/puma/pid"
state_path "/home/deploy/codeflash/current/tmp/puma/state"

activate_control_app
