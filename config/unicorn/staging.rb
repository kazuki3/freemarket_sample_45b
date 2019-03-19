before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = @app_path + "/current/Gemfile"
end
