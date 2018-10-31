# Copyright (c) 2016 Banff International Research Station.
# This file is part of Workshops. Workshops is licensed under
# the GNU Affero General Public License as published by the
# Free Software Foundation, version 3 of the License.
# See the COPYRIGHT file for details and exceptions.

class InvitationsController < ApplicationController
  def index
    redirect_to invitations_new_path
  end

  def new
    @events = future_events
    @invitation = InvitationForm.new
  end

  def create
    @invitation = InvitationForm.new(invitation_params)
    if @invitation.valid?
      send_invitation(@invitation.membership)

      redirect_to invitations_new_path,
        success: 'A new invitation has been sent!'
    else
      @events = future_events
      render :new
    end
  end

  def send_invite
    membership = Membership.find_by_id(membership_param)
    if membership.nil?
      redirect_to root_path, error: 'Membership not found.'
    else
      if policy(membership).send_invitations?
        pause_membership_syncing(membership.event)
        send_invitation(membership, current_user.name)
        redirect_to event_memberships_path(membership.event),
                    success: "Invitation sent to #{membership.person.name}"
      else
        redirect_to event_memberships_path(membership.event),
            error: 'Access to this feature is restricted.'
      end
    end
  end

  private

  def pause_membership_syncing(event)
    event.sync_time = DateTime.now
    event.save
  end

  def send_invitation(member, invited_by = false)
    (invited_by = @current_user.name if @current_user) unless invited_by
    Invitation.new(membership: member,
                   invited_by: invited_by || member.person.name).send_invite
  end

  def future_events
    Event.where("start_date >= ?", expires_before).order(:start_date)
  end

  def expires_before
    Date.today + Invitation::EXPIRES_BEFORE
  end

  def invitation_params
    params.require(:invitation).permit(:event, :email)
  end

  def membership_param
    params['membership_id'].to_i
  end
end
