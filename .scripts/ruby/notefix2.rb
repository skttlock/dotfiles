# This simple Ruby script appends an segment of internal Obsidian markdown links to all of the .md files
# in the hard-coded directory

require 'date'
require 'dir'
require 'file'

dir_home = Dir.home
dir_daily = '/Documents/Personal Vault/Chronological/Daily Notes'
dir_weekly = '/Documents/Personal Vault/Chronological/Weekly Notes'
STOP_DATE = '2024-05-30'

### script starts here
puts 'Beginning script.'
puts 'Handling daily notes found at:'
# change process working directory to Daily Notes dir
dir = dir_home + dir_daily
Dir.chdir dir
puts Dir.pwd

handle_daily
puts 'Done with daily notes'

puts 'Handling weekly notes found at:'
# change process working directory to Weekly Notes dir
dir = dir_home + dir_weekly
Dir.chdir dir
puts Dir.pwd

handle_weekly # ? end_week
puts 'Done with weekly notes'
puts 'End of script.'
### script ends here

### methods

def handle_daily
  dir.each_child do |file|
    break if file == STOP_DATE

    c = build_daily_content(file_path.split[1])
    append_to_file(file_path, c)
  end
  puts 'finished looping through daily files.'
end

def handle_weekly
  stop_date = "#{STOP_DATE.cyear}-W#{STOP_DATE.cweek}"
  dir.each_child do |file|
    break if file == stop_date

    c = build_weekly_content(file_path.split[1])
    append_to_file(file_path, c)
  end
  puts 'finished looping through weekly files.'
end

def build_daily_content(date)
  # yes == yesterday lol
  yes_path = "Chronological/Daily Notes/#{date.next_day}.md"
  tom_path = "Chronological/Daily Notes/#{date.prev_day}.md"
  week_path = "Chronological/Weekly Notes/#{date.cyear}-W#{date.cweek}"

  yes_link = "[[#{yes_path}|◀ Yesterday]]"
  tom_link = "[[#{tom_path}|Tomorrow ▶]]"
  week_link = "[[#{week_path}|▲ This Week ▲]]"

  "#{yes_link} | #{week_link} | #{tom_link}"
end

def build_weekly_content(date)
  # lw == last week
  lw_path = "Chronological/Weekly Notes/#{date.cyear}-W#{date.cweek - 1}.md"
  nw_path = "Chronological/Weekly Notes/#{date.cyear}-W#{date.cweek + 1}.md"

  lw_link = "[[#{lw_path}|◀ Yesterday]]"
  nw_link = "[[#{nw_path}|Tomorrow ▶]]"

  "#{lw_link} | #{nw_link}"
end

def append_to_file(file_path, content)
  # no need to check .exists (for each loop)
  f = File.open(file_path)
  f << content
  f.close
end
