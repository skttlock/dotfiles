include 'dir'
include 'file'
include 'date'

# passed in: file.gsub('.md', ''):w
def make_daily_content(date)
  today = Date.parse(date)
  yesterday = today.next_day(-1).to_s
  tomorrow = today.next_day.to_s
  week = "#{today.cyear}-W#{today.cweek}"

  "[[Chronological/Daily Notes/#{yesterday}|Yesterday]] |
    [[Chronological/Weekly Notes/#{week}|This Week]] |
    [[Chronological/Daily Notes/#{tomorrow}|Tomorrow]]"
end
