require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires a title' do
      # GIVEN
      p = Post.new(body: 'kcsdgsjdgjsdgvjdhs')

      # WHEN
      p.valid?
      # THEN
      expect(p.errors).to have_key(:title)
    end

    it 'requires minimum length of title ' do
      # GIVEN
      p = Post.new(title: 'Hel', body: 'dsisdivbsdvbdshcsdbjk')

      # WHEN
      p.valid?
      # THEN
      expect(p.errors).to have_key(:title)
    end

    it 'requires a body' do
      p = Post.new(title: 'heloehloehlo')
      p.valid?

      expect(p.errors).to have_key(:body)
    end
  end

  describe 'body_snippet' do
    it 'body_snippet should be less than 100 characters' do
      p = Post.new(title: 'hehehehehehe', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet orci bibendum neque luctus, quis dignissim lorem pharetra. Suspendisse quis aliquet nisl. Fusce tempus dictum erat eget consectetur. Donec turpis ligula, accumsan et ex in, pharetra venenatis massa. Integer et eros molestie, accumsan arcu a, finibus leo. Ut et mauris a velit bibendum gravida. Fusce tortor sapien, venenatis non elit quis, luctus euismod arcu. Vivamus tempus enim sit amet diam rhoncus sagittis. Pellentesque et lectus nec lacus vestibulum pulvinar. Ut scelerisque arcu molestie, posuere lorem at, ultricies lacus. Nunc a aliquam lorem. Curabitur hendrerit suscipit urna sed congue. Mauris dictum vel lectus ac rhoncus. Maecenas in augue sed elit tempor accumsan id sit amet ligula. Aliquam erat volutpat.')
      result = p.body_snippet
      expect(result.length).to equal(103)
    end
  end
end
