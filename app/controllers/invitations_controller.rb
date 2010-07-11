class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new params[:invitation]
  end
  
  def create
    params[:invitation][:user] = current_user
    params[:invitation][:email].each do |e|
      Invitation.create params[:invitation].merge(:email => e) if e.present?
    end
    render :text => 'Thank you for inviting those people!'
  end
end