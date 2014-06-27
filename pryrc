Pry::DEFAULT_HOOKS.add_hook(:before_session, :gem_auto_require) do |out, target, _pry_|
  dir = `pwd`.chomp
  gem_name = File.basename(dir)
  if File.exist?(File.join(dir, "#{gem_name}.gemspec"))
    lib = File.join(dir, 'lib')
    $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
    require gem_name if File.exist?(File.join(lib, "#{gem_name}.rb"))
  end
end
