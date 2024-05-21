# frozen_string_literal: true

namespace :analyze do
  desc 'Parse website links and store in database'
  task links: :environment do
    # URL of the site that will be parsed
    url = 'https://www.upwork.com/resources/top-sites-for-online-education-and-learning'

    # Initialize the Mechanize object to interact with the web page
    agent = Mechanize.new
    page = agent.get(url)
    doc = Nokogiri::HTML(page.body)

    # Parsing data and saving it to an array
    elements = doc.css('ol[role="list"] li a')

    # Loop through elements and create business models
    elements.each_with_index do |element, index|
      # Getting the text from the anchor tag
      data1 = element.text.strip

      # Create or update BusinessModel object
      BusinessModel.create(name: data1, index: index + 1)
    rescue StandardError => e
      # Handling possible errors and displaying a message
      puts "Error processing element: #{e.message}"
    end

    # Display a message about the successful completion of work
    puts 'Data was successfully saved to database'
  end
end
