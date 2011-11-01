require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'pry'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'https://www.gotimeforce.com'

include Capybara::DSL

# TODO: 1265


def eat_it_timeforce
  username = ''
  password = ''
  funding_source = ''

  visit '/qqest/login/login.asp'
  fill_in 'username', :with => username
  fill_in 'Password', :with => password
  fill_in 'CompanyCode', :with => 'adler'
  click_on 'Login'
  
  #
  # Click on 1st Monday
  #
  
  page.find(:xpath, "html/body/table[4]/tbody/tr[9]/td[3]/a").click
  # page.find(:xpath, "html/body/table[4]/tbody/tr[9]/td[3]/span/a").click
  
  within_window(page.driver.browser.window_handles.last) do
    find("input[@class='submitsmallstyle']").click
    within_window(page.driver.browser.window_handles.last) do
      find("input[@id='enterhours1']").set(true)
      fill_in 'thetotalhr', :with => '7'
      select funding_source, :from => 'job'
      find(:xpath, "//table/tbody/tr[14]/td/input").click
    end
    find(:xpath, "//table[1]/tbody/tr/td[3]/input").click
  end
  
  #
  # Click on 1st Tuesday
  #
  page.find(:xpath, "html/body/table[4]/tbody/tr[9]/td[4]/span/a").click
  
  within_window(page.driver.browser.window_handles.last) do
    find("input[@class='submitsmallstyle']").click
    within_window(page.driver.browser.window_handles.last) do
      find("input[@id='enterhours1']").set(true)
      fill_in 'thetotalhr', :with => '7'
      select funding_source, :from => 'job'
      find(:xpath, "//table/tbody/tr[14]/td/input").click
    end
    find(:xpath, "//table[1]/tbody/tr/td[3]/input").click
  end
  
  #
  # Click on 1st Wednesday
  #
  page.find(:xpath, "html/body/table[4]/tbody/tr[9]/td[5]/span/a").click
  
  within_window(page.driver.browser.window_handles.last) do
    find("input[@class='submitsmallstyle']").click
    within_window(page.driver.browser.window_handles.last) do
      find("input[@id='enterhours1']").set(true)
      fill_in 'thetotalhr', :with => '7'
      select funding_source, :from => 'job'
      find(:xpath, "//table/tbody/tr[14]/td/input").click
    end
    find(:xpath, "//table[1]/tbody/tr/td[3]/input").click
  end
  
  #
  # Click on 1st Thursday
  #
  page.find(:xpath, "html/body/table[4]/tbody/tr[9]/td[6]/span/a").click
  
  within_window(page.driver.browser.window_handles.last) do
    find("input[@class='submitsmallstyle']").click
    within_window(page.driver.browser.window_handles.last) do
      find("input[@id='enterhours1']").set(true)
      fill_in 'thetotalhr', :with => '7'
      select funding_source, :from => 'job'
      find(:xpath, "//table/tbody/tr[14]/td/input").click
    end
    find(:xpath, "//table[1]/tbody/tr/td[3]/input").click
  end
  
  #
  # Click on 1st Friday
  #
  page.find(:xpath, "html/body/table[4]/tbody/tr[9]/td[7]/span/a").click
  
  within_window(page.driver.browser.window_handles.last) do
    find("input[@class='submitsmallstyle']").click
    within_window(page.driver.browser.window_handles.last) do
      find("input[@id='enterhours1']").set(true)
      fill_in 'thetotalhr', :with => '7'
      select funding_source, :from => 'job'
      find(:xpath, "//table/tbody/tr[14]/td/input").click
    end
    find(:xpath, "//table[1]/tbody/tr/td[3]/input").click
  end
  
  #
  # => Workin' hard in week 2
  #
  for i in 10..14 do
    page.find(:xpath, "html/body/table[4]/tbody/tr[9]/td[#{i}]/span/a").click

    within_window(page.driver.browser.window_handles.last) do
      find("input[@class='submitsmallstyle']").click
      within_window(page.driver.browser.window_handles.last) do
        find("input[@id='enterhours1']").set(true)
        fill_in 'thetotalhr', :with => '7'
        select funding_source, :from => 'job'
        find(:xpath, "//table/tbody/tr[14]/td/input").click
      end
      find(:xpath, "//table[1]/tbody/tr/td[3]/input").click
    end
  end

end

eat_it_timeforce