Gem::Specification.new do |s|
    s.name     = 'terutil'
    s.version  = '0.3.1'
    s.licenses = ['MIT']
    s.summary  = "Terminal Util - a collection of useful terminal utilities."
    s.authors  = ['vypxl']
    s.metadata = { "source_code_uri" => "https://github.com/vypxl/terutil" }
    s.homepage = "https://github.com/vypxl/terutil"

    s.files = Dir['lib/*.rb'] + Dir['bin/*']
    s.executables.push "remember", "_c", "swap", "newf", "dev"
end
