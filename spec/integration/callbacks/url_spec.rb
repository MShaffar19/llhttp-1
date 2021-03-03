# frozen_string_literal: true

require_relative "../support/context/parsing"

RSpec.describe "callbacks: url" do
  include_context "parsing"

  shared_examples "examples" do
    let(:extension) {
      proc {
        def on_url(*args)
          @calls << [:on_url, args]
        end
      }
    }

    it "is called" do
      parse

      expect(delegate.calls).to eq([
        [:on_url, ["/"]]
      ])
    end
  end

  context "request" do
    let(:type) {
      :request
    }

    include_examples "examples"
  end
end
