require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '/',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'goya.html.erb')
server.mount('/goya_data_quality.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_data_quality.rb')
server.mount('/goya_data_giveaway.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_data_giveaway.rb')
server.start