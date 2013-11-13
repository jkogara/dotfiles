begin
  require 'irbtools/configure'
  require 'boson/console'
  Irbtools.start
rescue LoadError => e
  puts e
  warn "unable to load irbtools"
end
