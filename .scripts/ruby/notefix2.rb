# This simple Ruby script appends an segment of internal Obsidian markdown links to all of the .md files
# in the given directory, until the given date.

require 'date'
require 'dir'
require 'file'

puts 'Beginning script.'
puts 'Input Vault directory as: home/path/to/vault'
vault_path = gets
vault_path.gsub!('\n', '')

puts 'Input stop date as: YYYY-MM-DD'

dir_daily = '/Chronological/Daily Notes/'
dir_weekly = '/Chronological/Weekly Notes/'
# TODO: parse date immediately
STOP_DATE_FILE_NAME = '2024-05-30.md'
STOP_DATE = Date.new(2024, 5, 30)

### script starts here
puts 'Handling daily notes found at:'
full_dir = vault_path + dir_daily
puts full_dir

handle_daily full_dir
puts 'Done with daily notes'

puts 'Handling weekly notes found at:'
full_dir = vault_path + dir_weekly
puts full_dir

handle_weekly full_dir
puts 'Done with weekly notes'

puts 'End of script.'
### script ends here

### methods

def handle_daily(full_path)
  Dir.each_child(full_path) do |file|
    next if file == 'Daily Notes.md'
    break if file == STOP_DATE

    file_path = full_dir + file.gsub('.md', '')
    c = build_daily_content(file_path, file.gsub('.md', ''))
    append_to_file(file_path << '.md', c)
  end
  puts 'finished looping through daily files.'
end

def handle_weekly(file_name)
  week_date = Date.new(STOP_DATE.split('-')[0].to_i, STOP_DATE.split('-')[1].to_i, STOP_DATE.split('-')[2].to_i)
  stop_week = "#{week_date.cyear}-W#{week_date.cweek}.md"
  dir.each_child do |file|
    next if file == 'Weekly Notes.md'
    break if file == stop_week

    file_path = full_dir + file_name.gsub('.md', '')
    c = build_weekly_content(file_path)
    append_to_file(file_path << '.md', c)
  end
  puts 'finished looping through weekly files.'
end

def build_daily_content(file_name)
  day_date = Date.new(file_name.split('-')[0].to_i, file_name.split('-')[1].to_i, file_name.split('-')[2].to_i)
  # yes == yesterday lol
  yes_path = "Chronological/Daily Notes/#{day_date.next_day}"
  tom_path = "Chronological/Daily Notes/#{day_date.prev_day}"
  week_path = "Chronological/Weekly Notes/#{day_date.cyear}-W#{day_date.cweek}"

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
