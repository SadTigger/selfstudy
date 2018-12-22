require 'mechanize'
require 'nokogiri'


# go to dev.by
# https://companies.dev.by/
# parce all company name
# --word -w
# -w ruby -w postgres
# --size -s
# -w ruby -w postgres -s 10

mechanize = Mechanize.new

page = mechanize.get('https://companies.dev.by/')

test_link = page.link_with(href: '/itechart-group').click

def get_all_links(page)
  page.xpath('//tbody/tr/td[1]/a')
end

def skills(link)
  p link.search('div.left').at('.full-name').children.xpath('text()').to_s.strip.split(', ')
end

def tech_skills(link, skill)
  link.search('div.description.truncate-description').at('div.text').text.include?(skill)
end

def company_name(link)
  p link.search('div.left').at('h1').children.text
end
def employee_info(link)
  employee_count = link.search('div.data-info').first.children.xpath('text()').to_s.split(/\n/).each_slice(3).to_a

  employee_count.each do |array|
    p array.join(' ')
  end
end


def contacts(link)
  contact = []
  link.search('div.sidebar-for-companies').each do |line|
    puts "#{line.at('h2').text}:"
    puts "email #{line.at('.url').children.text}"
  end
end

def check_links(page)
  puts "input skill for check"
  input = gets.chomp
  result = []
  get_all_links(page).first(100).each do |link|
    a = page.link_with(href: "#{link['href']}").click
    next if !tech_skills(a, input)
    result << company_name(a)
  end
  result.empty? ? puts("There is no companies.") : result
end

check_links(page)
