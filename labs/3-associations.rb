# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts
    dwight = Salesperson.find_by({"first_name" => "Dwight"})
    tim = Contact.find_by({"first_name" => "Tim"})
    pam = Contact.find_by({"first_name" => "Pam"})

    new_activity = Activity.new
    new_activity["salesperson_id"] = dwight["id"]
    new_activity["contact_id"] = tim["id"]
    new_activity["note"] = "This is the first activity note."
    new_activity.save

    new_activity = Activity.new
    new_activity["salesperson_id"] = dwight["id"]
    new_activity["contact_id"] = pam["id"]
    new_activity["note"] = "This is the second activity note."
    new_activity.save

    new_activity = Activity.new
    new_activity["salesperson_id"] = dwight["id"]
    new_activity["contact_id"] = tim["id"]
    new_activity["note"] = "This is the third activity note."
    new_activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):
    all_activities = Activity.where({"salesperson_id" => dwight["id"], "contact_id" => tim["id"]})

    puts "There are #{all_activities.count} activities between Dwight and Tim."

    puts "Activities between Dwight and Tim Cook:"
    for activity in all_activities
        note = activity["note"]
        puts " - #{note}"
    end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):
    all_activities = Activity.where({"salesperson_id" => dwight["id"]})

    puts "There are #{all_activities.count} activities for Dwight."

    puts "Dwight's Activities:"
    for activity in all_activities
        contact = Contact.where({"contact_id" => activity["contact_id"]})["name"]
        note = activity["note"]
        puts "#{contact} - #{note}"
    end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
