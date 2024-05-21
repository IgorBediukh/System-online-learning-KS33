# frozen_string_literal: true

class ChatsController < ApplicationController
  def index
    @messages = Message.all
  end
end
