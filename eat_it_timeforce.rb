require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'pry'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'https://www.gotimeforce.com'

include Capybara::DSL

def append_jquery
  page.execute_script <<-JAVASCRIPT
    var jQ = document.createElement('script');
    jQ.language = 'JavaScript';
    jQ.type = 'text/javascript';
    jQ.src = 'https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js';
    document.getElementsByTagName('body')[0].appendChild(jQ);
  JAVASCRIPT
end

def mark_links
  page.execute_script <<-JAVASCRIPT
    $(function() {
      $('.TCActiveDayCell').parent().children('th').each(function(index, elem) {
        if($(elem).text() != 'S') {
          var clickable = $( $('a.TCDayNormalBold, a.TCDayNormalBoldModified')[index] );
          
          if(!clickable.hasClass('a.TCDayNormalBoldModified') && clickable.text() == '0.00') {
            clickable.addClass('weekday-hours-link');
          }
        }
      });
    });
  JAVASCRIPT
end

def eat_it_timeforce
  username = ''
  password = ''
  funding_source = ''

  visit '/qqest/login/login.asp'
  fill_in 'username', :with => username
  fill_in 'Password', :with => password
  fill_in 'CompanyCode', :with => 'adler'
  click_on 'Login'
  
  while true do
    append_jquery
    mark_links
    weekday = page.find('.weekday-hours-link') rescue nil
    break unless weekday
    weekday.click
    
    within_window(page.driver.browser.window_handles.last) do
      add_hours = page.find('.headerRow td:nth-child(1) .submitsmallstyle')
      add_hours.click
      fill_in 'thetotalhr', :with => '7'
      select funding_source, :from => 'job'
      submit_button = page.find('.headerRow input')
      submit_button.click
    end
  end
end

eat_it_timeforce