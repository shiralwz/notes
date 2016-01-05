require 'spec_helper'

describe "notes/edit" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :title => "MyString",
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", note_path(@note), "post" do
      assert_select "input#note_title[name=?]", "note[title]"
      assert_select "input#note_content[name=?]", "note[content]"
      assert_select "input#note_user_id[name=?]", "note[user_id]"
    end
  end
end
