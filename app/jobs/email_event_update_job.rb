# Copyright (c) 2016 Banff International Research Station.
# This file is part of Workshops. Workshops is licensed under
# the GNU Affero General Public License as published by the
# Free Software Foundation, version 3 of the License.
# See the COPYRIGHT file for details and exceptions.

# Initiates StaffMailer to confirm RSVPs
class EmailEventUpdateJob < ActiveJob::Base
  queue_as :urgent

  def perform(event_id, params)
    event = Event.find_by_id(event_id)
    StaffMailer.event_update(original_event: event, args: params).deliver_now
  end
end