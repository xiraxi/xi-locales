Gem::Specification.new do |s|
  s.name = "xi-locales"
  s.version = "0.1"
  s.date = "2010-09-07"
  s.authors = ["Xiraxi Foton Team"]
  s.email = "xiraxi@foton.es"
  s.summary = "XiLocales plugin"
  s.homepage = "http://xiraxi.foton.es"
  s.description = s.summary
  s.files = %w(app config db lib public rails tasks test features).map {|dir| Dir["#{dir}/*", "#{dir}/**/*" ] }.flatten
end
