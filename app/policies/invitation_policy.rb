class InvitationPolicy < ApplicationPolicy
  attr_reader :user, :object

  def initialize(user, event)
    @user = user
    @object = object
  end

  def new?
     @user === @object.create
  end

  def confirm
  	@user === @object.receiver && @object.event.start_at <= Time.now
  end
end