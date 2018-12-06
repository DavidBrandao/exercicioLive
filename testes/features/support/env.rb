require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)
World(Helper)

HEADLESS = ENV['HEADLESS']
ENVIROMENT_TYPE = ENV['ENVIROMENT_TYPE']

CONGIG = YAML.load_file(File.dirname(__FILE__)+
"/data/#{ENVIROMENT_TYPE}.yml")



Capybara.register_driver :selenium do |app|
if HEADLESS.eql?('sem_headless')
    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['--disable-infobars','window-size=1600,1024']}
        )
    )
elsif HEADLESS.eql?('com_headless')
    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['headless', 'disable-gpu',
                                        '--disable-infobars',
                                        'window-size=1600,1024']}
        )
    )
end
end



Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 10
    config.app_host = CONGIG['url_home']
end
