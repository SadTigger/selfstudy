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

#
array = []
# page.search('table#tablesort.companies tr').each do |el|
#   # next if el.search('td').nil?
#   array << el.search('td')
# end

#
# array.each do |el|
#   p el
# end



# company_name = []
#
# array.each do |el|
#   # p "#{el[0]} el1 -- #{el[1]} el2 -- #{el[2]} el3-- #{el[3]} el4-- #{el[4]} el5-- #{el[5]}"
#   p '*' * 11
#   p el.at('a')
#   p ' '
#   p el.search('a')
#   p ''* 11
#   # p el.search('.t-left')
#   # p '*' * 11
#   # company_name << el[0]
# end

link = mechanize.page.link_with(href: '/yandex').click

# search('div.data-info')
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
    # contact <<  [line.at('.url'), line.at('.street-address')]
    puts "#{line.at('h2').text}:"
    puts "email #{line.at('.url').children.text}"
  end
  # p contact
end

company_name(link)
employee_info(link)
contacts(link)


page.links.each do |link|
  # puts link.text
end
