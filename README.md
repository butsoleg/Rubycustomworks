# Workshops

"Workshops" is a web-based conference/workshop management application, built with [Ruby on Rails](http://rubyonrails.org). 
A _workshop_ is like a conference, only with less people, typically experts in a subject
domain who are invited to an event to share their research with peers. This software is intended for institutions/organizations
who host workshops.

### Current Features
* Workshop data is imported via calls to an external API.
* Role-based access control allowing different levels of privilege between admin, staff, organizers and participants.
* Staff and admin users can login, and Workshop organizers can signup and login.
* Shows index listings of all events, future events, past events, events by location, and by year.
* Background jobs to update event membership data from external data source.
* Shows workshop members, plus their details to varying degrees depending on user's privilege level.
* Staff & organizers can click a button to send email all to workshop participants.
* Staff can edit events if the staff user's location matches the event location.
* Organizers can edit some of their event's data.
* Staff can edit default workshop schedule templates.
* Organizers can easily edit and publish the schedules of their workshop(s).
* Staff get email notifications when schedules of currently running workshops are updated.
* Default times for new schedule items are estimated based on previous schedule entries, to reduce data entry time.
* Authenticated JSON API for [an external video recording system](http://www.birs.ca/facilities/automated-video) to update lecture records.
* Public access to workshop event information and schedules via JSON.

### Future Features:
* Application settings to be stored in the database, with UI for staff/admin to change them.
* Staff and admin can create new events.
* Staff and Organizers can add and invite members to their workshop.
* Invitations will include a one-click RSVP link, allowing members to setup profiles, etc..
* Staff can assign hotel rooms and manage other hospitality details for workshop participants.
* Admin users can manage other users (add/remove/change passwords, etc) .
* An email system to facilitate communication between various parties, including email templates and scheduled sending.
* When organizers schedule a participant to give a talk, members get notified with a link to fill in the talk title and abstract.
* Drag & drop interface to re-arrange schedule items.
* Interface for admin users to manage application settings and permissions.
* Addition of a forum/mail list software for each workshop. Considering embedding [Discourse](http://www.discourse.org), with an updated editor to support mathematics.
* Crowd-sourcing feature for workshop participants to post open problems to the public, soliciting solutions.

### License:
Workshops is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, version 3 of the License. See the [COPYRIGHT](COPYRIGHT)
file for details and exceptions.
