# frozen_string_literal: true

require_relative "format_content/version"
require 'rufus-scheduler'
require 'pry-nav'
require 'pry'
module FormatContent
  class Error < StandardError; end


  def addtimer
    puts "addtimer"
  end

  # Your code goes here...
  def self.push_content(content = "")
    #puts "content:#{content}"
    "content:#{content}"
  end

  def self.add_timer(time = "")
    time = (Time.now + 30).to_s
    puts "before add timer"
    $my_scheduler ||= Rufus::Scheduler.new


    $my_scheduler.in '3s' do
      puts 'Hello... Rufus'
    end
    ff = proc{ |x,y| puts "fff==x:#{x}==y:#{y}==sum:#{x+y}"}
    # binding.pry
    x,y = 10,20
    at_timer(time, x, y, ff)# proc{ puts "fffffffffffffffffffff"}
    #$my_scheduler.every '3s' do
    #  puts "TODO every 3s"
    #end
    #$my_scheduler.join
    puts "end add timer"
  end

  # add once timer
  def self.at_timer(time = "", x, y, block)
    $my_scheduler ||= Rufus::Scheduler.new
      puts "222at_timer:#{time}"
    $my_scheduler.at "#{time}" do
      block.call(x,y)
      puts "at_timer:#{time}"
    end
  end
end
