require 'spec_helper'

describe "subscriptions/index" do
  before(:each) do
    assign(:subscriptions, [
      stub_model(Subscription,
        :index => "Index",
        :new => "New",
        :create => "Create",
        :update => "Update",
        :destroy => "Destroy"
      ),
      stub_model(Subscription,
        :index => "Index",
        :new => "New",
        :create => "Create",
        :update => "Update",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    assert_select "tr>td", :text => "Update".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
