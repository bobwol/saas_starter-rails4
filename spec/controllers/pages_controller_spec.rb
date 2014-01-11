require 'spec_helper'

describe HighVoltage::PagesController, '#show' do
  %w(home features pricing about contact).each do |page|
    context 'on GET to /#{page}' do
      before do
        get :show, id: page
      end
      it { should render_template(page) }
    end
  end
end
