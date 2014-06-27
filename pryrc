Pry::DEFAULT_HOOKS.add_hook(:before_session, :gem_auto_include) do |out, target, _pry_|
  dir = `pwd`.chomp
  base = File.basename(dir)
  if File.exist?(File.join(dir, "#{base}.gemspec"))
    lib = File.join(dir, 'lib')
    $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
    require base
  end
end
