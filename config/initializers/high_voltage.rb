# Custom High Voltage settings
HighVoltage.configure do |config|
  # Remove the directory /pages/ from the URL path and serve from root
  config.route_drawer = HighVoltage::RouteDrawers::Root
  
  # Configure the root route to home page
  config.home_page = 'home'
end