json.array!(@memberships['Confirmed']) do |membership|
  json.extract! membership, :id, :event_id, :person_id, :arrival_date, :departure_date, :attendance, :role, :replied_at
end
