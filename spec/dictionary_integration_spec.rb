require("capybara/rspec")
require("./app")
require("dictionary_lookup")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the dictionary path", {:type => :feature}) do
  it("Create a new word and view that word shown on the page.") do
    visit("/")
    fill_in("word_input", :with => "Wolf")
    click_button("Add Word")
    expect(page).to have_content("Wolf")
    Word.clear_words
  end

  it("Create a new word and adds multiple definitions.") do
    visit("/")
    fill_in("word_input", :with => "Wolf")
    click_button("Add Word")
    expect(page).to have_content("Wolf")
    click_link("Wolf")
    expect(page).to have_content("Wolf")
    fill_in("definition_input", :with => "A small four legged mammal.")
    click_button("Add Definition!")
    fill_in("definition_input", :with => "An animal with long ears and large hind legs.")
    click_button("Add Definition!")
    expect(page).to have_content("A small four legged mammal.")
    expect(page).to have_content("An animal with long ears and large hind legs.")
    Word.clear_words
  end

  it("Deletes a word from the database.") do
    visit("/")
    fill_in("word_input", :with => "Wolf")
    click_button("Add Word")
    expect(page).to have_content("Wolf")
    click_link("Wolf")
    click_link("Delete Word")
    expect(page).to have_content("Word Deleted!")
    Word.clear_words
  end

  it("Alphabetizes several words on the main page.") do
    visit("/")
    fill_in("word_input", :with => "Bee")
    click_button("Add Word")
    fill_in("word_input", :with => "Camel")
    click_button("Add Word")
    fill_in("word_input", :with => "Zebra")
    click_button("Add Word")
    fill_in("word_input", :with => "Ant")
    click_button("Add Word")
    click_link("Alphabetize Lasso")
    expect(page).to have_content("Ant Bee Camel Zebra")
    Word.clear_words
  end

  it("Searches for a word from the database and navigates to that word's page.") do
    visit("/")
    fill_in("word_input", :with => "Bee")
    click_button("Add Word")
    fill_in("word_input", :with => "Camel")
    click_button("Add Word")
    fill_in("search_input", :with => "Camel")
    click_button("Search for Word")
    expect(page).to have_content("Camel")
    Word.clear_words
  end

end
