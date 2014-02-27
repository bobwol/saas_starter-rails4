require 'spec_helper'

describe "subscriptions/edit" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :index => "MyString",
      :new => "MyString",
      :create => "MyString",
      :update => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscription_path(@subscription), "post" do
      assert_select "input#subscription_index[name=?]", "subscription[index]"
      assert_select "input#subscription_new[name=?]", "subscription[new]"
      assert_select "input#subscription_create[name=?]", "subscription[create]"
      assert_select "input#subscription_update[name=?]", "subscription[update]"
      assert_select "input#subscription_destroy[name=?]", "subscription[destroy]"
    end
  end
end
