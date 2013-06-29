begin
  require 'irbtools/configure'
  Irbtools.add_package :more
  Irbtools.start
rescue LoadError => e
  warn "unable to load irbtools"
end
