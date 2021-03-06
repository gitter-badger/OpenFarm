require 'spec_helper'

describe Guides::CreateGuide do
  let(:mutation) { Stages::UpdateStage }
  let(:stage) { FactoryGirl.create(:stage) }
  let(:params) { { user: stage.guide.user, stage: stage } }

  it 'minimally requires a user and a stage' do
    expect(mutation.run(params).success?).to be_true
  end

  it 'updates a users image via URL' do
    image_params = params.merge(image_url: 'http://i.imgur.com/2haLt4J.jpg')
    VCR.use_cassette('mutations/stages/update_stage.rb') do
      results = mutation.run(image_params)
    end
    pending 'Now, go forth an write image stuff.'
  end

end
