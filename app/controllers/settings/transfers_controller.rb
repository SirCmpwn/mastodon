# frozen_string_literal: true

class Settings::TransfersController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :set_account

  def show
    @new_account = nil
    @error = nil
  end

  def create
    @new_account = params[:new_account]
    @error = nil
    if not @new_account or @new_account == ''
      @error = I18n.t('transfer.not_blank')
      render action: :show and return
    end
    if not @new_account =~ /.*@.*/
      @error = I18n.t('transfer.hint')
      render action: :show and return
    end
    render action: :show
  end

  private

  def set_account
    @account = current_user.account
  end
end
