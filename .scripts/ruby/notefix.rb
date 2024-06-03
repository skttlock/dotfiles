# use inside irb

require 'dir'
require 'file'
require 'date'

# methods
# passed in: file.gsub('.md', '')
def make_daily_content(date)
  today = Date.parse(date)
  yesterday = today.next_day(-1).to_s
  tomorrow = today.next_day.to_s
  week = "#{today.cwyear}-W#{today.cweek}"

  "[[Chronological/Daily Notes/#{yesterday}|Yesterday]] | [[Chronological/Weekly Notes/#{week}|This Week]] | [[Chronological/Daily Notes/#{tomorrow}|Tomorrow]]"
end

# passed in: file.gsub('.md', '')
def make_weekly_content(date)
  this_wk = Date.parse(date)
  last_wk = "#{this_wk.cwyear}-W#{this_wk.next_day(-7).cweek}"
  next_wk = "#{this_wk.cwyear}-W#{this_wk.next_day(7).cweek}"

  "[[Chronological/Weekly Notes/#{last_wk}|Last Week]] | [[Chronological/Weekly Notes/#{next_wk}|Next Week]]"
end

def test_daily_loop(path)
  Dir.each_child path do |fname|
    next if fname == 'Daily Notes.md'
    break if fname == STOP_DATE_FILE

    file_path = "#{DAY_PATH}/#{fname}"
    puts '-----------'
    puts fname
    puts file_path
    puts make_daily_content fname
  end
end

def test_weekly_loop(path)
  Dir.each_child path do |fname|
    next if fname == 'Weekly Notes.md'
    next if fname == 'Projects of the Week.md'
    break if fname == STOP_WEEK

    file_path = "#{WEEK_PATH}/#{fname}"
    puts '-----------'
    puts fname
    puts file_path
    puts make_weekly_content fname
  end
end

def append_daily_loop(path)
  Dir.each_child path do |fname|
    next if fname == 'Daily Notes.md'
    break if fname == STOP_DATE_FILE

    file_path = "#{DAY_PATH}/#{fname}"
    puts file_path
    open(file_path, 'a') do |f|
      f << make_daily_content(fname)
    end
  end
end

def append_weekly_loop(path)
  Dir.each_child path do |fname|
    next if fname == 'Weekly Notes.md'
    next if fname == 'Projects of the Week.md'
    break if fname == STOP_WEEK

    file_path = "#{WEEK_PATH}/#{fname}"
    puts file_path
    open(file_path, 'a') do |f|
      f << make_weekly_content(fname)
    end
  end
end

# def test_loop(path, is_daily)
# arr = Dir.children path
# if is_daily
#   arr.delete('Daily Notes.md')
#   arr.each do |fname|
#     next if fname == STOP_DATE_FILE
#   end
# else # is weekly
#   arr.delete('Weekly Notes.md')
#   arr.each do |fname|
#   end
# end
# end

# setup variables
puts 'input stop date in this format: YYYY-MM-DD'
input = gets.gsub!("\n", '')
input_date = Date.parse(input)
STOP_DATE_FILE = "#{input_date}.md"
puts STOP_DATE_FILE
STOP_WEEK = "#{input_date.cwyear}-W#{input_date.cweek + 1}.md"
puts STOP_WEEK
HOME = Dir.home
puts HOME

puts 'input path to directory containing weekly & daily notes directory from the above home'
path_to_dirs = gets
PATH = HOME + path_to_dirs
PATH.gsub!("\n", '')
DAY_PATH = "#{PATH}/Daily Notes/"
WEEK_PATH = "#{PATH}/Weekly Notes/"
puts PATH
puts DAY_PATH
puts WEEK_PATH
